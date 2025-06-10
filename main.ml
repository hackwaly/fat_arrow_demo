let parse str = 
  print_endline ("parsing: " ^ str);
  let lexbuf = Lexing.from_string str in
  Parser.expr_eof (Lexer.token) lexbuf

let main () = 
  parse "()";
  parse "(a)";
  parse "(a, b)";
  parse "() => a";
  parse "a => b";
  parse "(a) => b";
  parse "(a, b) => c";
;;

main()
