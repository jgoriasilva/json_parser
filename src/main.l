
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}

/*
%token '{' '}' '[' ']' ':' ',' '"' STR INT FLOAT '\n'
*/


%%

\{ { return '{'; }
\} { return '}'; }
\[ { return '['; }
\] { return ']'; }
\: { return ':'; }
\, { return ','; }
\" { return '"'; }
[a-zA-Z]+[ ]*[a-zA-Z]+ { return STR; }
[0-9]+ { return INT; }
[0-9]+\.[0-9]+ { return FLOAT; }
[\n] { return '\n'; }
. 

%%

int yywrap() {
  return 1;
}
