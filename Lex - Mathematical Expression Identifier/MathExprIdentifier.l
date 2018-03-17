//	Mathematical Expression Identifier
//	Author : Gourav Siddhad

%{
	#include "iostream"
	#include "cstdio"
	using namespace std;
%}

%option noyywrap

%%
	([0-9])*+[-/+*]([0-9])*+\n	{ cout<<"Valid Expression"<<endl;}
	.+                    		{ cout<<"Invalid Expression"<<endl;};

%%
int main() {
	yylex();
	return 0;
}
