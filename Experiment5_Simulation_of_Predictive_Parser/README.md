gedit lex.l\
gedit parser.y\
lex lex.l\
yacc -d parser.y\
gcc lex.yy.c y.tab.c -lfl\

Enter expression:\
8+(2*3)\
Result = 14
