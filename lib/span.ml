type t = {
  first: Position.t;
  last: Position.t;
  next: Position.t
}

let default =
  {
    first = Position.default;
    last = Position.default;
    next = Position.default
  }

let first t = t.first

let last t = t.last

let next_position t = t.next

let push c t =
  {
    t with
    last = t.next;
    next = Position.next c t.next
  }

let next t =
  {
    first = t.next;
    last = t.next;
    next = t.next
  }

let union a b =
  if b.last > a.last && b.next > b.next then
    {
      first = min a.first b.first;
      last = b.last;
      next = b.next
    }
  else
    {
      first = min a.first b.first;
      last = a.last;
      next = a.next
    }

let print t fmt =
  if t.first = t.last then
    Position.print t.first fmt
  else
    Format.fprintf fmt "from %t to %t" (Position.print t.first) (Position.print t.last)

type 'a located = 'a * t

let located span x = x, span

let get (_, span) = span
