open Base

(* Returns true if the list elements are in a non-decreasing order *)
let rec nondecreasing l =
  match l with
  | [] | [_] -> true
  | hd :: nhd :: tl ->
    if hd > nhd then false
    else nondecreasing (nhd :: tl)

(* Returns a list of all single elements that can be removed, ensuring
   the resulting list is in non-decreasing order *)
let single_elements_to_remove l =
  (* Checks for non-decreasing order in each case where an element
     in the list is removed *)
  let rec check_can_be_removed n l al =
    let al =
      if nondecreasing (List.drop l (n -1)) then n :: al else al
    in
    if n >= 0 then
      check_can_be_removed (n - 1) l al
    else al
  in
  if nondecreasing l then
    List.range 1 ~stop:`inclusive (List.length l)
  else
    List.map (check_can_be_removed (List.length l) l []) ~f:(fun n -> n + 1)
;;

(* Test cases *)
single_elements_to_remove [1;2;3;2];;
single_elements_to_remove [5;2;3];;
single_elements_to_remove [1;2;3;2;3];;
single_elements_to_remove [1;2;3;4;5];;
single_elements_to_remove [5];;
single_elements_to_remove [1;2;1;2;3;1];;
single_elements_to_remove [1;3;1;2;3;1];;
