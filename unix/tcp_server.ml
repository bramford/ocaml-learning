(* Example unix tcp server, originally derived from
   https://caml.inria.fr/pub/docs/oreilly-book/html/book-ora187.html *)

let establish_server server_fun sockaddr =
  let domain = Unix.domain_of_sockaddr sockaddr in
  let sock = Unix.socket domain Unix.SOCK_STREAM 0 in
  try
    Unix.bind sock sockaddr ;
    Unix.listen sock 3 ;
      while true do
        let (s, caller) = Unix.accept sock in
        match Unix.fork() with
        | 0 ->
          if Unix.fork() <> 0 then exit 0 ; 
          let inchan = Unix.in_channel_of_descr s in
          let outchan = Unix.out_channel_of_descr s in
          server_fun caller inchan outchan ;
          close_in inchan ;
          close_out outchan ;
          exit 0
        | id ->
          Unix.close s ;
          ignore(Unix.waitpid [] id)
      done
  with
  | Sys.Break -> 
    print_endline "INFO: Caught Ctrl-C, shutting down" ;
    flush (Unix.out_channel_of_descr Unix.stdout) ;
    Unix.shutdown sock Unix.SHUTDOWN_ALL ;
    Unix.close sock ;
    exit 2

let main_server serv_fun =
  if Array.length Sys.argv < 3 then
    Printf.printf "ERROR: Not enough args given\n$1 - IP/hostname to listen on\n$2 - TCP port to listen on $2\n"
  else try
    let my_address = Unix.inet_addr_of_string Sys.argv.(1) in
    let port = int_of_string Sys.argv.(2) in
    establish_server serv_fun (Unix.ADDR_INET(my_address, port))
  with
  | Failure e ->
    match e with
    | "inet_addr_of_string" -> Printf.printf "ERROR: Invalid IP/host address\n"
    | "int_of_string" -> Printf.printf "ERROR: Invalid TCP port\n"
    | _ -> Printf.printf "ERROR: %s\n" e

let echosock_server caller ic oc =
  try
    while true do    
      let s = input_line ic in 
      let caller_s =
        match caller with
        | Unix.ADDR_INET (a,b) -> (Unix.string_of_inet_addr a)^":"^(string_of_int b) 
        | _ -> ""
      in
      match caller_s with
      | "" -> output_string oc (s^"\n") ;
      | _ -> output_string oc ("caller: "^caller_s^", message: "^s^"\n") ;
      flush oc ;
    done
  with _ ->
    Printf.printf "End of text\n" ;
    flush (Unix.out_channel_of_descr Unix.stdout) ;
    Unix.shutdown_connection ic ;
    Unix.close (Unix.descr_of_out_channel oc)

let go_uppercase_service () = 
  Sys.catch_break true ;
  Unix.handle_unix_error main_server echosock_server
;;

go_uppercase_service ()
