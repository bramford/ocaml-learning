let assert_number maybe_num =
  match maybe_num with
  | Some x  -> x
  | None -> Random.int 65535
;;

print_endline (string_of_int (assert_number (Some 3)));;
print_endline (string_of_int (assert_number (None)));;
