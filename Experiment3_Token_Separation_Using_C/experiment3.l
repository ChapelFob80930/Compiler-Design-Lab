%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>

int currentState = 0;

%}

%%
[c-zC-Z] { continue; }

a { if(currentState == 0){
    currentState = 1;
 } else if(currentState == 1){
    currentState = 1;
 }
 else if(currentState == 2){
    currentState = 1;
 }
}

b {
 if(currentState == 0){
	currentState = 0;
 }else if(currentState == 1){
	currentState = 2;
 }
else if(currentState == 2){
	currentState = 0;
 }
}
. { printf("Invalid input");}

\n|\t {  }

%%


int yywrap(void)
{
	return 1;
}

int main()
{
	printf("Enter the string: ");
	yylex();
	
	if(currentState == 2){
		printf("Accepted: The string ends with 'ab'\n");
		exit(0);
	}
	else{
		printf("Rejected: The string does not end with 'ab'\n");
	}
	
	return 0;
}



	
	
	

