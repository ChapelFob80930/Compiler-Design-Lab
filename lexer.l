%{
#include "y.tab.h"
%}

%%

[0-9]+         { yylval.num = atoi(yytext); return NUMBER; }
"+"            { return PLUS; }
"-"            { return MINUS; }
"*"            { return MUL; }
"/"            { return DIV; }
"("            { return LPAREN; }
")"            { return RPAREN; }
[ \t\n]        { /* Ignore whitespace */ }
.              { return yytext[0]; }

%%

