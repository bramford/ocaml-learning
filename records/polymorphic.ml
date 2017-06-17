open Core;;
#require "core_extended";;
open Core_extended.Std;;

(* Polymorphic record *)
type 'a timestamped =
  { item  : 'a;
    time : Time.t;
  };;

(* Returns the record with the earliest timestamp (from a list of timetamp records)*)
let first_timestamped list =
  List.reduce list ~f:(fun a b -> if a.time < b.time then a else b)
;;

(* Takes list (of any type) and returns a list containing each element converted to a timestamp record *)
let rec list_to_ts_list ?(tslist=[]) list = 
  match list with
  | [] | [_] -> tslist
  | hd :: tl ->
    { item = hd; time = Time.now (); } |> fun ts_item ->
    list_to_ts_list tl ~tslist:(ts_item :: tslist)
;;

(* Prove that record and functions are polymorphic *)
list_to_ts_list [1;2;3] |> first_timestamped;;
list_to_ts_list ["a";"b";"c"] |> first_timestamped;;
