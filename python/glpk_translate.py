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
    
def glpk_translate (ifname,ofname):
    buffer = remove_comments(ifname)
        
    buffer = buffer.replace("\\\n", "")
    
    outfile_constants = open('glpk_constants.f90','w')
    outfile_constants.write("module glpk_constants\n")
    outfile_constants.write("    use iso_c_binding\n")
    outfile_constants.write("    implicit none\n")
    
    outfile_types = open('glpk_types.f90','w')
    outfile_types.write("module glpk_types\n")
    outfile_types.write("    use iso_c_binding\n")
    outfile_types.write("    implicit none\n")    
    
    outfile = open('glpk.f90','w')
    outfile.write("module glpk\n")
    outfile.write("    use iso_c_binding\n")
    outfile.write("    implicit none\n")
    outfile.write("        interface\n")
    
    typedef = ''
    typedef_add = False
    
    types = []
    
    for line in buffer.split('\n'):
        if line == '':
            continue
        line = re.sub(r"^# +|^ +# +| +#", "#", line)
       
        line = re.sub(r",\n", ",", line)
        
        if line[0] == '#':
            str0 = line[1:].split()     
            if str0[0] == "define":
                if len(str0) > 2:
                    str1 = ''.join(str0[2:])

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
                    
                    try:
                        str3 = "        "+str2+str0[1].strip()+" = "+str(int(str1.strip(),16))+'\n'
                        outfile_constants.write(str3)                        
                    except ValueError:
                        str3 = ''
        else:
            if "typedef" in line or "struct" in line:
                if "struct" in line and ';' not in line:
                    typedef_add = True
            else:
                if re.compile(r"^.*\(.*\).*$").match(line) and not typedef_add:
                    line = line.replace("("," ( ")
                    line = line.replace(")"," )")
                    line = line.replace(")"," )")
                    line =  re.sub(r" +"," ",line)
                    
                    params =  re.match(r"^.*\((.*)\).*$",line)
                    
                    if line.split()[0] == 'void':
                        name = re.sub(r"\*+","",line.split()[1])
                        tmp = ''
                        list = []
                        
                        using_type = False
                        
                        for i in params.group(1).split(","):
                            if i.split()[-1] == 'void':
                                tmp = tmp + ','
                            else:
                                tmp1 = re.sub(r"\*+","",i.split()[-1]) 
                                tmp1 = re.sub(r"\[(.*)\]","",tmp1)
                                
                                if any(i.split()[0] in s for s in types):
                                    using_type = True
                                    
                                tmp = tmp + tmp1 + ','
                            
                                                    
                        list = ["            subroutine ", name, "(", tmp[:-1], ") bind(C,name=\"",name,"\")"]
                        outfile.write( "".join(list)+'\n' )
                        outfile.write("                use iso_c_binding\n")
                        
                        if using_type:
                            outfile.write("                use glpk_types\n")
                        
                        list = []
                        
                        for i in params.group(1).split(","):

                            if i.split()[0] == 'const':
                                idx = 1
                            else:
                                idx = 0
                                
                            if i.split()[idx] == 'void':
                                pass
                            elif i.split()[idx] == 'int':
                                if i.split()[-1].count('*') > 0 or ('[' in i.split()[-1] and ']' in i.split()[-1]):
                                    tmp1 = re.sub(r"\*+","",i.split()[-1]) 
                                    tmp1 = re.sub(r"\[(.*)\]","",tmp1)                                 
                                    tmp  = "integer(c_int) :: " + tmp1 + "(*)"
                                else:
                                    tmp1 = re.sub(r"\*+","",i.split()[-1]) 
                                    tmp1 = re.sub(r"\[(.*)\]","",tmp1)                                 
                                    tmp  = "integer(c_int), value :: " + tmp1
                                    
                                list.append("                    " + tmp)                            
                            elif i.split()[idx] == 'double':
                                if i.split()[-1].count('*') > 0 or ('[' in i.split()[-1] and ']' in i.split()[-1]):
                                    tmp1 = re.sub(r"\*+","",i.split()[-1]) 
                                    tmp1 = re.sub(r"\[(.*)\]","",tmp1)                                 
                                    tmp  = "real(c_double) :: " + tmp1 + "(*)"
                                else:
                                    tmp1 = re.sub(r"\*+","",i.split()[-1]) 
                                    tmp1 = re.sub(r"\[(.*)\]","",tmp1)                                 
                                    tmp  = "real(c_double), value :: " + tmp1
                                    
                                list.append("                    " + tmp)  
                            elif i.split()[idx] == 'char':
                                if i.split()[-1].count('*') > 0 or ('[' in i.split()[-1] and ']' in i.split()[-1]):
                                    tmp1 = re.sub(r"\*+","",i.split()[-1]) 
                                    tmp1 = re.sub(r"\[(.*)\]","",tmp1)                                 
                                    tmp  = "character(c_char) :: " + tmp1 + "(*)"
                                else:
                                    tmp1 = re.sub(r"\*+","",i.split()[-1]) 
                                    tmp1 = re.sub(r"\[(.*)\]","",tmp1)                                 
                                    tmp  = "character(c_char), value :: " + tmp1
                                list.append("                    " + tmp)  
                            else:
                                if using_type:
                                    tmp1 = re.sub(r"\*+","",i.split()[-1]) 
                                    tmp1 = re.sub(r"\[(.*)\]","",tmp1)                                   
                                    tmp  = "type(" + i.split()[0] + ") :: " + tmp1
                                else:
                                    if i.split()[-1].count('*') > 0:
                                        tmp1 = re.sub(r"\*+","",i.split()[-1]) 
                                        tmp1 = re.sub(r"\[(.*)\]","",tmp1)                                   
                                        tmp  = "type(c_ptr), value :: " + tmp1
                                    else:
                                        tmp1 = re.sub(r"\*+","",i.split()[-1]) 
                                        tmp1 = re.sub(r"\[(.*)\]","",tmp1)                                   
                                        tmp  = "type(" + i.split()[0] + ") :: " + tmp1

                                list.append("                    " + tmp)                   
                                
                        for i in list:
                            outfile.write(i + '\n')
                            
                        outfile.write("            end subroutine\n")
                        
                    else:
                    
                        if line.split()[0] == 'const':
                            line_idx = 1
                        else:
                            line_idx = 0
                            
                        name = re.sub(r"\*+","",line.split()[line_idx+1])
                        tmp = ''
                        list = []

                        
                        for i in params.group(1).split(","):
                            if i.split()[-1] == 'void':
                                tmp = tmp + ','
                            else:
                                tmp1 = re.sub(r"\*+","",i.split()[-1]) 
                                tmp1 = re.sub(r"\[(.*)\]","",tmp1) 
                                tmp = tmp + re.sub(r"\*+","",tmp1) + ','
                                
                        list = ["            function ", name, "(", tmp[:-1], ") bind(C,name=\"",name,"\")"]
                        outfile.write ( "".join(list)+'\n' )
                        outfile.write ("                use iso_c_binding\n")
                        
                        list = []
                        
                        for i in params.group(1).split(","):

                            if i.split()[0] == 'const':
                                idx = 1
                            else:
                                idx = 0
                                
                            if i.split()[idx] == 'void':
                                pass
                            elif i.split()[idx] == 'int':
                                if i.split()[-1].count('*') > 0 or ('[' in i.split()[-1] and ']' in i.split()[-1]):
                                    tmp1 = re.sub(r"\*+","",i.split()[-1]) 
                                    tmp1 = re.sub(r"\[(.*)\]","",tmp1)                                 
                                    tmp  = "integer(c_int) :: " + tmp1 + "(*)"
                                else:
                                    tmp1 = re.sub(r"\*+","",i.split()[-1]) 
                                    tmp1 = re.sub(r"\[(.*)\]","",tmp1)                                 
                                    tmp  = "integer(c_int), value :: " + tmp1
                                    
                                list.append("                    " + tmp)                            
                            elif i.split()[idx] == 'double':
                                if i.split()[-1].count('*') > 0 or ('[' in i.split()[-1] and ']' in i.split()[-1]):
                                    tmp1 = re.sub(r"\*+","",i.split()[-1]) 
                                    tmp1 = re.sub(r"\[(.*)\]","",tmp1)                                 
                                    tmp  = "real(c_double) :: " + tmp1 + "(*)"
                                else:
                                    tmp1 = re.sub(r"\*+","",i.split()[-1]) 
                                    tmp1 = re.sub(r"\[(.*)\]","",tmp1)                                 
                                    tmp  = "real(c_double), value :: " + tmp1
                                    
                                list.append("                    " + tmp)  
                            elif i.split()[idx] == 'char':
                                if i.split()[-1].count('*') > 0 or ('[' in i.split()[-1] and ']' in i.split()[-1]):
                                    tmp1 = re.sub(r"\*+","",i.split()[-1]) 
                                    tmp1 = re.sub(r"\[(.*)\]","",tmp1)                                 
                                    tmp  = "character(c_char) :: " + tmp1 + "(*)"
                                else:
                                    tmp1 = re.sub(r"\*+","",i.split()[-1]) 
                                    tmp1 = re.sub(r"\[(.*)\]","",tmp1)                                 
                                    tmp  = "character(c_char), value :: " + tmp1
                                list.append("                    " + tmp)  
                            else:
                                if i.split()[-1].count('*') > 0:
                                    tmp1 = re.sub(r"\*+","",i.split()[-1]) 
                                    tmp1 = re.sub(r"\[(.*)\]","",tmp1)                                   
                                    tmp  = "type(c_ptr), value :: " + tmp1
                                else:
                                    tmp1 = re.sub(r"\*+","",i.split()[-1]) 
                                    tmp1 = re.sub(r"\[(.*)\]","",tmp1)                                   
                                    tmp  = "type(" + i.split()[0] + ") :: " + tmp1

                                list.append("                    " + tmp)
                                    
                        for i in list:
                            outfile.write(i+'\n')
                            
                        outfile.write("                    ")
                        if line.split()[line_idx+0] == 'int':
                            outfile.write( 'integer(c_int) :: '+ name + '\n')
                        elif line.split()[line_idx+0] == 'char':
                            outfile.write( 'character(c_char) :: '+ name + '\n' )
                        elif line.split()[line_idx+0] == 'double':
                            outfile.write( 'real(c_double) :: '+ name + ' \n' )
                        else:
                            if '*' in line.split()[line_idx+1]:
                                outfile.write( 'type(c_ptr) :: ' + name + '\n' )
                            else:
                                outfile.write( 'type(' + line.split()[line_idx+0] + ') :: ' + name + '\n' )
                                
                        outfile.write ("            end function\n")
                    
            if typedef_add:
                typedef = typedef + line + '\n'
                
            if typedef_add and "}" in line and ";" in line:
                typedef_add = False
                str4 = typedef.split('\n')
                
                if "typedef" not in str4[0]:
                    name = str4[0].split()[-1].strip()
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
                        if re.compile(r"^.*\(.*\).*$").match(i):
                            func_name = re.sub(r"\*+","",re.findall(r'\((.*?)\)',i)[0]).strip().rstrip()
                            str5 = "            type(C_FUNPTR) :: " + func_name + "\n"
                            
                        else:
                            str5 = "            type(c_ptr) :: " + re.sub(r"\*+", "", str6[-1]) + "\n"
                    else:
                        tmp1 = str6[-1]
 
                        str5 = "            "
                        
                        if "int" in str6[0]:
                            str5 = str5 + "integer(c_int)"
                        elif "char" in str6[0]:
                            str5 = str5 + "charater(c_char)"
                        elif "double" in str6[0]:
                            str5 = str5 + "real(c_double)"
                            
                        if '[' in str6[-1] and ']' in str6[-1]:
                            dim = re.match(r"^.*\[(.*)\].*$",str6[-1]).groups(1)
                            
                            try:
                                str5 = str5 + ', dimension(0,' + str(int(int(dim[0])-1)) + ')'
                            except ValueError:
                                str5 = ''
                            
                        str5 = str5 + " :: " + re.sub(r'\[.+\]', '',str6[-1]) + '\n'
                            
                    outfile_types.write(str5);
                str5 = "        end type " + name + "\n"
                
                types.append(name)
                outfile_types.write(str5);
                typedef = ''
    
    outfile.write("    end interface\n");
    outfile.write("end module glpk\n")
    outfile.close()
    
    outfile_constants.write("end module glpk_constants\n")
    outfile_constants.close()
    
    outfile_types.write("end module glpk_types\n")
    outfile_types.close()    
    