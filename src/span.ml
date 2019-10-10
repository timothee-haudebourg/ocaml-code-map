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

type 'a located = 'a * t

let located span x = x, span

let get (_, span) = span
