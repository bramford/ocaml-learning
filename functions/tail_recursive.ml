#require "containers";;
open CCList

(* normal *)
let rec length = function
  | [] -> 0
  | _ :: tl -> 1 + length tl 

let make_list n = CCList.init n (fun x -> x);;

length (make_list 10);;
length (make_list 10_000_000);;

(* tail-recursive *)
let rec length_plus_n l n =
  match l with
  | [] -> n
  | _ :: tl -> length_plus_n tl (n + 1)
;;

let length l = length_plus_n l 0;;

length (make_list 10);;
length (make_list 10_000_000);;
