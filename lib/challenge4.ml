(* convert from base10_to_base16 *)
(* Need to make this take in a string vs an integer *)
let rec split_digits n = 
  if n = 0 then [] else
    let (d, rest) = n mod 256, n / 256 in
    d :: split_digits rest


let decode_base10 message =
  let bytes_arr = List.rev (split_digits message) in
  let decoded_message = String.concat "" (List.map (fun x -> String.make 1 (Char.chr x)) bytes_arr) in
  decoded_message


let base10_message = 310400273487 (* Your base-10 number here *)
let decoded_message = decode_base10 base10_message
