(* lib/lazy_stream.ml *)

type 'a t = 'a lazy_stream_node Lazy.t

and 'a lazy_stream_node =
  | Cons of 'a * 'a t
  | Nil

let empty = lazy Nil

let cons hd tl = lazy (Cons (hd, tl))

let rec force stream =
  lazy (
    match Lazy.force stream with
    | Cons (hd, tl) ->
      Cons (hd, force tl)
    | Nil ->
      Nil
  )

let rec take n stream =
  if n <= 0 then []
  else
    match Lazy.force stream with
    | Cons (hd, tl) ->
      hd :: take (n - 1) tl
    | Nil ->
      []

let rec map f stream =
  lazy (
    match Lazy.force stream with
    | Cons (hd, tl) -> Cons (f hd, map f tl)
    | Nil -> Nil
  )

let rec filter pred stream =
  lazy (
    match Lazy.force stream with
    | Cons (hd, tl) when pred hd -> Cons (hd, filter pred tl)
    | Cons (_, tl) -> Lazy.force (filter pred tl)
    | Nil -> Nil
  )

let rec from_list lst =
  lazy (
    match lst with
    | [] -> Nil
    | hd :: tl -> Cons (hd, from_list tl)
  )
