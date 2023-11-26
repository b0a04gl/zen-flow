(* lib/lazy_stream.mli *)

type 'a t

(** [empty] returns an empty lazy stream. *)
val empty : 'a t

(** [cons hd tl] constructs a lazy stream with head [hd] and tail [tl]. *)
val cons : 'a -> 'a t -> 'a t

(** [force stream] forces the evaluation of the lazy stream [stream]. *)
val force : 'a t -> 'a t

(** [take n stream] takes the first [n] elements from the lazy stream [stream]. *)
val take : int -> 'a t -> 'a list

(** [map f stream] applies the function [f] to each element of the lazy stream [stream]. *)
val map : ('a -> 'b) -> 'a t -> 'b t

(** [filter pred stream] filters the lazy stream [stream] based on the predicate [pred]. *)
val filter : ('a -> bool) -> 'a t -> 'a t

(** [from_list lst] converts a list [lst] into a lazy stream. *)
val from_list : 'a list -> 'a t
