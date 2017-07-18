#require "lwt";;
#require "lwt-pipe";;

open Lwt.Infix

let l = [1;2;3;4];;
let pipeol = Lwt_pipe.of_list l;;
let pipeolmap = Lwt_pipe.Reader.map ~f:(fun x->x+1) pipeol;;
let pipel = Lwt_pipe.to_list pipeolmap;;
