%{
#include<stdio.h>
#include<stdlib.h>
void yyerror(const char *s);
int yylex();
%}
%union{
int ival;
}
%token <ival> NUM
%type <ival> E T F

%%
S : E { printf("Parsing Complete.Result= %d\n",$1);}
  ;
E : E '+' T { printf("Reducing: E -> E + T\n"); $$ = $1 + $3;}
  | T       { printf("Reducing: E -> T\n"); $$ = $1;}
  ;
T : T '*' F { printf("Reducing: T -> T * F\n"); $$ = $1 * $3;}
  | F       { printf("Reducing: T -> F\n"); $$ = $1;}
  ;
F : '(' E')' { printf("Reducing: F -> (E)\n"); $$ = $2;}
  | NUM      { printf("Reducing: F -> NUM\n"); $$ = $1;}
  ;
%%
void yyerror(const char *s){
fprintf(stderr, "Error: %s\n",s);
}
int main(){
printf("Enter an arithmetic expression: ");
yyparse();
return 0;
}
