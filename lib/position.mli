type t = {
  line: int;
  column: int
}

val default : t

val create : int -> int -> t
(** [create line column] create a new position at the given [line] and [column]. *)

val last : t
(** [last] return the maximum position. *)

val next_column : t -> t
(** [next_column pos] move the position [pos] to the next column. *)

val reset_column : t -> t
(** [reset_column pos] move the position [pos] to the begining of the line. *)

val next_line : t -> t
(** [next_line pos] move the position [pos] to the next line and reset the column position. *)

val next : Unicode.UChar.t -> t -> t
(** [next c pos] move the position [pos] following the given character [c]. *)

val print : t -> Format.formatter -> unit
(** [print pos] format the position [pos] in the format "line x column y". *)

val print_short : t -> Format.formatter -> unit
(** [print_short pos] format the position [pos] in the format "line:column". *)
