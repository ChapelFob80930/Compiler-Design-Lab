%{
#include "y.tab.h"
%}
%%
[0-9]+           {yylval.num=atoi(yytext); return NUM;}
[+]              { return PLUS;}
[-]              { return MINUS;}
[*]               { return MUL;}
[/]              { return DIV;}
[(]               { return LPAREN;}
[)]               { return RPAREN;}
[ \t\n\r]+        { /* skip whitespace */}
.                 { printf("unexpected character: %s\n",yytext);}
%%
int yywrap(){
return 1;
}



