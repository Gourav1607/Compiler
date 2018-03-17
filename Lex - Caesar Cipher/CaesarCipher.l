// *	Caesar Cipher
// *	Author : Gourav Siddhad

%{
	#include "fstream"
	#include "iostream"
	using namespace std;
	int i = 1;
%}

%option noyywrap

%%
	[a-wA-W]	{ cout<<char(yytext[0] + 3); }
	[x-zX-Z]	{ cout<<char(yytext[0] - 23); }
	.			;

%%
int main() {
	yylex();
	return 0;
}
