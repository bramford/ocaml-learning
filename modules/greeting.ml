module type Greeting_type = sig
  val goodbye : unit -> unit
  val hello_goodbye : unit -> unit
  module Hello : sig
    val hello : unit ->  unit
  end
end

module Greeting : Greeting_type = struct
  module Hello  = struct
    let message = "Hello"
    let hello () = print_endline message
  end
  let goodbye () = print_endline "Goodbye"
  let hello_goodbye () =
    Hello.hello ();
    goodbye ()
end;;

