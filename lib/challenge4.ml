(* convert from base10_to_base16 *)

let[@tail_mod_cons] rec split_digits n =
  if n = Z.zero
  then []
  else (
    let z256 = Z.of_int 256 in
    Z.to_int (Z.rem n z256) :: split_digits (Z.div n z256))
;;

let decode_base10 message =
  let bytes_arr = List.rev (split_digits message) in
  let decoded_message =
    String.concat "" (List.map (fun x -> String.make 1 (Char.chr x)) bytes_arr)
  in
  decoded_message
;;
