type mutable_record = {
  mutable a: int;
  b: int;
}

let mr =
  let a = 1 in
  let b = 1 in
  { a; b }
;;

mr.a <- 3;;
