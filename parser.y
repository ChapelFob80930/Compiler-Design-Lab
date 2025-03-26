%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
%}

%union {
    int num;
}

%token <num> NUMBER
%token PLUS MINUS MUL DIV LPAREN RPAREN

%type <num> expr

%left PLUS MINUS
%left MUL DIV

%%

stmt:
    expr { printf("Result: %d\n", $1); }
    ;

expr:
    NUMBER                { $$ = $1; }
    | expr PLUS expr      { $$ = $1 + $3; }
    | expr MINUS expr     { $$ = $1 - $3; }
    | expr MUL expr       { $$ = $1 * $3; }
    | expr DIV expr       { $$ = $1 / $3; }
    | LPAREN expr RPAREN  { $$ = $2; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    printf("Enter an arithmetic expression:\n");
    yyparse();
    return 0;
}

