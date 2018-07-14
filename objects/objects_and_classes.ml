(* Immediate object *)

let x_obj =
  object
    val mutable x = 0
    method get_x = x
    method print_x = print_int x
    method incr_x = x <- x + 1
  end
;;

x_obj#incr_x ;;
x_obj#get_x ;;
x_obj#print_x ;;


(* Class *)

class x_class =
  object
    val mutable x = 0
    method get_x = x
    method print_x = print_int x
    method incr_x = x <- x + 1
  end
;;

let x_obj = new x_class;;

x_obj#incr_x ;;
x_obj#incr_x ;;
x_obj#get_x ;;
x_obj#print_x ;;

(* Abstract over initial values *)

class x_class x_init =
  object
    val mutable x = x_init
    method get_x = x
    method print_x = print_int x
    method incr_x = x <- x + 1
  end
;;

let x_obj = new x_class 3;;

x_obj#print_x ;;

(* Logic in class before/outside object - useful for invariants *)

class x_class x_init =
  let original_x = x_init in
  object
    val mutable x = original_x
    method get_x = x
    method print_x = print_int x
    method incr_x = x <- x + 1
  end
;;

let x_obj = new x_class 3;;

x_obj#print_x ;;

(* Reference to self *)

class x_class x_init =
  let original_x = x_init in
  object (self)
    val mutable x = original_x
    method get_x = x
    method print_x = print_int x
    method print_x_self = self#print_x
    method incr_x = x <- x + 1
  end
;;

let x_obj = new x_class 3;;

x_obj#get_x ;;
x_obj#print_x_self ;;

(* Initialiser *)

class x_class x_init =
  let original_x = x_init in
  object (self)
    val mutable x = original_x
    method get_x = x
    method print_x = print_int x
    method print_x_self = self#print_x
    method incr_x = x <- x + 1
    initializer self#print_x
  end
;;

let x_obj = new x_class 3;;

x_obj#get_x ;;
x_obj#print_x_self ;;

(* Inheritance, virtual methods, private methods *)

class virtual abstract_x_class x_init =
  object (self)
    method virtual get_x : int
    method virtual print_x : unit
    method virtual incr_x : unit
    initializer self#print_x
  end
;;

class x_class x_init =
  object (self)
    inherit abstract_x_class x_init
    val mutable x = x_init
    method get_x = x
    method print_x = print_int x
    method print_x_self = self#print_x
    method incr_x = x <- x + 1
  end
;;

let x_obj = new x_class 3;;

x_obj#get_x ;;
x_obj#print_x_self ;;
