type 'a t = Nil | Cons of 'a * (unit -> 'a t)
val hd : 'a t -> 'a
val tl : 'a t -> 'a t
val nth : 'a t -> int -> 'a
val from_list : 'a list -> 'a t
val to_list : 'a t -> 'a list
val take : int -> 'a t -> 'a t
val drop : int -> 'a t -> 'a t
val iterate : ('a -> 'a) -> 'a -> 'a t
val repeat : 'a -> 'a t
val map : ('a -> 'b) -> 'a t -> 'b t
val filter : ('a -> bool) -> 'a t -> 'a t
val fold_left : ('a -> 'b -> 'a) -> 'a -> 'b t -> 'a
val fold_right : ('a -> 'b -> 'b) -> 'b -> 'a t -> 'b
val unfold : ('a -> ('b * 'a) option) -> 'a -> 'b t
val zip : 'a t -> 'b t -> ('a * 'b) t
val unzip : ('a * 'b) t -> 'a t * 'b t
val nats : int t
