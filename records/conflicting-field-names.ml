open Core;;

module Log_entry = struct
  type t = 
    { session_id: string;
      time: Time.t;
      important: bool;
      message: string;
    }
end

module Heartbeat = struct
  type t = 
    { session_id: string;
      time: Time.t;
      status_message: string;
    }
end

module Logon = struct
  type t = 
    { session_id: string;
      time: Time.t;
      user: string;
      credentials: string;
    }
end

let my_log_entry =
  { Log_entry.session_id = "1234";
    time = Time.now ();
    important = false;
    message = "something is happening";
  }

let get_session_id t = t.Log_entry.session_id;;
get_session_id my_log_entry;;

type client_info = 
  { addr: Unix.inet_addr;
    port: int;
    user: string;
    credentials: string;
    last_heartbeat_time: Time.t;
  };;

