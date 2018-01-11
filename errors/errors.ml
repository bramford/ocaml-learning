let herp = [ Ok 3; Error "some error"; Ok 4; Error "some other error" ];;

let derp x =
  match x with
  | Ok o -> "OK: "^string_of_int o
  | Error e ->
    match e with
    | string -> "ERROR: "^e
;;

List.iter (fun i -> print_endline (derp i)) herp
