open Lwt.Infix

let wait_time n =
  Lwt_io.printf "%f started\n%!" n  >>= fun () ->
  Lwt_unix.sleep (4.0 -. n) >>= fun () ->
  Lwt_io.printf "%f done\n%!" n >>= fun () ->
  Lwt_io.flush Lwt_io.stdout

let () =
  let start_time = Unix.gettimeofday () in
  Printf.printf "Start time: %f\n%!" start_time;

  Lwt_main.run (Lwt_list.iter_p wait_time [1.0;2.0;3.0]);

  let end_time = Unix.gettimeofday () in
  Printf.printf "End time: %f\n%!" end_time;
  Printf.printf "Took: %f\n%!" (end_time -. start_time);
