# Mini-LISP-interpreter
This is the final project for NCU compiler class, the language features are included in [Compiler Final Project.pdf](https://github.com/KrystalHsieh/Mini-LISP-interpreter/files/8040181/Compiler.Final.Project.pdf)
 and [MiniLisp.pdf](https://github.com/KrystalHsieh/Mini-LISP-interpreter/files/8040184/MiniLisp.pdf)
.  
The features I've implement in this project are showing below :  

<img src="https://upload.cc/i1/2022/02/10/uDbJ1o.png" width="650" height="180">

# Mini-LISP
The language that your project’s interpreter will process is a subset of LISP, which we call it Mini-LISP for convenience.This handout first offers a general description, then goes into details such as lexical structure and grammar of the subset.  

### Overview
LISP is an ancient programming language based on S-expressions and lambda calculus.  
All operations in Mini-LISP are written in parenthesized prefix notation. For example, a simple mathematical formula ```(1 + 2) * 3``` written in Mini-LISP is : ```(* (+ 1 2) 3)```  
As a simplified language, Mini-LISP has only three types (Boolean, number and function) and a few operations. 

### Type Definition
- Boolean: Boolean type includes two values, #t for true and #f for false.
- Number: Signed integer from ```−(231)``` to ```231 – 1```, behavior out of this range is not defined.  

### Operation Overview
<img src="https://upload.cc/i1/2022/02/10/EedZhI.png" width="650" height="230">  
<img src="https://upload.cc/i1/2022/02/10/gay5Uz.png" width="550" height="130">

# Environment
- Windows10, 64 bits

# Dependencies
- Flex version 2.5.4a : https://sourceforge.net/projects/gnuwin32/files/flex/2.5.4a-1/  
- Bison-2.4.1 : https://sourceforge.net/projects/gnuwin32/files/bison/2.4.1/  

# How to compile
### Step1 : Copy the file ```final.l``` and ```final.y``` to the folder ```test_data```.
### Step2 : Open the cmd under the folder ```test_data```, then use the command below to compile :   
```flex final.l```  
```bison -dy final.y```  
```gcc lex.yy.c y.tab.c```  

### Step3 : Then the 4 new files will be created under the folder ```test_data``` :  
1. ```y.tab.c```  
2. ```y.tab.h```  
3. ```lex.yy.c```  
4. ```a.exe```  

# To run the code
To run with test data, open the cmd under the folder ```test_data```, and use the command below :  
```a.exe < 01_1.lsp```  

(Note: "01_1" is the filename for the testcase in lsp format.)
