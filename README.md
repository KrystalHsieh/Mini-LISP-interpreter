# Mini-LISP-interpreter
This is the final project for NCU compiler class, the language features are included in [Compiler Final Project.pdf](https://github.com/KrystalHsieh/Mini-LISP-interpreter/files/8040181/Compiler.Final.Project.pdf)
 and [MiniLisp.pdf](https://github.com/KrystalHsieh/Mini-LISP-interpreter/files/8040184/MiniLisp.pdf)
.  
The features I've implement in this project are showing below :  

<img src="https://upload.cc/i1/2022/02/10/uDbJ1o.png" width="700" height="200">

#

# Environment
- Windows10, 64 bits

# Dependencies
- Flex version 2.5.4a : https://sourceforge.net/projects/gnuwin32/files/flex/2.5.4a-1/  
- Bison-2.4.1 : https://sourceforge.net/projects/gnuwin32/files/bison/2.4.1/  

# How to compile
Open the cmd under the folder "", then use the command below step by step :  
```flex final.l```  
```bison -dy final.y```  
```gcc lex.yy.c y.tab.c```  

# To run the code
>> To run with test data, open the cmd under the folder "code", and use the command below:

a.exe < 01_1.lsp

(Note: "01_1" is the filename for the testcase in lsp format.)
