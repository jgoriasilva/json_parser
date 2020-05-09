

%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);

%}

%token '{' '}' '[' ']' ':' ',' '"' STR INT FLOAT '\n'

%%

S:
 	S O '\n' { printf("VALIDO\n"); }
 	|
	;

O:
	'{' C '}' {}
	;
	
C:
	C '\n' {} 
	| C ',' C {}
	| '"' STR '"' ':' INT {}
	| '"' STR '"' ':' FLOAT {}
	| '"' STR '"' ':' '"' STR '"' {}
	| '"' STR '"' ':' L {}
	|
	;
L:
 	'[' A ']' {}
	| '[' ']' {}
	;

A:
 	A ',' A {}
	| L {}
	|'"' STR '"' {}
	| INT {}
	| FLOAT {}
	;



%%

void yyerror(char *s) {
	printf("INVALIDO\n");
}

int main() {
  yyparse();
    return 0;

}
