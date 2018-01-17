open Notty.Infix;;

let myfirststyle = Notty.A.(fg red) in
let mysecondstyle = Notty.A.(bg blue) in
let mystyle = myfirststyle ++ mysecondstyle in
let wow = Notty.I.string mystyle "Wow!" in
Notty.I.(wow <-> (void 2 0 <|> wow)) |> Notty_unix.output_image

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

let rec image_of_world w ?(i=Notty.I.empty) =
  match w with
  | [] | [_] -> i 
  | hd :: tl -> image_of_world tl ~i:(i <|> hd)
;;

let () =
  let myworld = [
    Human (Good); 
    Human (Bad);
  ] in
  let myworld_images = List.map myworld entity_to_image in
  let myimage = image_of_world myworld_images in
  Notty_unix.output_image myimage
  

(*   let mymap_image = List.iter mymap (fun o n -> o <|> n) in *)
