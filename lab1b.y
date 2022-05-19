%{
#include<stdio.h>
%}
%token  num enter
%left '+' '-'
%left '*' '/'
%%
 input : expr enter{printf("Result is %d\n",$$); exit(0);}
expr: expr  '+' expr{$$=$1+$3;}
|expr	  '-' expr{$$=$1-$3;}
|expr  '*' expr{$$=$1*$3;}
|num {$$=$1;};
%%
void main()
{
	printf("Enter the Expression\n");
	yyparse();
}
int yyerror()
{
	printf("invalid expression\n");
	exit(0);
}
