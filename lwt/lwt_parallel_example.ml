open Lwt.Infix

let wait_time n =
  Lwt_io.printf "%f started\n%!" n  >>= fun () ->
  Lwt_unix.sleep (4.0 -. n) >>= fun () ->
  Lwt_io.printf "%f done\n%!" n >>= fun () ->
  Lwt_io.flush Lwt_io.stdout

let () =
  let start_time = Unix.gettimeofday () in
  Printf.printf "Start time: %f\n%!" start_time;

  Lwt_main.run (Lwt_list.iter_p (wait_time) [1.0;2.0;3.0]);

  let end_time = Unix.gettimeofday () in
  Printf.printf "End time: %f\n%!" end_time;
  Printf.printf "Took: %f\n%!" (end_time -. start_time);

(*
  Output:

  1.000000 started
  1.000000 done
  2.000000 started
  2.000000 done
  3.000000 started
  3.000000 done
  Start time: 1500196376.614725
  End time: 1500196382.617343
  Took: 6.002618

  Issues:

    1. Why is the `start_time` printf statement
       not printing before the` wait_time` list is iterated?
    2. I expected the `Lwt_list.iter_s` to execute `wait_time`
       for each float in the list in parallel.
       The total time would then be ~3 seconds instead of ~6.
*)
