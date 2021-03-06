(*#require "lwt";;*)
open Lwt.Infix

let get_input prompt =
  print_string (prompt ^ ": ");
  Lwt.return (read_int ())

let x =
  get_input "Enter a" >|= fun a ->
  get_input "Enter b" >|= fun b ->
  Printf.printf "%d + %d = %d" a b (a + b)
;;
