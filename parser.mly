%start<unit> expr_eof

%token EOF
%token ID
%token LPAREN "("
%token RPAREN ")"
%token COMMA ","
%token FAT_ARROW "=>"
%token RPAREN_FAT_ARROW ") =>"

%%

expr_eof:
  | expr EOF {}

expr:
  | atom_expr {}
  | ID "=>" expr { print_endline "arrow 1" }
  | "(" ") =>" expr { print_endline "arrow 2" }
  | "(" expr ") =>" expr { print_endline "arrow 3" }
  | "(" expr "," separated_nonempty_list(",", expr) ") =>" expr { print_endline "arrow 4" }

atom_expr:
  | ID {}
  | "(" ")" {}
  | "(" expr ")" {}
  | "(" expr "," separated_nonempty_list(",", expr) ")" {}
