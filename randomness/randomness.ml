Random.self_init ()

let myrandom i =
  string_of_int (Random.int i)

let rec randlist i m l =
  if i <= m then
    randlist (i + 1) m ((myrandom 100) :: l)
  else
    l

let mylist = randlist 0 10 [];;

List.iter (fun s -> print_endline s) mylist;;
(* extra line to ensure toplevel executes above line *)
