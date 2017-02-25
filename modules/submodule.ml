#!/usr/bin/env ocaml
#use "topfind"
#use "greeting.ml"

let () = 
  Greeting.Hello.hello ();
  Greeting.goodbye ();
  Greeting.hello_goodbye ()
;;
