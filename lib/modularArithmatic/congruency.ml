

(* For a = x (mod m), given a and m find the value of x*)
let find_cong_int a m = 
  let int_val = a / m in  (* 11 / 6 *)
  let r = a - (m * int_val) in (* 11 - 6 * 1 *)
  r
;;

(* helper power function for integer *)
let rec pow ((x:int), (y:int)):int  = 
  if y = 0 then 1
  else x * pow(x, y-1)

;;

let fermat_lil_thm a p =  
  let remainder = a - ((a / p) * p) in
  let answer = pow(remainder,(p-1)) mod p
in answer
;;

(* only if m is a prime number *)
let mod_inv a m = 
  pow(a, m -2) mod m;;

