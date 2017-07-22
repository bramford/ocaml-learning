open Lwt.Infix

(* Print standard tuple list *)
let () =
  let pt (a,b) = Printf.printf "%s, %s\n%!" a b in
  [("a","b");("c","d")] |> fun my_tuple_list ->
  List.iter pt my_tuple_list

(* Print Lwt tuple list *)
let () =
  let pt tp =
    let (a,b) = (Lwt_main.run tp) in
    Lwt_io.printf "%s, %s\n%!" a b
  in
  [Lwt.return ("a","b"); Lwt.return ("c","d")] |> fun my_tuple_list ->
  Lwt_main.run (Lwt_list.iter_p pt my_tuple_list)

(* Print standard tuple list (converted from lwt tuple list) *)
let () =
  let pt lwttpl =
    let (a,b) = (Lwt_main.run lwttpl) in
    Printf.printf "%s, %s\n%!" a b
  in
  [Lwt.return ("a","b"); Lwt.return ("c","d")] |> fun my_tuple_list_lwt ->
  List.iter pt my_tuple_list_lwt
