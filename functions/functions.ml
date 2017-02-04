let average a b =
  let sum = a +. b in
  sum /. 2.0;;

let print_stuff s =
  print_endline s;;

let rec range a b =
  if a > b then []
  else a :: range (a + 1) b;;

let give_me_a_three x = 3
