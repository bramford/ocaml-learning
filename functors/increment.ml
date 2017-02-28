module type X_int = sig
  val x : int
end;;

module Increment (M : X_int) : X_int = struct
  let x = M.x + 1
end;;

module Three = struct
  let x = 3
end;;

module Four = Increment(Three);;

module Three_and_more = struct
  let x = 3
  let y = "three"
end;;

module NewFour = Increment(Three_and_more);;

print_endline (string_of_int NewFour.x);;
print_endline (string_of_int Four.x);;

(* NewFour is equal to Four because the interface only exposed 'x' and not 'y' *)
