%{
#include<stdio.h>
#include<stdlib.h>
void yyerror(const char *s);
int yylex();
%}
%union {
int num;
}
%token <num> NUM
%token PLUS MINUS MUL DIV LPAREN RPAREN
%start E
%%
E: T E_prime     { printf("E-> T E'\n");}
;
E_prime:
  PLUS T E_prime   { printf("E' -> + T E'\n");}
| MINUS T E_prime  { printf("E' -> -T E'\n");}
|                  {printf("E' -> ε\n");}
;
T:F T_prime        {printf("T-> F T'\n");}
;
T_prime:
MUL F T_prime     {printf("T -> F T'\n");}
| DIV F T_prime    { printf("T'-> /F T'\n");}
|                  {printf("T' -> ε\n");}             
;
F:NUM              {printf("F -> id\n");}
| LPAREN E RPAREN  {printf("F-> ( E )\n");}
;
%% void yyerror(const char *s){
printf("Error: %s\n", s);
}
int main(){
printf("Enter an expression: ");
yyparse();
return 0;
}
