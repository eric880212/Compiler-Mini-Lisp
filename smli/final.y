%{
    #include <stdio.h>
    
    void yyerror(const char * );
    int yylex(void);
    void semantic_err(const int);
%}

%code require
   
}

%union {
    int ival;
    
}

/* declarations */
%token <ival> INTEGER
%type <md> expr
%type <md> matrix

/* precedences */
%left <ival> '+' '-'
%left <ival> '*'
%right TRANSPOSE

%%
PROGRAM  : STMT+ 
STMT  : EXP | DEF-STMT | PRINT-STMT 
PRINT-STMT : (print-num EXP) | (print-bool EXP) 
EXP  : bool-val | number | VARIABLE | NUM-OP | LOGICAL-OP | FUN-EXP | FUN-CALL | IF-EXP 
NUM-op	:	PLUS | MINUS | MULTIPLY | DIVIDE | MODULUS | GREATER | SMALLER | EQUAL 
PLUS : 



%%


void yyerror(const char *message) {
    fprintf(stderr, "%s\n", message);
}

int main(void) {
    yyparse();
    return 0;
}
