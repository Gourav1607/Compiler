//  Calculator.l / Calculator
//  Author : Gourav Siddhad

%{
    #include "iostream"
    #include "y.tab.h"
    using namespace std;

    extern int yylval
%}

%%
    [0-9]+ {yylval = atoi(yytext); return NUM;}
    .	   {return yytext[0];}
    \n	   {return 0;}
