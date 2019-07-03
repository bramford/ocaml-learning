open Core

type t = int String.Map.t;;

let empty = String.Map.empty

let touch t key =
  let new_count =
    match (String.Map.find t key) with
    | Some x -> x + 1
    | None -> 0
  in
  String.Map.set t key new_count

let to_list t =
  String.Map.to_alist t
