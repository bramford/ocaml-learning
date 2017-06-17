open Core;;

(* Record type *)
type host_info =
  { hostname  : string;
    os_name   : string;
    cpu_arch  : string;
    timestamp : Time.t;
  };;

#require "core_extended";;
open Core_extended.Std;;

(* Record construction *)
let my_host =
  let sh = Shell.sh_one_exn in
  { hostname = sh "hostname";
    os_name = sh "uname -s";
    cpu_arch = sh "uname -m";
    timestamp = Time.now ();
  };;

my_host.cpu_arch;;
