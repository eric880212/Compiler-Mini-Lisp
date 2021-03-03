%{
    #include "y.tab.h"
    void yyerror(const char *);
%}
separator  ‘\t’ | ‘\n’ | ‘\r’ | ‘ ’
letter  [a-z]
digit   [0-9]
number  0|[1-9]{digit}*|-[1-9]{digit}*
ID  letter (letter | digit | ‘-’)* 
bool-val  #t | #f 

%%
number {
    yylval.ival = atoi(yytext);
    return number;}


"+" {return yytext[0];}
"-" {return  yytext[0];}
"*" {return  yytext[0];}
"/" {return  yytext[0];}
"("|")"	{return yytext[0];}

%%