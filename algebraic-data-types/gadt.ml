(* GADT example taken from http://mads-hartmann.com/ocaml/2015/01/05/gadt-ocaml.html *)

type _ value =
  | Bool : bool -> bool value
  | Int : int -> int value

type _ expr =
  | Value : 'a value -> 'a expr
  | If : bool expr * 'a expr * 'a expr -> 'a expr
  | Eq : 'a expr * 'a expr -> bool expr
  | Lt : int expr * int expr -> bool expr

let rec eval : type a. a expr -> a = function
  | Value (Bool b) -> b
  | Value (Int i) -> i
  | If (b, l, r) -> if eval b then eval l else eval r
  | Eq (a, b) -> (eval a) = (eval b)
  | Lt (a,b) -> (eval a) < (eval b)
;;

let result_1 = eval (If ((Eq ((Value (Int 2)), (Value (Int 2)))),
      (Value (Int 42)),
      (Value (Int 12))))

let result_2 = eval (If ((Eq ((Value (Int 2)), (Value (Int 2)))),
      (Value (Bool true)),
      (Value (Bool false))))

(* invalid result example
let result_3 = eval (If ((Value (Int 42)), (Value (Int 42)), (Value (Int 42))))
*)
