(* Immutable *)
let double_plus_one x =
  x * 2 + 1
;;

(* Mutable *)
let mutable_double_plus_one x =
  let x = ref x in
  let y = !x in
  x := !x + 1;
  y + !x
;;

Printf.printf "%d\n" (double_plus_one 3);;
Printf.printf "%d\n" (mutable_double_plus_one 3);;
