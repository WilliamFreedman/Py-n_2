(* OH: how to do literals, array indexing*)

{ open Parser } 

let digits = ['0'-'9']

let alphabet = ['a'-'z' 'A'-'Z' '0'-'9' '!' '@' '#' '$' '%' '^' '&' '*' '(' ')' '-' '=' '+' '{' '}' '\\' '|' ':' ';' ',' '<' '.' '>' '/' '?']

rule tokenize = parse
  [' ' '\t' '\r'] { tokenize lexbuf }
| "#"     { comment lexbuf }           (* Comments *)
| '\n' { NEWLINE }
| "->" { ARROW }
| '+' { PLUS }
| '-' { MINUS }
| '*' { TIMES }
| "//" {FLOORDIVIDE}
| '/' { DIVIDE }
| '(' { LPAREN }
| ')' { RPAREN }
| '[' {LBRACK}
| ']' {RBRACK}
| '{' {INDENT}
| '}' {DEDENT}
| ',' {COMMA}
| "**" { EXPONENT }
| '%' { MOD }
| "<<" { LSHIFT }
| ">>" { RSHIFT }
| '&' { BITAND }
| '|' { BITOR }
| '^' { BITXOR }
| '~' { BITNOT }
| ":=" { WALRUS }
| '>' { GT }
| '<' { LT }
| ">=" { GEQ }
| "<=" { LEQ }
| "==" { EQ }
| "!=" { NEQ }
| '=' { ASSIGN }
| "+=" { PLUSASSIGN }
| "-=" { MINUSASSIGN }
| "*=" { TIMESASSIGN }
| "/=" { DIVIDEASSIGN }
| "//=" { FLOORDIVASSIGN }
| "**=" { EXPASSIGN }
| "&=" { ANDASSIGN }
| "|=" { ORASSIGN }
| "^=" { XORASSIGN }
| ">>=" { RSHIFTASSIGN } 
| "<<=" { LSHIFTASSIGN }
| "%=" { MODASSIGN }
| '.' { DOT }
| ':' {COLON}
| "def" { DEF }
| "return" { RETURN }
| "implements" { IMPLEMENTS }
| "if" { IF }
| "else" { ELSE }
| "elif" { ELIF }
| "break" { BREAK }
| "continue" { CONTINUE }
| "pass" { PASS }
| "in" { IN }
| "is" { IS }
| "not" { NOT }
| "del" { DEL }
| "from" {  FROM  }
| "while" { WHILE  }
| "for" { FOR }
| "None" { NONE }
| "INDENT" { INDENT }
| "int" { INT }
| "str" { STR }
| "bool" {  BOOL  }
| "float" { FLOAT }
| "list" { LIST }
| "dict" { DICT }
| "void" { VOID }
| "and" { AND } 
| "or" {OR}
| "DEDENT" { DEDENT }
| "True"  { BOOLLIT(true) }
| "False" { BOOLLIT(false) }
| ['-']? ('0'|(['1'-'9'] digits*))? '.' digits* (['e' 'E'] ['+' '-']? digits+)? as lit { FLOATLIT(float_of_string lit) }
| ['-']? ('0'|(['1'-'9'] digits*)) ['e' 'E'] ['+' '-']? digits+ as lit { FLOATLIT(float_of_string lit) }
| ['-']? ('0'|['1'-'9'] digits*) as lit { INTLIT(int_of_string lit) }
| '\"'alphabet*'\"' as lit { STRINGLIT(lit) }
| '\''alphabet*'\'' as lit { STRINGLIT(lit) }
| ['a'-'z''A'-'Z''_']+['a'-'z''A'-'Z''_' '0'-'9']* as id { VARIABLE(id) }
| eof { EOF }

and comment = parse
  "\n" { tokenize lexbuf }
| _    { comment lexbuf }