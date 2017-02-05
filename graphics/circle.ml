open Graphics;;


open_graph " 640x480";;
for i = Random.int (5 * 4 * 3 * 2) downto 1 do
  let radius = i * 20 in
    let pick_color x =
      if x mod 5 == 0 then black
      else if x mod 4 = 0 then green
      else if x mod 3 = 0 then blue
      else if x mod 2 = 0 then yellow
      else if x mod 1 = 0 then red
      else white
    in
  set_color (pick_color i);
  fill_circle 320 240 radius
done;;
read_line ();;
