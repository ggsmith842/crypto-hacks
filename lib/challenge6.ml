(* demonstrate xor properties *)

(*
   Commutative: A ⊕ B = B ⊕ A
   Associative: A ⊕ (B ⊕ C) = (A ⊕ B) ⊕ C
   Identity: A ⊕ 0 = A
   Self-Inverse: A ⊕ A = 0
*)

(* Convert Hex string to integer array *)
(* Using Zarith (issues with the size of the integer were causing other functions to fail) *)
let int_flag =
  let key1 = Z.of_string_base 16 "a6c8b6733c9b22de7bc0253266a3867df55acde8635e19c73313" in
  let k23 = Z.of_string_base 16 "c1545756687e7573db23aa1c3452a098b71a7fbf0fddddde5fc1" in
  let flag132 =
    Z.of_string_base 16 "04ee9855208a2cd59091d04767ae47963170d1660df7f56f5faf"
  in
  let xor_flag_23 = Z.logxor flag132 k23 in
  let flag = Z.logxor xor_flag_23 key1 in
  flag (*base 10 representation - have to convert to ascii*)
;;

let rec convert_to_ascii n acc =
  if Z.equal n Z.zero
  then acc
  else (
    let digit = Char.chr (Z.to_int (Z.rem n (Z.of_int 256))) in
    let acii_char = String.make 1 digit in
    convert_to_ascii (Z.div n (Z.of_int 256)) (acii_char ^ acc))
;;

(* let flag = convert_to_ascii int_flag "";;
   print_endline flag *)
