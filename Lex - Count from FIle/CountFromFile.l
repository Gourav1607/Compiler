//	Count From File
//	Author : Gourav Siddhad
//  Count Chars, Words, Lines

%{
    #include "iostream"
    using namespace std;

    int WordCount = 0;
    int CharCount = 0;
    int LineCount = 0;
    int BlankSpaces = 0;
%}

%%
    [^ \t\n]+ { ++WordCount; CharCount += yyleng; }
    [ \t]+    { ++BlankSpaces; CharCount += yyleng;}
    \n        { ++BlankSpaces; ++CharCount; ++LineCount; }

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
	    cout<<"\n Words :     "<<WordCount;
	    cout<<"\n BlankSpaces:"<<BlankSpaces;
		cout<<"\n Lines :     "<<LineCount<<endl;
	}
	return 0;
}
