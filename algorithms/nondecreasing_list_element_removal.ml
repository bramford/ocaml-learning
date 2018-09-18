(* Drop the nth element from a List *)
(* This function or somthing similar likely already exists in the
   stdlib but I couldn't find it *)
let rec drop n l =
  match (n,l) with
  | (0, hd :: tl) -> tl
  | (n, hd :: tl) -> hd :: drop (n - 1) tl
  | (_, []) -> []

(* Generates a list of n integers that count upwards from 1 *)
(* This function or somthing similar likely already exists in the
   stdlib but I couldn't find it *)
let rec nlist n l =
  if n == 0 then
    l
  else
    nlist (n - 1) (n :: l)

(* Returns true if the list elements are in a non-decreasing order *)
let rec nondecreasing l =
  match l with
  | [] | [_] -> true
  | hd :: nhd :: tl ->
    if hd > nhd then false else nondecreasing (nhd :: tl)
;;

(* Returns a list of all single elements that can be removed, ensuring
   the resulting list is in in non-decreasing order *)
let single_elements_to_remove l =
  (* Checks for non-decreasing order in each case where an element
     in the list is removed *)
  let rec check_can_be_removed n l al =
    let al =
      if nondecreasing (drop n l) then n :: al else al
    in
    if n > 0 then check_can_be_removed (n - 1) l al else al
  in
  if nondecreasing l then
    nlist (List.length l) []
  else
    List.map (fun n -> n + 1) (check_can_be_removed (List.length l) l [])
;;

(* Test cases *)
single_elements_to_remove [1;2;3;2];;
single_elements_to_remove [5;2;3];;
single_elements_to_remove [1;2;3;2;3];;
single_elements_to_remove [1;2;3;4;5];;
single_elements_to_remove [5];;
single_elements_to_remove [1;2;1;2;3;1];;
single_elements_to_remove [1;3;1;2;3;1];;
