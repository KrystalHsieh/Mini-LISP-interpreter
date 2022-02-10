# Mini-LISP-interpreter
This is the final project for NCU compiler class.  
The language features are included in "Compiler Final Project" and "MiniLisp".  
The features I've implement in this project :  

>> Environment : Windows10, 64 bits

>> dependencies:

Flex version 2.5.4a
Bison-2.4.1

>> Use the following command to compile:

flex final.l
bison -dy final.y
gcc lex.yy.c y.tab.c

>> To run with test data, open the cmd under the folder "code", and use the command below:

a.exe < 01_1.lsp

(Note: "01_1" is the filename for the testcase in lsp format.)
