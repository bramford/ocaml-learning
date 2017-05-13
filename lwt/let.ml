let get_input prompt =
  print_string prompt;
  read_int ()

let x =
  let a = get_input "Enter a" in
  let b = get_input "Enter b" in
  a + b
