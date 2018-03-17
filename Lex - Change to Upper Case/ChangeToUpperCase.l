//  Change To Upper Case
//  Author : Gourav Siddhad

%{
    #include "iostream"
    #include "cctype"
    #include "cstring"
    #include "cstdio"
    using namespace std;

    int i;
%}

%%
main|int|scanf|printf|if|else {
    for(i = 0; i < yyleng; i++)
        cout<<(char)toupper(yytext[i]);
}

%%
int main() {
    char filename[100];
    cout<<"Enter the filename = ";
    cin>>filename;

    yyin = fopen(filename, "r");
    yylex();
}

int yywrap() {
    return 1;
}
