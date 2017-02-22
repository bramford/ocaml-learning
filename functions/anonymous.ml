open Printf
let my_data = [ "a"; "beautiful"; "day" ]

(* normal *)
let () =
  let print_single_string s = 
    printf "%s\n" s
  in
  List.iter print_single_string my_data
;;

(* anonymous *)
let () = List.iter (fun s -> printf "%s\n" s) my_data;;
