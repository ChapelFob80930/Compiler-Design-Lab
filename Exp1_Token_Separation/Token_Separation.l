%{
%}


%%
[0-9]+[.][0-9]+ printf("%s is a floating point number\n",yytext);
int|float|char|double|void printf("%s is a datatype\n", yytext);
[a-zA-Z]+[()] printf("%s is a function\n", yytext);
[0-9]+ {printf("%s is an integer\n", yytext);}
[a-z]+ printf("%s is an identifier\n", yytext);
[+=*/-]+ printf("%s is an operation\n", yytext);
, printf("%s is a separator\n", yytext);
; printf("%s is a delimiter\n", yytext);
[#][a-z/.n]+ printf("%s is a preprocessor\n", yytext);
%%

int yywrap(void)
{
return 1;
}

int main()
{
freopen("test.c","r",stdin);
yylex();
return 0;
}

