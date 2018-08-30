open Core

module type Comparable = sig
  type t
  val compare : t -> t -> int
end

module type Interval_intf = sig
  type t
  type endpoint
  val create : endpoint -> endpoint -> t
  val is_empty : t -> bool
  val contains : t -> endpoint -> bool
  val intersect : t -> t -> t
end

module Make_interval(Endpoint : Comparable) : (Interval_intf with type endpoint := Endpoint.t) = struct

  type t = | Interval of Endpoint.t * Endpoint.t
           | Empty

  (** [create low high] creates a new interval from [low] to
      [high].  If [low > high], then the interval is empty *)
  let create low high =
    if Endpoint.compare low high > 0 then Empty
    else Interval (low,high)

  (** Returns true iff the interval is empty *)
  let is_empty = function
    | Empty -> true
    | Interval _ -> false

  (** [contains t x] returns true iff [x] is contained in the
      interval [t] *)
  let contains t x =
    match t with
    | Empty -> false
    | Interval (l,h) ->
      Endpoint.compare x l >= 0 && Endpoint.compare x h <= 0

  (** [intersect t1 t2] returns the intersection of the two input
      intervals *)
  let intersect t1 t2 =
    let min x y = if Endpoint.compare x y <= 0 then x else y in
    let max x y = if Endpoint.compare x y >= 0 then x else y in
    match t1,t2 with
    | Empty, _ | _, Empty -> Empty
    | Interval (l1,h1), Interval (l2,h2) ->
      create (max l1 l2) (min h1 h2)

end

module Int_interval = Make_interval(Int)
module String_interval = Make_interval(String)
module Float_interval = Make_interval(Float)

let i1 = Int_interval.create 3 5
let i2 = Int_interval.create 2 6
let ir = Int_interval.intersect i1 i2

let s1 = String_interval.create "3" "5"
let s2 = String_interval.create "2" "6"
let sr = String_interval.intersect s1 s2

let f1 = Float_interval.create 3. 5.
let f2 = Float_interval.create 2. 6.
let fr = Float_interval.intersect f1 f2
