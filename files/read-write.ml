(* Write *)
let file = open_out "./somefile";;
let write = Printf.fprintf file "%s" "abc123\nxyz456\n";;
flush file;;
close_out file;;

(* Read *)
let ic = open_in "./somefile";;
let sic = Scanf.Scanning.from_channel ic;;
Scanf.bscanf sic "%s" print_endline;;
flush;;
close_in ic;;
