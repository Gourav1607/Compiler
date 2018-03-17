//	Count Everything
//	Author : Gourav Siddhad
//	Count Comment, Identifiers, Keywords etc. in c program file

%{
	#include "iostream"
	#include "cstdio"
	using namespace std;

	int IdentifierCount = 0;
	int KeywordCount = 0;
	int OperatorCount = 0;
	int CommentCount = 0;

// CommentMulti "/\*".*"\*/"
%}

%option noyywrap

Identifier   [a-zA-Z_][a-zA-Z0-9_]*
Keyword      int|float|char|double|void|for|do|while|if|else|switch|case|default|break|extern|class|struct|enum|return
Operator     "="|"=="|">="|"<="|"<"|">"|"+"|"*"|"++"|"--"
Comment      "//".*\n

%%
	{Keyword}		{ cout<<"Keyword :"<<yytext<<"\n"; ++KeywordCount; }
	{Identifier}	{ cout<<"Identifier :"<<yytext<<"\n"; ++IdentifierCount; }
	{Operator}    	{ cout<<"Operator :"<<yytext<<"\n"; ++OperatorCount; }
	{Comment}		{ cout<<"Comment :"<<yytext<<"\n"; ++CommentCount; }
	.				;
	\n              ;

%%
int main() {
	char filename[100];
	cout<<"\nEnter file name: ";
	cin>>filename;

	FILE *file = fopen(filename, "r");
	if(file == NULL) {
		cout<<"Unable to open file!";
	} else {
		yyin = file;
		yylex();
		cout<<"\n Identifiers "<<IdentifierCount<<endl;
		cout<<"\n Keyword "<<KeywordCount<<endl;
		cout<<"\n Operator "<<OperatorCount<<endl;
		cout<<"\n Comment "<<CommentCount<<endl;
		close(fileno(file));
	}
	return 0;
}
