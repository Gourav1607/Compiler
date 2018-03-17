//	Calculate Identifier
//	Author : Gourav Siddhad
//	Calculate Identifiers in c program file

%{
	#include "iostream"
	#include "cstdio"
	using namespace std;

	int IdentifierCount = 0;
%}

%option noyywrap

%%
	[a-zA-Z_][a-zA-Z0-9_]*  { ++IdentifierCount; }
	.                    	;
	\n                   	;

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
		close(fileno(file));
	}
	return 0;
}
