(* bin/main.ml *)

open Lazy_stream

let () =
  (* Example with a list *)
  let list_stream = from_list [1; 2; 3; 4; 5] in
  let doubled_list_stream = map (( * ) 2) list_stream in
  let filtered_list_stream = filter (fun x -> x mod 2 = 0) doubled_list_stream in
  let result_list = take 3 filtered_list_stream in
  Printf.printf "List : ";
  List.iter (fun x -> Printf.printf "%d " x) result_list;
  print_newline ();

  (* Example with a tuple *)
  let tuple_stream = from_list [1; 2; 3; 4; 5] in
  let squared_tuple_stream = map (fun x -> (x, x * x)) tuple_stream in
  let result_tuple = take 3 squared_tuple_stream in
  Printf.printf "Tuple : ";
  List.iter (fun (x, y) -> Printf.printf "(%d, %d) " x y) result_tuple;
  print_newline ()
