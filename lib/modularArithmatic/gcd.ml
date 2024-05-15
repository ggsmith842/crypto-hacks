(* Recusive implementation of Euclidean algorithm *)
(* Used to find the greatest common denominator *)

let rec gcd a b = if a == 0 then b else gcd (b mod a) a

(*
   Extended Euclidean algorithm used to find
   integer coef. x and y s.t. ax + by = gcd(a,b)
*)

let rec gcd_ext a b =
  if a = 0
  then b, 0, 1
  else (
    let g, x1, y1 = gcd_ext (b mod a) a in
    let x = y1 - (b / a) * x1 in
    let y = x1 in
    g, x, y)
;;
