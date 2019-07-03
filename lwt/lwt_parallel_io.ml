(*
  This is a simple parallel IO example that shows how
  data can be both send and received using an Lwt pipe
  with handler functions bound using Lwt.bind

  - Generate 5 UUIDs as strings
  - Create an IO pipe
  - Send the 5 UUIDs to the pipe input channel
  - Receive the 5 UUIDs from the pipe output channel
*)

let gen_uuids n =
  List.init
    n
    (fun _ -> Uuid_unix.create () |> Uuid.to_string)

let rec recv ic uuids =
  match uuids with
  | [] -> Lwt.return ()
  | _ ->
    let%lwt line_opt = Lwt_io.read_line_opt ic in
    begin match line_opt with
    | Some s ->
      let%lwt () = Lwt_io.printf "Received: %s\n%!" s in
      recv
        ic
        (List.filter
          (fun i -> not (String.equal s i))
          uuids)
    | _ ->
      let%lwt () = Lwt_io.printf "Received: <empty line>\n%!" in
      recv
        ic
        uuids
    end

let send oc uuids =
  Lwt_list.iter_p
    (fun s ->
       let%lwt () = Lwt_io.printf "Sending: %s\n%!" s in
       Lwt_io.write_line oc s)
    uuids

let () =
  let uuids = gen_uuids 5 in
  let ic, oc = Lwt_io.pipe () in
  Lwt_main.run (
    let%lwt () = send oc uuids in
    recv ic uuids
  )
