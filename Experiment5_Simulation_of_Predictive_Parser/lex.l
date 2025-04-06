%{
#include "y.tab.h"
#include <stdlib.h>
extern int yylval;
%}

%%
[0-9]+              { yylval = atoi(yytext); return NUMBER; }
[a-zA-Z]+ 			  { return ID; }
[+\-*/()]      	  { return yytext[0]; }
.                   { return yytext[0]; }
[ \t\n]        	  ;  
%%

int yywrap() 
{ 
	return 1; 
}

