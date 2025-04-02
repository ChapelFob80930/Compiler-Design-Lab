#ifndef _yy_defines_h_
#define _yy_defines_h_

#define NUM 257
#define PLUS 258
#define MINUS 259
#define MUL 260
#define DIV 261
#define LPAREN 262
#define RPAREN 263
#ifdef YYSTYPE
#undef  YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
#endif
#ifndef YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
typedef union YYSTYPE {
int num;
} YYSTYPE;
#endif /* !YYSTYPE_IS_DECLARED */
extern YYSTYPE yylval;

#endif /* _yy_defines_h_ */
