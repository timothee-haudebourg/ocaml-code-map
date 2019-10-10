type t

val default : t

val first : t -> Position.t
(** [first span] get the position of the first character in the span. *)

val last : t -> Position.t
(** [last span] get the position of the last character in the span. *)

val next_position : t -> Position.t
(** [next_position span] return the position of the character directly following
    the span. It is not included in the span. *)

val push : Unicode.UChar.t -> t -> t

val next : t -> t

type 'a located
(** Type of located values. *)

val located : t -> 'a -> 'a located

val get : 'a located -> t
