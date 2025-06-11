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

gen_expr(atom_expr):
  | atom_expr {}
  | ID "=>" expr { print_endline "arrow 1" }
  | "(" ") =>" expr { print_endline "arrow 2" }
  | "(" ID ") =>" expr { print_endline "arrow 3" }
  | "(" ID "," separated_nonempty_list(",", ID) ") =>" expr { print_endline "arrow 4" }

expr:
  | gen_expr(atom_expr) {}

expr_no_id:
  | gen_expr(atom_expr_no_id) {}

atom_expr:
  | ID {}
  | paren_expr {}

atom_expr_no_id:
  | paren_expr {}

paren_expr:
  | "(" ")" {}
  | "(" ID ")" {}
  | "(" ID "," separated_nonempty_list(",", ID) ")" {}
  | "(" expr_no_id ")" {}
  | "(" expr_no_id "," separated_nonempty_list(",", expr_no_id) ")" {}
