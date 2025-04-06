gedit lex.l\
gedit parseryac.y\
yacc -d parseryac.y\
lex lex.l\
gcc lex.yy.c y.tab.c -lfl\
./a.out\
\
\
Enter an expression: 7*(3+2)-6/2\
F -> id\
F -> id\
T' -> ε\
T-> F T'\
F -> id\
T' -> ε\
T-> F T'\
E' -> ε\
E' -> + T E'\
E-> T E'\
F-> ( E )\
T' -> ε\
T -> F T'\
T-> F T'\
F -> id\
F -> id\
T' -> ε\
T'-> /F T'\
T-> F T'\
E' -> ε\
E' -> -T E'\
E-> T E'
