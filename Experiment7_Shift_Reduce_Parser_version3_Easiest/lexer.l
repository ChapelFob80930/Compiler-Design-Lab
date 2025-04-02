%{ 
#include "y.tab.h"
%}
%%
[0-9]+  {yylval.ival=atoi(yytext);return NUM;}
[+]     {return '+';}
[*]     {return '*';}
[(]     {return '(';}
[)]     {return ')';}
[ \t\n]+  {/* Ignore whitespace */}
.       {printf("Unexpected character: %s\n",yytext);}
%%
int yywrap(){
return 1;
}
