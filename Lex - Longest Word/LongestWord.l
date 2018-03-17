//	Longest Word
//	Author : Gourav Siddhad

%{
	#include "fstream"
	#include "iostream"
	#include "cstring"

	using namespace std;
	int max_len = 0;
	char long_word[50];
%}

%option noyywrap

%%
	[a-zA-Z]+	{	if(yyleng > max_len) {
						strcpy(long_word, yytext);
						max_len = yyleng;
					}
    			}
	.			;

%%
int main() {
	yylex();
	cout<<"\n\n Longest Word : "<<long_word<<endl;
	return 0;
}
