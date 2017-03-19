open Batteries;;

module MyNumbers = Map.Make(String);;

let print_if_val_gt_zero k v =
  match
    v > 0
  with
  | true -> Printf.printf "%s is greater than 0\n" k
  | false -> Printf.printf "%s is less than 0\n" k

let m = MyNumbers.empty
let m = MyNumbers.add "key1" 1 m
let m = MyNumbers.add "key2" 2 m
let () = MyNumbers.iter print_if_val_gt_zero m;;
let () = Printf.printf "key2 value is '%d'\n" (MyNumbers.find "key2" m);;
