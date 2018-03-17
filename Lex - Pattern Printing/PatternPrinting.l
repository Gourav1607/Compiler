//	Pattern Printing
//	Author : Gourav Siddhad

%{
	#include "fstream"
	#include "iostream"
	#include "cstring"
	using namespace std;
%}

%option noyywrap

%%
	[a-zA-Z]+	{	for(int i = 0; i < yyleng; ++i) {
						cout<<"\n";
						for(int j = 0; j < (yyleng - i); ++j)
							cout<<yytext[j];
					}
        		}
.				;

%%
int main() {
	yylex();
	return 0;
}
