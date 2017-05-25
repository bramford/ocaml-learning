let first_if_true test x y =
  if test x then x else y
;;

let big_number z =
  z > 3
;;

let long_string s = 
  String.length s > 6
;;

first_if_true big_number 3 4;;
first_if_true long_string "long" "looooong";;
