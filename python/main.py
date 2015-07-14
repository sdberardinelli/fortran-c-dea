#!/usr/bin/env python
import sys, getopt
from lp_translate import *
from glpk_translate import *
from clp_translate import *

def main(argv):
    inputfile = 'C:\\Windows\\cygwin64\\usr\\local\\include\\coin\\Clp_C_Interface.h'
    outputfile = ''
    type = 'clp'
    
    # inputfile = ''
    # outputfile = ''
    # type = ''
    
    # try:
        # opts, args = getopt.getopt(argv,"ht:i:o:",["type=","ifile=","ofile="])
    # except getopt.GetoptError:
        # print 'Fail'
        # print 'test.py -t <type> -i <inputfile> -o <outputfile>'
        # sys.exit(2)
        
    # for opt, arg in opts:
        # if opt == '-h':
            # print 'test.py -t <type> -i <inputfile> -o <outputfile>'
            # sys.exit()
        # elif opt in ("-t", "--type"):
            # type = arg         
        # elif opt in ("-i", "--ifile"):
            # inputfile = arg
        # elif opt in ("-o", "--ofile"):
            # outputfile = arg

    if type == 'lp_solve':
        lp_translate(inputfile,outputfile)
    elif type == 'glpk':
        glpk_translate(inputfile,outputfile)
    elif type == 'clp':
        clp_translate(inputfile,outputfile)
    else:
        print 'Type was ', type, ' it needs to be lp_solve or glpk'
        sys.exit(2)        


if __name__ == "__main__":
   main(sys.argv[1:])