open OUnit2
open Lazy_stream


let test_from_list _ =
  let stream = from_list [1; 2; 3; 4; 5] in
  let result = take 3 stream in
  assert_equal [1; 2; 3] result

let test_map _ =
  let stream = from_list [1; 2; 3] in
  let mapped_stream = map (( * ) 2) stream in
  let result = take 3 mapped_stream in
  assert_equal [2; 4; 6] result

let test_filter _ =
  let stream = from_list [1; 2; 3; 4; 5] in
  let filtered_stream = filter (fun x -> x mod 2 = 0) stream in
  let result = take 3 filtered_stream in
  assert_equal [2; 4] result

let test_take _ =
  let stream = from_list [1; 2; 3; 4; 5] in
  let result = take 3 stream in
  assert_equal [1; 2; 3] result



let test_list_stream _ =
  let list_stream = from_list [1; 2; 3; 4; 5] in
  let doubled_list_stream = map (( * ) 2) list_stream in
  let filtered_list_stream = filter (fun x -> x mod 2 = 0) doubled_list_stream in
  let result_list = take 3 filtered_list_stream in
  assert_equal [2; 4; 6] result_list
  

let test_tuple_stream _ =
  let tuple_stream = from_list [1; 2; 3; 4; 5] in
  let squared_tuple_stream = map (fun x -> (x, x * x)) tuple_stream in
  let result_tuple = take 3 squared_tuple_stream in
  assert_equal [(1, 1); (2, 4); (3, 9)] result_tuple


let suite =
  "Lazy Stream Tests" >::: [
    "test_from_list" >:: test_from_list;
    "test_map" >:: test_map;
    "test_filter" >:: test_filter;
    "test_take" >:: test_take;
    "test_list_stream" >:: test_list_stream;
    "test_tuple_stream" >:: test_tuple_stream;
  ]

let () =
  run_test_tt_main suite
