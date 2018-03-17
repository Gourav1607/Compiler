//  Palindrome.l / Palindrome
//  Author : Gourav Siddhad

%{
    #include "cstdio"
    #include "cstdlib"
    #include "y.tab.h"
%}

/* %option noyywrap */

%%
    [a-zA-Z]+   { yylval.f = yytext;  return STR; }
    [-+()*/]    { return yytext[0]; }
    [ \t\n]     { ; }

%%
int yywrap() {
    return -1;
}
