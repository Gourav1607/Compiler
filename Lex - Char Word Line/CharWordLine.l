//	Char, Word, Line
//	Author : Gourav Siddhad
//	Count Number of Words, Characters and Lines

%{
	int nChar,nWord,nLine;
%}

%%
	\n        {nLine++, nChar++;}
	[^ \t\n]+ {nWord++; nChar+=yyleng;}
	.         {nChar++;}

%%
int main() {
	yylex();
	printf("No of char %d word %d and line %d found\n", nChar, nWord, nLine);
	return 0;
}
