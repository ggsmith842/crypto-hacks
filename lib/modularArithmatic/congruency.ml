(* For a = x (mod m), given a and m find the value of x*)
let find_cong_int a m =
  let int_val = a / m in
  (* 11 / 6 *)
  let r = a - (m * int_val) in
  (* 11 - 6 * 1 *)
  r
;;

(* helper power function for integer *)
let rec pow ((x : int), (y : int)) : int = if y = 0 then 1 else x * pow (x, y - 1)

let fermat_lil_thm a p =
  let remainder = a - (a / p * p) in
  let answer = pow (remainder, p - 1) mod p in
  answer
;;

(* only if m is a prime number *)
let mod_inv a m = pow (a, m - 2) mod m

(* https://www.rieselprime.de/ziki/Modular_square_root *)

(* Find the quadratic residual *)
let ints = [ 11; 6; 15 ]
let p = 29
let check_qr p x = pow (x, (p - 1) / 2) mod p
let valid_ints = List.filter (fun x -> check_qr p x = 1) ints
let v x = pow (2 * x, (p - 5) / 8) mod p
let i x v = 2 * x * pow (v, 2) mod p
let r x v i = x * v * (i - 1) mod p
