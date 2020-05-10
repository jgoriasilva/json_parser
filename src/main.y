

%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);

%}

%token '{' '}' '[' ']' ':' ',' '"' STR INT FLOAT '\n'

%%

S:
 	S O { printf("VALIDO\n"); }
 	|
	;

O:
	'{' C '}' {}
	;
	
C:
	'"' STR '"' ':' O {}
	| '"' STR '"' ':' L {}
	| C ',' C {}
	| '"' STR '"' ':' INT {}
	| '"' STR '"' ':' FLOAT {}
	| '"' STR '"' ':' '"' STR '"' {}
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
