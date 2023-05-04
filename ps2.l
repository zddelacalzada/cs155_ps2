%{
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
int lineno = 1;
void ret_print(char *token_type);
void yyerror();
%}

%option noyywrap

RESERVED_WORD           (go\to|exit|return|if|then|else|endcase|endwhile|endfor|end|case|repeat|until|loop|forever|for|to|by|do|input|output|array|node|call|stop|procedure|while)
ARITHMETIC_OPERATOR     "+"|"-"|"/"|"*"|"^"
LOGICAL_OPERATOR        (and|or|not)
RELATIONAL_OPERATOR     (<=|<|>=|>|!=)
IDENTIFIER              [a-zA-Z_][0-9a-zA-Z_]*
STRING_LITERAL          \"(\\.|[^"\\])*\"
FLOAT                   [-+]?[0-9]*(\.[0-9]+)
INTEGER                 [+-]?[1-9][0-9]*|0
MOD                     mod
LOG                     log
SPECIAL_CHARACTER       [,;:']
OPENING_BRACKET         "("|"{"|"["
CLOSING_BRACKET         ")"|"}"|"]"
ASSIGNMENT              (=)
WHITESPACE              [\s\n\t]+

%%
{RESERVED_WORD}         printf("reserved word: %s\n", yytext);
{IDENTIFIER}            printf("identifier: %s\n", yytext);
{STRING_LITERAL}        printf("string literal: %s\n", yytext);
{FLOAT}                 printf("float: %s\n", yytext);
{INTEGER}               printf("integer: %s\n", yytext);
{ARITHMETIC_OPERATOR}   printf("arithmetic operator: %s\n", yytext);
{RELATIONAL_OPERATOR}   printf("relational operator: %s\n", yytext);
{SPECIAL_CHARACTER}     printf("special character: %s\n", yytext);
{OPENING_BRACKET}       printf("opening bracket: %s\n", yytext);
{CLOSING_BRACKET}       printf("closing bracket: %s\n", yytext);
{ASSIGNMENT}            printf("assignment: %s\n", yytext);
"\n"                    {lineno++;}
[ \t\r\f]+              /* eat up whitespace */
.                       {yyerror("Unrecognized character");}
%%

void ret_print(char *token_type){
    printf("yytext: %s\ttoken: %s\tlineno: %d\n", yytext, token_type, lineno);
}

void yyerror(char *message){
    printf("Error: \"%s\" in line %d. Token = %s\n", message, lineno, yytext);
    exit(1);
}

int main(int argc, char *argv[]){
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
    return 0;
}
