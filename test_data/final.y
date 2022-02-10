%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

void yyerror(const char *message);
int yylex();
int t, equal = 1;
int n = 0;
typedef struct var{
	char* name;
	int val;
}Var;
Var arr[100];
%}

%union{
	int ival;
	char* word;
}

%token <ival> NUM printNUM printBOOL MOD AND OR NOT BOOL IF DEF
%token <word> ID
%type <ival> EXP printSTMT numOP PLUS MINUS MULTIPLY DIVIDE plusEXP mulEXP MODULUS GREATER SMALLER EQUAL
%type <ival> equalEXP andOP orOP notOP logOP andEXP orEXP ifEXP testEXP thenEXP elseEXP defSTMT
%type <word> variable

%%
PROGRAM	: PROGRAM STMT
		| STMT
		;
STMT	: EXP {}
		| defSTMT {}
		| printSTMT {}
		;
printSTMT	: '(' printNUM EXP ')'	{printf("%d\n", $3);}
			| '(' printBOOL EXP ')'	{ 
										if(t || $3){printf("#t\n");}
										else{printf("#f\n");}
									}
			;
EXP		: BOOL
		| NUM
		| variable	{
						for(int i=0; i<n; i++){
							if( !strcmp(arr[i].name, $1) ) {$$ = arr[i].val;}
						}
					}
		| numOP
		| logOP
		| ifEXP
		;

numOP	: PLUS
		| MINUS
		| MULTIPLY
		| DIVIDE
		| MODULUS
		| GREATER
		| SMALLER
		| EQUAL
		;

PLUS	: '(' '+' EXP plusEXP ')'	{$$ = $3 + $4;}
		;
plusEXP	: EXP plusEXP	{$$ = $1 + $2;}
		| EXP			{$$ = $1;}
		;
MINUS	: '(' '-' EXP EXP ')'	{$$ = $3 - $4;}
		;
MULTIPLY	: '(' '*' EXP mulEXP')'	{$$ = $3 * $4;}
			;
mulEXP	: EXP mulEXP	{$$ = $1 * $2;}
		| EXP			{$$ = $1;}
		;
DIVIDE	: '(' '/' EXP EXP ')'	{$$ = $3 / $4;}
		;
MODULUS	: '(' MOD EXP EXP ')'	{$$ = $3 % $4;}
		;
GREATER	: '(' '>' EXP EXP ')'	{
									if($3 > $4) {t = 1; $$ = 1;}
									else {t = 0; $$ = 0;}
								}
		;
SMALLER	: '(' '<' EXP EXP ')'	{
									if($3 < $4) {t = 1; $$ = 1;}
									else {t = 0; $$ = 0;}
								}
		;
EQUAL	: '(' '=' EXP equalEXP ')'	{
										if($3==$4 && equal) {t = 1; $$ = 1;}
										else {t = 0; $$ = 0;}
										equal = 1;
									}
		;
equalEXP	: EXP equalEXP	{if($1 != $2){equal = 0;}}
			| EXP
			;

logOP	: andOP
		| orOP
		| notOP
		;
andOP	: '(' AND EXP andEXP ')'	{$$ = $3 & $4; t=0;}
		;
andEXP	: EXP andEXP	{$$ = $1 & $2;}
		| EXP			{$$ = $1;}
		;
orOP	: '(' OR EXP orEXP ')'	{$$ = $3 | $4; t=0;}
		;
orEXP	: EXP orEXP	{$$ = $1 | $2;}
		| EXP		{$$ = $1;}
		;
notOP	: '(' NOT EXP ')'	{$$ = !$3; t=0;}
		;


defSTMT	: '(' DEF variable EXP ')'	{
										arr[n].name = $3;
										arr[n].val = $4;
										n++;
								
									}
		;
variable	: ID	{$$ = $1; }
			;

ifEXP	: '(' IF testEXP thenEXP elseEXP ')'	{
													if($3){$$ = $4;}
													else{$$ = $5;}	
												}
		;
testEXP	: EXP
		;
thenEXP	: EXP
		;
elseEXP	: EXP
		;

%%
void yyerror(const char *message){printf("syntax error\n");}

int main(int argc, char *argv[]){
	yyparse();
	return 0;
}