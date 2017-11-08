(* Immutable *)
let double_plus_one n =
  let x = n in
  let y = x in
  let x = x + 1 in
  y + x 
;;

(* Mutable *)
let mutable_double_plus_one n =
  (* Set ref value *)
  let x = ref n in
  (* Set y to the value of x *)
  let y = !x in
  (* Set the value of x to the value of x plus 1 *)
  x := !x + 1;
  (* Execute y plus the value of x *)
  y + !x
;;

Printf.printf "%d\n" (double_plus_one 3);;
Printf.printf "%d\n" (mutable_double_plus_one 3);;
