
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}

/*
%token '{' '}' '[' ']' ':' ',' '"' STR INT FLOAT
*/


%%

[\n] {}
[\t] {}
\{ { return '{'; }
\} { return '}'; }
\[ { return '['; }
\] { return ']'; }
\: { return ':'; }
\, { return ','; }
\" { return '"'; }
[a-zA-Z][a-zA-Z0-9 :\.\-\,]* { return STR; }
[0-9]+\.[0-9]+ { return FLOAT; }
[0-9]+ { return INT; }
. 

%%

int yywrap() {
  return 1;
}
