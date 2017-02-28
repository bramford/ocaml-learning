module type X_int = sig
  val x : int
end;;

module Increment (M : X_int) : X_int
