open Notty.Infix;;

type nature =
  | Good
  | Bad

type entity =
  | Human of nature
  | Tree of nature
  | Monster of nature

(*
type cell =
  { entity: entity;
    visible: bool;
    character: bool;
  }
*)

let entity_to_image = function
  | Human n ->
    (match n with
     | Good -> Notty.I.string Notty.A.(fg white) "H"
     | Bad -> Notty.I.string Notty.A.(fg red) "H")
  | Tree n ->
    (match n with
     | Good -> Notty.I.string Notty.A.(fg green) "T"
     | Bad -> Notty.I.string Notty.A.(fg lightblack) "T")
  | Monster n ->
    (match n with
     | Good -> Notty.I.string Notty.A.(fg white) "M"
     | Bad -> Notty.I.string Notty.A.(fg red) "M")

let rec image_of_world w i =
  match w with
  | [] | [_] -> i 
  | hd :: tl -> image_of_world tl (i <|> hd)
;;

let () =
  let myworld = [
    Human Good; 
    Human Good; 
    Human Bad;
    Human Bad;
    Tree Good; 
    Tree Good; 
    Tree Bad;
    Tree Bad;
    Monster Good; 
    Monster Good; 
    Monster Bad;
    Monster Bad;
  ] in
  let myworld_images = List.map entity_to_image myworld in
  let myimage = (image_of_world myworld_images Notty.I.empty) in
  Notty_unix.output_image myimage
