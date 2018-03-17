//	CountLineCharFile
//	Author : Gourav Siddhad
//	Calculate Lines and characters in input file

%{
	#include "iostream"
	#include "cstdio"
	using namespace std;

	int CharCount = 0;
	int LineCount = 0;
%}

%option noyywrap

%%
	\n  { ++LineCount; ++CharCount; }
	.	{ ++CharCount; }

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
		cout<<"\n\n ******* Count *********\n";
		cout<<"\n Characters :"<<CharCount;
		cout<<"\n Lines :     "<<LineCount<<endl;
	}
	return 0;
}
