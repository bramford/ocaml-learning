let int_list = [1;2;3;4];;

(* method using List methods and pipe*)
let l_over x l =
  List.sort (Pervasives.compare) l |> fun l_s ->
  List.filter (fun e -> e > x) l_s
;;

l_over 3 int_list;;

(* method using recursive pattern matching*)
let rec l_over_pm x l ?(nl=[]) =
  match l with
  | [] | [_] -> nl
  | hd :: tl ->
    if hd > x then l_over_pm x tl ~nl:(hd :: nl)
    else l_over_pm x tl ~nl:nl
;;

l_over_pm 3 int_list;;
