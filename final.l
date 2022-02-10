%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"
%}
number  0|[1-9][0-9]*|-[1-9][0-9]*
id      [a-z][[a-z][0-9]]-]*
separator   [\t\n\r ]*
operation   [+-/*\()=<>]
%%

{number}    {yylval.ival = atoi(yytext); return NUM;}
{id}    {yylval.word = strdup(yytext); return ID;}
"print-num" {return printNUM;}
"print-bool"    {return printBOOL;}
{operation} {return yytext[0];}
"mod"   {return MOD;}
"and"   {return AND;}
"or"    {return OR;}
"not"   {return NOT;}
"#t"    {yylval.ival = 1; return BOOL;}
"#f"    {yylval.ival = 0; return BOOL;}
"if"    {return IF;}
"define"    {return DEF;}
{separator}	{}
. {}

%%