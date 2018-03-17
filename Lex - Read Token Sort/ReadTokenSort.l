//  Read Token Sort
//  Author : Gourav Siddhad

%{
    #include "iostream"
    #include "cstdio"
    using namespace std;

    int t, a[20],i,j,n,num;
%}

%%
    [0-9]+  {   num = 0;
                for(i = 0; i < yyleng; i++)
                    num = num*10 + (yytext[i] - '0');
                a[n++] = num;
            }
    .       ;
%%

int main() {
    char filename[100];
    cout<<"\n Enter the filename = ";
    cin>>filename;

    yyin = fopen(filename, "r");
    yylex();

    for(i = 0; i < n; i++)
        for(j = 0; j < n-i-1; j++)
            if(a[j] > a[j+1]) {
                t = a[j];
                a[j] = a[j+1];
                a[j+1] = t;
            }
    for(i = 0; i < n; i++)
        cout<<"\n"<<a[i]<<"\n";
}

int yywrap() {
    return 1;
}
