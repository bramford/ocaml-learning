open Graphics;;

let pick_color x = match x with
  | ((x mod 5), 0) -> green
  | ((x mod 4), 0) -> purple
  | (x mod 3, 0) -> blue
  | (x mod 2, 0) -> yellow
  | (x mod 1, 0) -> red
  ;;




open_graph " 640x480";;
for i = Random.int (5 * 4 * 3 * 2) downto 1 do
  let radius = i * 20 in
  let set_color = match i with
      | i mod 5 = 0 -> green
      | i mod 4 = 0 -> purple
      | i mod 3 = 0 -> blue
      | i mod 2 = 0 -> yellow
      | i mod 1 = 0 -> red
  fill_circle 320 240 radius
done;;
read_line ();;
