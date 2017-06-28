#warnings "+9";;
#require "core_extended";;
open Core_extended.Std;;
open Printf;;

type host_info =
  { hostname  : string;
    os_name   : string;
    cpu_arch  : string;
    os_release: string;
    timestamp : Time.t;
  };;

let host_info_to_string { hostname = h;
                          os_release = rel; os_name = os; cpu_arch = c;
                          timestamp = ts;
                        } =
  sprintf "%s (%s %s / %s, on %s)" h os rel c (Time.to_sec_string ~zone:Core.Zone.local ts);;

(* label punning *)
let my_host =
  let sh = Shell.sh_one_exn in
  { hostname = sh "hostname";
    os_name = sh "cat /etc/os-release | grep '^ID' | cut -d '=' -f 2";
    cpu_arch = sh "uname -m";
    os_release = sh "cat /etc/debian_version";
    timestamp = Time.now ();
  };;

host_info_to_string my_host;;

(* field punning *)
let my_host_pun =
  let sh cmd = Shell.sh_one_exn cmd in
  let hostname = sh "hostname" in
  let  os_name = sh "cat /etc/os-release | grep '^ID' | cut -d '=' -f 2" in
  let cpu_arch = sh "uname -m" in
  let os_release = sh "cat /etc/debian_version" in
  let timestamp = Time.now () in
  { hostname; os_name; cpu_arch; os_release; timestamp };;

host_info_to_string my_host_pun;;

(* both label and field punning in a function *)
let create_host_info
    ~hostname ~os_name ~cpu_arch ~os_release =
  { os_name; cpu_arch; os_release;
    hostname = String.lowercase hostname;
    timestamp = Time.now ()
  }
;;

let host_info =
  let sh cmd = Shell.sh_one_exn cmd in
  create_host_info
    ~hostname:(sh "hostname")
    ~os_name:(sh "cat /etc/os-release | grep '^ID' | cut -d '=' -f 2")
    ~cpu_arch:(sh "uname -m")
    ~os_release:(sh "cat /etc/debian_version")
;; 

host_info_to_string host_info;;
