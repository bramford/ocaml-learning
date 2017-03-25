module SS = Set.Make(Int32);;

let m = SS.empty
let n = SS.empty
let m = SS.add (Int32.of_int 1) m
let n = SS.add (Int32.of_int 1) n
let () =
  match (SS.equal m n) with
  | true -> print_endline "They are equal"
  | false -> print_endline "They are not equal";;
