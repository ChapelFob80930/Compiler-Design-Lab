%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_STACK_SIZE 100

// Forward declaration of the lexer function
int yylex(void);
void yyerror(const char *s);

// Stack for parsing steps
char stack[MAX_STACK_SIZE][20];
int stack_top = -1;

void push_stack(const char *symbol) {
    if (stack_top < MAX_STACK_SIZE - 1) {
        strcpy(stack[++stack_top], symbol);
    }
}

void pop_stack() {
    if (stack_top >= 0) {
        stack_top--;
    }
}

void print_stack() {
    printf("Stack: ");
    for (int i = 0; i <= stack_top; i++) {
        printf("%s ", stack[i]);
    }
    printf("\n");
}

void print_step(const char *input, const char *action) {
    print_stack();
    printf("Input: %s\n", input);
    printf("Action: %s\n", action);
    printf("----------------------------\n");
}

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
    NUMBER { 
        $$ = $1; 
        char num_str[20]; 
        sprintf(num_str, "%d", $1);  // Convert NUMBER to string
        push_stack("NUMBER"); 
        print_step(num_str, "Shift NUMBER"); 
    }
    | expr PLUS expr { $$ = $1 + $3; pop_stack(); pop_stack(); push_stack("expr"); print_step("+", "Reduce by expr -> expr + expr"); }
    | expr MINUS expr { $$ = $1 - $3; pop_stack(); pop_stack(); push_stack("expr"); print_step("-", "Reduce by expr -> expr - expr"); }
    | expr MUL expr { $$ = $1 * $3; pop_stack(); pop_stack(); push_stack("expr"); print_step("*", "Reduce by expr -> expr * expr"); }
    | expr DIV expr { $$ = $1 / $3; pop_stack(); pop_stack(); push_stack("expr"); print_step("/", "Reduce by expr -> expr / expr"); }
    | LPAREN expr RPAREN { $$ = $2; pop_stack(); push_stack("expr"); print_step("(expr)", "Reduce by expr -> (expr)"); }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    printf("Enter an arithmetic expression:\n");
    yyparse();  // Start the parsing process
    return 0;
}

