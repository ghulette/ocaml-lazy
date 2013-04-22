type 'a t = 
  | Nil 
  | Cons of 'a * (unit -> 'a t)

let hd = function
  | Nil -> failwith "hd"
  | Cons (x,_) -> x

let tl = function
  | Nil -> failwith "tl"
  | Cons (_,f) -> f ()

let rec nth s = function
  | 0 -> hd s
  | n -> nth (tl s) (n-1)

let from_list l = 
  List.fold_right (fun x s -> Cons (x,fun () -> s)) l Nil

let rec to_list = function
  | Nil -> []
  | Cons (x,xs) -> x :: to_list (xs ())

let rec take n s = 
  match (n,s) with
  | (0,_) -> Nil
  | (_,Nil) -> Nil
  | (_,_) -> Cons (hd s, fun () -> take (n-1) (tl s))

let rec drop n s = 
  if n <= 0 then s else drop (n-1) (tl s)

let rec iterate f x =
  Cons (x, fun () -> iterate f (f x))

let repeat x = iterate (fun _ -> x) x

let rec map f = function
  | Nil -> Nil
  | Cons (x,xs) -> Cons (f x, fun () -> map f (xs ()))

let rec filter p = function
  | Nil -> Nil
  | Cons (x,xs) -> 
    if p x then Cons (x, fun () -> filter p (xs ()))
           else filter p (xs ())

let rec fold_left f x = function
  | Nil -> x
  | Cons (y,ys) -> f (fold_left f x (ys ())) y

let rec fold_right f y = function
  | Nil -> y
  | Cons (x,xs) -> fold_right f (f x y) (xs ())

let rec unfold f y =
  match f y with
  | None -> Nil
  | Some (x,y') -> Cons (x,fun () -> unfold f y')

let rec zip l1 l2 =
  match (l1,l2) with
  | (Nil,_) -> Nil
  | (_,Nil) -> Nil
  | (Cons (x,xs),Cons (y,ys)) -> Cons ((x,y),fun () -> zip (xs ()) (ys ()))

let rec unzip = function
  | Nil -> (Nil,Nil)
  | Cons ((x,y),xys) -> 
    let (xs,ys) = unzip (xys ()) in 
    (Cons (x,fun () -> xs),Cons (y,fun () -> ys))

let nats = iterate succ 0
