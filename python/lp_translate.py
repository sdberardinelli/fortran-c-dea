#!/usr/bin/env python
import re

def isfloat(x):
    try:
        a = float(x)
    except ValueError:
        return False
    else:
        return True

def isint(x):
    try:
        a = float(x)
        b = int(a)
    except ValueError:
        return False
    else:
        return a == b
        
def remove_comments(ifname):
    with open(ifname) as ifile:
        buffer = ''
        c = ' ';
        state = 0
        while c:
            c = ifile.read(1)
#            if ord(c) < 31 or ord(c) > 127:
#                continue
            if state == 0:
                if c == '/':
                    state = 1
                else:
                    state = 0
            elif state == 1:
                if c == '*':
                    state = 2
                else:
                    state = 0            
            elif state == 2:
                if c == '*':
                    state = 3
                else:
                    state = 2
            elif state == 3:
                if c == '/':
                    state = 4
                else:
                    state = 2
            elif state == 4:
                state = 0
            else:
                print "error?"

            if state == 0:
                buffer = buffer + c
                
        return buffer    
    
def lp_translate (ifname,ofname):
    buffer = remove_comments(ifname)
    
    buffer = buffer.replace("\\\n", "")
    
    outfile_constants = open('lp_solve_constants.f90','w')
    outfile_constants.write("module lp_solve_constants\n")
    outfile_constants.write("    use iso_c_binding\n")
    outfile_constants.write("    implicit none\n")
    
    outfile_types = open('lp_solve_types.f90','w')
    outfile_types.write("module lp_solve_types\n")
    outfile_types.write("    use iso_c_binding\n")
    outfile_types.write("    implicit none\n")    
    
    outfile = open('lp_solve.f90','w')
    outfile.write("module lp_solve\n")
    outfile.write("    use iso_c_binding\n")
    outfile.write("    implicit none\n")
    outfile.write("        interface\n")
    
    typedef = ''
    typedef_add = False
    
    for line in buffer.split('\n'):
        if line == '':
            continue
        line = re.sub(r"^# +|^ +# +| +#", "#", line)
        
        if line[0] == '#':
            str = line[1:].split()     
            if str[0] == "define":
                if len(str) > 2:
                    str1 = ''.join(str[2:])

                    if "->" in str1 or "|" in str1 or "~" in str1 or "^" in str1 or "&" in str1 or ">" in str1 or "<" in str1:
                        continue
                    
                    if "\"" in str1:
                        str2 = "character(*), parameter :: "
                    elif isint(str1):
                        str2 = "integer(c_int), parameter :: "
                    else:
                        if isfloat(str1):
                            str2 = "real(c_double),paramter :: "
                        else:
                            str2 = "integer(c_int), parameter :: "
                    str3 = "        "+str2+str[1].strip()+" = "+str1.strip()+'\n'
                    outfile_constants.write(str3)
        else:
            if "typedef" in line or "struct" in line:
                if "struct" in line:
                    typedef_add = True
            else:
                if re.compile(r"^.*\(.*\).*$").match(line):
                    line = re.sub(r"__[a-zA-Z|_]+ ","",line.replace(";",""))
                    line = line.replace("("," ( ")
                    line = line.replace(")"," )")
                    line = re.sub(r"\*+ ","*",line)
                    line = line.replace("STATIC","")
                    
                    params =  re.match(r"^.*\((.*)\).*$",line)
                    
                    if line.split()[0] == 'void':
                        name = line.split()[1]
                        tmp = ''
                        
                        for i in params.group(1).split(","):
                            tmp = tmp + re.sub(r"\*+","",i.split()[-1]) + ','
                        
                        list = ["            subroutine ", name, "(", tmp[:-1], ") bind(C,name=\"",name,"\")"]
                        outfile.write( "".join(list)+'\n' )
                        outfile.write("                use iso_c_binding\n")
                        
                        tmp = ''
                        list = []
                        for i in params.group(1).split(","):
                            if i.split()[0] == 'int':
                            
                                count = i.split()[-1].count('*') 
                                if count == 1:
                                    tmp = "type(c_ptr), value :: "
                                elif count == 2:
                                    tmp = "type(c_ptr) :: "
                                elif count > 2:
                                    print "<<ERROR? there are",count,"ptrs>>"
                                else:
                                    tmp = "integer(c_int), value ::"

                                list.append("                    " + tmp + re.sub(r"\*+","",i.split()[-1]))
                                
                            elif i.split()[0] == 'char':

                                if i.split()[-1].count('*') > 0:
                                    tmp  = "character(c_char) :: " + re.sub(r"\*+","",i.split()[-1]) + "(*)"
                                else:
                                    tmp  = "character(c_char), value :: " + re.sub(r"\*+","",i.split()[-1])
                                    
                                list.append("                    " + tmp)
                                
                            elif i.split()[0] == 'REAL':
                            
                                if i.split()[-1].count('*') > 0:
                                    tmp  = "real(c_double) :: " + re.sub(r"\*+","",i.split()[-1]) + "(*)"
                                else:
                                    tmp  = "real(c_double), value :: " + re.sub(r"\*+","",i.split()[-1]) 
                                    
                                list.append("                    " + tmp)
                                
                            elif i.split()[0] == 'MYBOOL':
                            
                                if i.split()[-1].count('*') > 0:
                                    tmp  = "integer(c_int) :: " + re.sub(r"\*+","",i.split()[-1]) + "(*)"
                                else:
                                    tmp  = "integer(c_int), value :: " + re.sub(r"\*+","",i.split()[-1])
                                    
                                list.append("                    " + tmp + ' ! MYBOOL')
                                
                            elif i.split()[0] == 'COUNTER':
                                if i.split()[-1].count('*') > 0:
                                    tmp  = "integer(c_long) :: " + re.sub(r"\*+","",i.split()[-1])  + "(*)"
                                else:
                                    tmp  = "integer(c_long), value :: " + re.sub(r"\*+","",i.split()[-1])
                                    
                                list.append("                    " + tmp)
                            
                            else:
                                if i.split()[-1].count('*') > 0:
                                    tmp  = "type(c_ptr), value :: " + re.sub(r"\*+","",i.split()[-1])
                                else:
                                    tmp  = "type(" + i.split()[0] + ")" + re.sub(r"\*+","",i.split()[-1])
                                list.append("                    " + tmp)
                                
                        for i in list:
                            outfile.write(i + '\n')
                            
                        outfile.write("            end subroutine\n")
                        
                    else:
                        name = re.sub(r"\*+","",line.split()[1])
                        tmp = ''
                        
                        for i in params.group(1).split(","):
                            tmp = tmp + re.sub(r"\*+","",i.split()[-1]) + ','
                        
                        list = ["            function ", name, "(", tmp[:-1], ") bind(C,name=\"",name,"\")"]
                        outfile.write( "".join(list)+'\n' )
                        outfile.write("                use iso_c_binding\n")
                    
                        tmp = ''
                        list = []
                        for i in params.group(1).split(","):
                            if i.split()[0] == 'int':
                            
                                count = i.split()[-1].count('*') 
                                if count == 1:
                                    tmp = "type(c_ptr), value :: "
                                elif count == 2:
                                    tmp = "type(c_ptr) :: "
                                elif count > 2:
                                    print "<<ERROR? there are",count,"ptrs>>"
                                else:
                                    tmp = "integer(c_int), value ::"

                                list.append("                    " + tmp + re.sub(r"\*+","",i.split()[-1]))
                                
                            elif i.split()[0] == 'char':

                                if i.split()[-1].count('*') > 0:
                                    tmp  = "character(c_char) :: " + re.sub(r"\*+","",i.split()[-1]) + "(*)"
                                else:
                                    tmp  = "character(c_char), value :: " + re.sub(r"\*+","",i.split()[-1] )
                                    
                                list.append("                    " + tmp)
                                
                            elif i.split()[0] == 'REAL':
                            
                                if i.split()[-1].count('*') > 0:
                                    tmp  = "real(c_double) :: " + re.sub(r"\*+","",i.split()[-1]) + "(*)"
                                else:
                                    tmp  = "real(c_double), value :: " + re.sub(r"\*+","",i.split()[-1])
                                    
                                list.append("                    " + tmp)
                                    
                            elif i.split()[0] == 'MYBOOL':
                            
                                if i.split()[-1].count('*') > 0:
                                    tmp  = "integer(c_int) :: " + re.sub(r"\*+","",i.split()[-1]) + "(*)"
                                else:
                                    tmp  = "integer(c_int), value :: " + re.sub(r"\*+","",i.split()[-1])
                                    
                                list.append("                    " + tmp + ' ! MYBOOL')
                                
                            elif i.split()[0] == 'COUNTER':
                                if i.split()[-1].count('*') > 0:
                                    tmp  = "integer(c_long) :: " + re.sub(r"\*+","",i.split()[-1]) + "(*)"
                                else:
                                    tmp  = "integer(c_long), value :: " + re.sub(r"\*+","",i.split()[-1])
                                    
                                list.append("                    " + tmp)
                            
                            else:
                                if i.split()[-1].count('*') > 0:
                                    tmp  = "type(c_ptr), value :: " + re.sub(r"\*+","",i.split()[-1])
                                else:
                                    tmp  = "type(" + i.split()[0] + ")" + re.sub(r"\*+","",i.split()[-1])
                                list.append("                    " + tmp)
                                    
 
                        for i in list:
                            outfile.write(i+'\n')
                            
                        outfile.write("                    ")
                        if line.split()[0] == 'int':
                            outfile.write( 'integer(c_int) :: '+ name + '\n')
                        elif line.split()[0] == 'char':
                            outfile.write( 'character(c_char) :: '+ name + '\n' )
                        elif line.split()[0] == 'MYBOOL':
                            outfile.write( 'integer(c_int) :: '+ name + ' !MYBOOL \n' )
                        elif line.split()[0] == 'COUNTER':
                            outfile.write( 'integer(c_long) :: '+ name + '\n' )
                        else:
                            if '*' in line.split()[1]:
                                outfile.write( 'type(c_ptr) :: ' + name + '\n' )
                            else:
                                outfile.write( 'type(' + line.split()[0] + ') :: ' + name + '\n' )
                                
                        outfile.write("            end function\n")
                    
            if typedef_add:
                typedef = typedef + line + '\n'
                
            if typedef_add and "}" in line and ";" in line:
                typedef_add = False
                str4 = typedef.split('\n')
                
                if "typedef" not in str4[0]:
                    name = str4[0].split()[-1].replace("_","").strip()
                else:
                    name = str4[-2].replace("}","")
                    name = name.replace(";","").strip()
                str5 =  "        type, bind(c) :: " + name + "\n"
                outfile_types.write(str5);
                for i in str4[2:-2]:
                    str6 = i.replace(";","").split()
                    if len(str6) < 1:
                        continue
                    if i.count('*') > 0:
                        str5 = "            type(c_ptr) :: " + re.sub(r"\*+", "", str6[-1]) + "\n"
                    else:
                        if "int" in str6[0]:
                            str5 = "            integer(c_int) ::" + str6[-1] + "\n"
                        elif "MYBOOL" in str6[0]:
                            str5 = "            integer(c_int) ::" + str6[-1] + " !MYBOOL\n"
                        elif "REAL" in str6[0]:
                            str5 = "            real(c_double) ::" + str6[-1]+ "\n"
                        elif "COUNTER" in str6[0]:
                            str5 = "            integer(c_long) ::" + str6[-1]+ "\n"
                    outfile_types.write(str5);
                str5 = "        end type " + name + "\n"
                outfile_types.write(str5);
                typedef = ''
    
    outfile.write("    end interface\n");
    outfile.write("end module lp_solve\n")
    outfile.close()
    
    outfile_constants.write("end module lp_solve_constants\n")
    outfile_constants.close()
    
    outfile_types.write("end module lp_solve_types\n")
    outfile_types.close()    
    