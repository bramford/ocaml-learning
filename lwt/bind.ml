open Lwt

let get_input prompt =
  print_string prompt;
  Lwt.return (read_int ())

let x =
  get_input "Enter a" >>= fun a ->
  get_input "Enter b" >>= fun b ->
  Lwt.return (a + b)