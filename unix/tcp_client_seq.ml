(* Example sequential unix tcp client , originally derived from
   https://caml.inria.fr/pub/docs/oreilly-book/html/book-ora187.html *)

let open_connection sockaddr =
  let domain = Unix.domain_of_sockaddr sockaddr in
  let sock = Unix.socket domain Unix.SOCK_STREAM 0 in 
  try
    Unix.connect sock sockaddr ;
    (Unix.in_channel_of_descr sock, Unix.out_channel_of_descr sock)
  with
  | exn ->
    Unix.close sock ;
    raise exn

let shutdown_connection inchan =
  Unix.shutdown (Unix.descr_of_in_channel inchan) Unix.SHUTDOWN_SEND

let main_client client_fun  =
  if Array.length Sys.argv < 3 then
    Printf.printf "ERROR: Not enough args given\n$1 - IP/hostname to connect to\n$2 - TCP port to connect to\n"
  else
    let server = Sys.argv.(1) in
    let server_addr =
      try Unix.inet_addr_of_string server with
      | Failure e -> 
        try (Unix.gethostbyname server).Unix.h_addr_list.(0) with
        | Not_found ->
          Printf.printf "ERROR: Unknown server '%s'\n" server ;
          exit 2
      | exn -> 
        Printf.printf "ERROR: Invalid IP/host address\n" ;
        exit 2
    in
    try 
      let port = int_of_string (Sys.argv.(2)) in
      let sockaddr = Unix.ADDR_INET(server_addr,port) in 
      let ic,oc = open_connection sockaddr in
      client_fun ic oc ;
      shutdown_connection ic ;
    with
    | Failure e ->
      Printf.printf "ERROR: Invalid TCP port\n" ;
      exit 2

let client_fun ic oc = 
  try
    while true do  
      print_string  "Request: " ;
      flush stdout ;
      output_string oc ((input_line stdin)^"\n") ;
      flush oc ;
      let r = input_line ic in
      Printf.printf "Response: '%s'\n\n" r ;
      if r = "END" then ( shutdown_connection ic ; raise Exit) ;
    done
  with 
  | Exit -> exit 0
  | exn ->
    shutdown_connection ic ;
    raise exn

let go_client () = main_client client_fun ;;

go_client ()
