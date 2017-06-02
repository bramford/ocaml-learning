let languages = ["C";"OCaml";"Python"]

let rec sum l =
  match l with
  | [] -> 0
  | x :: y -> x + sum y 
;;

sum [1;2;3];;
sum (1 :: 2 :: 3 :: []) ;;



(* Iterate over list of integers. All integers that return true with [f] will be appended to a returned list. If no integers match the condition, return an empty list *)

 
(* get_input "Enter b" |> fun b ->*)
(*
let () =
  let new_list = [];;
  List.iter (fun x -> x > 3) int_list |>
*)
  

  
(*
let rec check_over y l =
  match l with
  | [] -> []
  | hd :: tl -> 
    if (hd > y) then check_over (y (hd :: tl)) else check_over (y tl)
;;
   *)

let int_list = [1;2;3];;
List.sort (Pervasives.compare int_list) |> fun int_list_s ->
let int_list_over_three = List.filter (fun x -> x > 3) int_list_s ;;
int_list_over_three;;

(*
let hd = [1]
let tl = [2;3]
let y = 3
if (hd > y) then check_over (y (hd :: tl)) else check_over (y tl)

let rec check_over y l =
  match l with
  | [] -> []
  | [hd] -> 
    if (hd >= y) then [hd] else []
  | hd :: tl ->
    if (hd >= y) then (check_over (y (tl :: hd)))
    else (check_over (y [tl]))
;;

(*
List.iter int_list (x > 3)

let  = function
  | 

let elements_over x l =

  List.sort Pervasives.compare l |> fun l_sorted ->
  let rec loop i = function
    match l with
  

  List.for_all (fun x -> x > 2) numbers |> fun original_above_two ->
  if not original_above_two then
  List.tl numbers |> fun numbers_short ->
  List.for_all
  all_above_two;;

elements_over 3 [1;2;3;4;5]
   *)
