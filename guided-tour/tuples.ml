let a_tuple = ("a", 3);;
let b_tuple = (1., 3, "c");;

let (x,y) = a_tuple;;
y + String.length x;;

let (a,b,c) = b_tuple;;

(* standard style looks alright *)
a +. (float_of_int b) +. (float_of_int ((String.length c) - 1))

(* and pipe style looks crap (in this case) *)
float_of_int b |> fun fb ->
(String.length c) - 1 |> fun slc ->
float_of_int slc |> fun fslc ->
a +. fb +. fslc

let distance (x1,x2) (y1,y2) =
  sqrt ((x1 -. x2) ** 2. +. (y1 -. y2) ** 2.);;

distance (1.,2.) (3.,4.);;
