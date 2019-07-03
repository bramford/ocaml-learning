module A = struct
  type t =
    { foo: string;
      bar: int;
    }
end

module B = struct
  type t =
  { foo: string;
    baz: string;
  }
end

type t =
  | Herp of A.t
  | Derp of B.t
  | Hadur of string

(*
type t = [
  | `Herp of A.t
  | `Derp of B.t
  | `Hadur of string
  ]
*)

type data =
  { herp: A.t;
    derp: B.t;
    hadur: Hadur;
  }
