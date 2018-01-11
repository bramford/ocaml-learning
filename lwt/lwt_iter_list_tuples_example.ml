open Lwt.Infix

(* Print standard tuple list *)
let () =
  let pt (a,b) = Printf.printf "%s, %s\n%!" a b in
  [("a","b");("c","d")] |> fun my_tuple_list ->
  List.iter pt my_tuple_list

(* Print Lwt tuple list in parallel *)
let () =
  let pt lwttpl =
    lwttpl >>= fun (a,b) ->
    Lwt_unix.sleep (4.0 -. b) >>= fun () ->
    Lwt_io.printf "%s, %f\n%!" a b
  in
  let my_tuple_list_lwt = [Lwt.return ("a",1.); Lwt.return ("b",2.)] in
  Lwt_main.run (Lwt_list.iter_p pt my_tuple_list_lwt)
