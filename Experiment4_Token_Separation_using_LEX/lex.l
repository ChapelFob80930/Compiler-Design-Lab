%{
#include<stdio.h>
#include<stdlib.h>
%}

%%
[ \t\n]+ ;//ignoring whitespaces
[0-9]+ {printf("NUMBER: %s\n",yytext);}
[0-9]+[.][0-9]+ {printf("NUMBER");}
int|float|double|void|char|if|else|while|do {printf("KEYWORD: %s\n",yytext);}
"("|","|")"|"{"|";"|"}" {printf("PUNCTUATION: %s\n",yytext);}
[a-zA-Z_][a-zA-Z0-9_]* {printf("INDENTIFIER: %s\n",yytext);}
[+=*/%^&] {printf("OPERATOR: %s\n",yytext);}
"=="|"+="|"-="|"/="|"%="|"*="|"&&" {printf("OPERATOR: %s\n",yytext);}
%%

int main(int argc, char **argv)
{
	if(argc>1)
	{
		FILE *input_file = fopen(argv[1], "r");
		if(input_file)
		{
			yyin = input_file;
			yylex();
			fclose(input_file);
		}
		
		else
		{
			fprintf(stderr, "Could not open file %s\n", argv[1]);
		}
	}
	
	else
	{
		printf("Please provide a input file\n");
		return 1;
	}
	
	return 0;
}

int yywrap()
{
	return 1;
}
