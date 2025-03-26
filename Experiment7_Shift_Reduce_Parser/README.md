gedit lexer.l\
gedit parser.y\
lex lexer.l\
yacc -d parser.y

gcc -o parser lex.yy.c y.tab.c -lfl

./parser\
Enter an arithmetic expression:\
3+4*(5-2) [after typing this press ctrl+D]\
Result: 15
