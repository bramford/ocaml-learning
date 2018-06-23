let () =
  let arg_anon = ref "" in
  let arg_int = ref 1 in
  let arg_string = ref "abc" in

  let speclist = [
    ("-int", Arg.Int (fun i -> arg_int := i), "An integer (default: 1)");
    ("-string", Arg.String (fun s -> arg_string := s), "A string (default: 'abc')");
  ] in

  let usage = "Usage: ./arg_stdlib STRING\n" in

  Arg.parse
    speclist
    (fun anon_arg -> arg_anon := anon_arg )
    usage;

  match !arg_anon with
  | "" -> Printf.eprintf "ERROR: No anonymous argument given\n%s" usage; exit 1;
  | _ -> ();

    Printf.eprintf "((anonymous '%s') (integer %d) (string '%s'))\n" !arg_anon !arg_int !arg_string
