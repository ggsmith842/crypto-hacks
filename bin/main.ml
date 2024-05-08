(* Int to ASCII *)

(* Hex *)
let () = print_endline "\nChallenge 2: Decode hex to bytes:"

let () =
  let hex_string =
    "63727970746f7b596f755f77696c6c5f62655f776f726b696e675f776974685f6865785f737472696e67735f615f6c6f747d"
  in
  let decoded_string = Cryptohacks.Challenge2.decode_hex_string hex_string in
  print_endline decoded_string
;;

(* Base64 *)
let () = print_endline "\nChallenge 3: Decode hex to bytes then encode to Base64:"

let () =
  let hex_string = "72bca9b68fc16ac7beeb8f849dca1d8a783e8acf9679bf9269f7bf" in
  let b64_string = Cryptohacks.Challenge3.hex_to_b64 hex_string in
  print_endline b64_string
;;

(* Bytes and Big Integers *)

print_endline "\nChallenge 4: Bytes and Big Integers Challenge"

let () =
  let long_integer =
    Z.of_string
      "11515195063862318899931685488813747395775516287289682636499965282714637259206269"
  in
  (* let long_integer = 310400273487 in *)
  let result = Cryptohacks.Challenge4.decode_base10 long_integer in
  print_endline result
  let long_integer =
    Z.of_string
      "11515195063862318899931685488813747395775516287289682636499965282714637259206269"
  in
  (* let long_integer = 310400273487 in *)
  let result = Cryptohacks.Challenge4.decode_base10 long_integer in
  print_endline result
;;

(* xor intro *)
print_endline "\nChallenge 5: Xor Intro"

let () =
  let message = "label" in
  let result = Cryptohacks.Challenge5.xor_string_with_13 message in
  print_endline result
;;

(* xor properties *)
print_endline "\nChallenge 6: Xor Properties"

let () = 
 let decoded_flag =  Cryptohacks.Challenge6.int_flag in
let flag =  Cryptohacks.Challenge6.convert_to_ascii decoded_flag "" in
print_endline flag 

;;

