(*
  These examples demonstrate simple Lwt usage for
   creating, writing to and printing an io channel
*)

(* Using ppx *)
let lwt_read_print ic =
  let%lwt data = Lwt_io.read_line ic in
  let%lwt () = Lwt_io.printf "%s\n" data in
  Lwt.return ()

let () =
  Lwt_main.run begin
    let ic, oc = Lwt_io.pipe () in
    let%lwt () = Lwt_io.write oc "Example with ppx\n" in
    let%lwt () = lwt_read_print ic in
    Lwt.return ()
  end

(* Using infix operator(s) *)
open Lwt.Infix

let lwt_read_print ic =
  Lwt_io.read_line ic >>= fun data ->
  Lwt_io.printf "%s\n" data >>= fun () ->
  Lwt.return ()

let () =
  Lwt_main.run begin
    let ic, oc = Lwt_io.pipe () in
    Lwt_io.write oc "Example with infix operators\n" >>= fun () ->
    lwt_read_print ic >>= fun () ->
    Lwt.return ()
  end
