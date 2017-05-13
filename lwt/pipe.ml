let get_input prompt =
  print_string prompt;
  read_int ()

let x =
  get_input "Enter a" |> fun a ->
  get_input "Enter b" |> fun b ->
  a + b
