(* Implement a function that takes:
   * int
   * list of ints
   Returns a list of elements from the list
   that are greater than the given int *)

(* List methods *)
let elements_over n l =
  List.sort (Pervasives.compare) l |>
  List.filter (fun e -> e > n)
;;

let int_list = [1;2;3;4];;
elements_over 3 int_list;;

(* Recursive pattern matching *)
let rec elements_over_pm ?(nl=[]) x l =
  match l with
  | [] | [_] -> nl
  | hd :: tl ->
    let nl =
      if hd > x then
        hd :: tl
      else
        tl
    in
    elements_over_pm ~nl x tl
;;

let int_list = [1;2;3;4];;
elements_over_pm ~nl:[] 3 int_list;;
