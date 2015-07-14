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
    
def clp_translate (ifname,ofname):
    buffer = remove_comments(ifname)

    buffer = re.sub(r"^# +|^ +# +| +#", "#", buffer)
    buffer = re.sub(r'(#.*\n)+', '', buffer)
    
    buffer = re.sub(r'typedef(.*);\n', '', buffer)
    
    buffer = buffer.replace("extern \"C\" {", "")
    buffer = buffer.replace("}", "")
    buffer = buffer.replace("     ", "")
    buffer = buffer.replace("\n", "")
    buffer = buffer.replace(";", ";\n")
       
   
    outfile_constants = open('clp_constants.f90','w')
    outfile_constants.write("module clp_constants\n")
    outfile_constants.write("    use iso_c_binding\n")
    outfile_constants.write("    implicit none\n")
    
    outfile_types = open('clp_types.f90','w')
    outfile_types.write("module clp_types\n")
    outfile_types.write("    use iso_c_binding\n")
    outfile_types.write("    implicit none\n")    
    
    outfile = open('clp.f90','w')
    outfile.write("module clp\n")
    outfile.write("    use iso_c_binding\n")
    outfile.write("    implicit none\n")
    outfile.write("        interface\n")
    
    typedef = ''
    typedef_add = False
    
    for line in buffer.split('\n')[2:]:
        if line == '':
            continue
   
        if line[0] == '#':
            pass
        else:
            if "typedef" in line or "struct" in line:
                pass
            else:
                if re.compile(r"^.*\(.*\).*$").match(line):
                    line = line.replace("("," ( ")
                    line = line.replace(")"," )")
                    line = line.replace("* "," *")
                    line = line.replace("COINLIBAPI ","")
                    line = line.replace("COINLINKAGE ","")
                    
                    params =  re.match(r"^.*\((.*)\).*$",line)
                    
                    print line
                    
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
                           
                            if i.split()[0] == 'const':
                                idx = 1
                            else:
                                idx = 0
                            
                            if i.split()[idx+0] == 'void':
                                pass
                            elif i.split()[idx+0] == 'int':
                            
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
                                
                            elif i.split()[idx+0] == 'char':

                                if i.split()[-1].count('*') > 0:
                                    tmp  = "character(c_char) :: " + re.sub(r"\*+","",i.split()[-1]) + "(*)"
                                else:
                                    tmp  = "character(c_char), value :: " + re.sub(r"\*+","",i.split()[-1] )
                                    
                                list.append("                    " + tmp)
                                
                            elif i.split()[idx+0] == 'double':
                            
                                if i.split()[-1].count('*') > 0:
                                    tmp  = "real(c_double) :: " + re.sub(r"\*+","",i.split()[-1]) + "(*)"
                                else:
                                    tmp  = "real(c_double), value :: " + re.sub(r"\*+","",i.split()[-1])
                                    
                                list.append("                    " + tmp)
                            
                            else:
                                tmp  = "type(c_ptr), value :: " + re.sub(r"\*+","",i.split()[-1])
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
                        tmp1 = ''
                        
                        for i in params.group(1).split(","):
     
                            print len(i)
                            
                            if len(i.strip()) < 1:
                                continue
                                
                            if i.split()[-1] == 'void':
                                tmp = tmp + ','
                            else:
                                tmp1 = re.sub(r"\*+","",i.split()[-1]) 
                                tmp1 = re.sub(r"\[(.*)\]","",tmp1)
                                tmp1 = tmp1 + ','
                                
                            tmp = tmp + tmp1
                        
                        list = ["            function ", name, "(", tmp[:-1], ") bind(C,name=\"",name,"\")"]
                        outfile.write( "".join(list)+'\n' )
                        outfile.write("                use iso_c_binding\n")
                    
                        tmp = ''
                        list = []
                        for i in params.group(1).split(","):
                        
                            if len(i.strip()) < 1:
                                continue                        
                        
                            if i.split()[0] == 'const':
                                idx = 1
                            else:
                                idx = 0
                            
                            if i.split()[idx+0] == 'void':
                                pass
                            elif i.split()[idx+0] == 'int':
                            
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
                                
                            elif i.split()[idx+0] == 'char':

                                if i.split()[-1].count('*') > 0:
                                    tmp  = "character(c_char) :: " + re.sub(r"\*+","",i.split()[-1]) + "(*)"
                                else:
                                    tmp  = "character(c_char), value :: " + re.sub(r"\*+","",i.split()[-1] )
                                    
                                list.append("                    " + tmp)
                                
                            elif i.split()[idx+0] == 'double':
                            
                                if i.split()[-1].count('*') > 0:
                                    tmp  = "real(c_double) :: " + re.sub(r"\*+","",i.split()[-1]) + "(*)"
                                else:
                                    tmp  = "real(c_double), value :: " + re.sub(r"\*+","",i.split()[-1])
                                    
                                list.append("                    " + tmp)
                            
                            else:
                                tmp  = "type(c_ptr), value :: " + re.sub(r"\*+","",i.split()[-1])
                                list.append("                    " + tmp)
                                    
 
                        for i in list:
                            outfile.write(i+'\n')
                            
                        outfile.write("                    ")
                        
                        if '*' in line.split()[line_idx+1]:
                            outfile.write( 'type(c_ptr) :: '+ name + '\n' )
                        else:
                            if line.split()[line_idx+0] == 'int':
                                outfile.write( 'integer(c_int) :: '+ name + '\n')
                            elif line.split()[line_idx+0] == 'char':
                                outfile.write( 'character(c_char) :: '+ name + '\n' )
                            elif line.split()[line_idx+0] == 'double':
                                outfile.write( 'real(c_double) :: '+ name + '\n' )      
                            else:
                                outfile.write( 'type(????) :: '+ name + '\n' )      
                                
                        outfile.write("            end function\n")
    
    outfile.write("    end interface\n");
    outfile.write("end module clp\n")
    outfile.close()
    
    outfile_constants.write("end module clp_constants\n")
    outfile_constants.close()
    
    outfile_types.write("end module clp_types\n")
    outfile_types.close()    
    