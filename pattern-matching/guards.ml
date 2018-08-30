(* Oddly not part of the stdlib... Maybe because
   it would be hard to handle polymorphism? *)
let negate n = 0 - n

(* The result is the sign of the original number reversed, and the step added to the absolute value *)
let stepReverseSign n s =
  match (n,s) with
  | (n,0) -> n
  | (n,s) when n > 0 -> (negate n) - s
  | (n,s) when n > 0 -> (negate n) + s
  | (_,_) -> 0
