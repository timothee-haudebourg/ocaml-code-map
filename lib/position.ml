open Unicode

type t = {
  line: int;
  column: int
}

let default =
  {
    line = 0;
    column = 0
  }

let create line column =
  {
    line = line;
    column = column
  }

let last =
  {
    line = max_int;
    column = max_int
  }

let next_column p =
  { p with column = p.column + 1 }

let reset_column p =
  { p with column = 0 }

let next_line p =
  {
    line = p.line + 1;
    column = 0
  }

let next c p =
  let i = UChar.to_int c in
  begin match i with
    | 0x0a (* \n *) -> next_line p
    | 0x0d (* \r *) -> reset_column p
    | 0x09 (* \t *) ->
      { p with column = (p.column/8)*8 + 8 }
    | _ when UChar.is_control c -> p
    | _ -> next_column p
  end

let print p fmt =
  Format.fprintf fmt "line %d column %d" (p.line+1) (p.column+1)

let print_short p fmt =
  Format.fprintf fmt "%d:%d" (p.line+1) (p.column+1)
