module Gr = Graphics;;

Gr.open_graph " 640x480";;
let circle = (Gr.fill_circle 320 240 240);;
Unix.sleep 10;;
Gr.close_graph circle;;

