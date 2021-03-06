open Graphics;;


let graph = (open_graph "");;

let half_x = (size_x graph) / 2;;
let half_y = (size_y graph) / 2;;

let max_radius =
  if half_x > half_y then
    half_x
  else
    half_y
;;

let ring_count = 5 * 4 * 3 * 2 ;;

for i = Random.int ring_count downto 1 do
  let radius = max_radius / ring_count in
  let pick_color x =
    if x mod 5 == 0 then black
    else if x mod 4 = 0 then green
    else if x mod 3 = 0 then blue
    else if x mod 2 = 0 then yellow
    else if x mod 1 = 0 then red
    else white
  in
  set_color (pick_color i);
  fill_circle half_x half_y radius
done;;
read_line ();;
