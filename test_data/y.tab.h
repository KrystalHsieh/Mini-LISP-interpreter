typedef union{
	int ival;
	char* word;
} YYSTYPE;
#define	NUM	257
#define	printNUM	258
#define	printBOOL	259
#define	MOD	260
#define	AND	261
#define	OR	262
#define	NOT	263
#define	BOOL	264
#define	IF	265
#define	DEF	266
#define	ID	267


extern YYSTYPE yylval;
