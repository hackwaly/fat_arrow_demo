{open Parser}

rule token = parse
  | eof { EOF }
  | [' ' '\t' '\r' '\n'] { token lexbuf }
  | ['a'-'z' 'A'-'Z' '_'] ['a'-'z' 'A'-'Z' '0'-'9' '_']* { ID }
  | "(" { LPAREN }
  | ")" [' ' '\t' '\r' '\n']* "=>" { RPAREN_FAT_ARROW }
  | ")" { RPAREN }
  | "=>" { FAT_ARROW }
  | "," { COMMA }
