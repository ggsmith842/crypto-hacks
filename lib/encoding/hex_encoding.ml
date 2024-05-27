let decode_hex_string hex_string =
  let byte_string = Hex.to_cstruct (`Hex hex_string) in
  let decoded_string = Cstruct.to_string byte_string in
  decoded_string
;;

let encode_to_hex message =
  let byte_string = Cstruct.of_string message in
  let hex_string = Hex.of_cstruct byte_string in
  Hex.show hex_string
;;

(* Example *)
let secret_message = "48656c6c6f2c20576f726c6421"
let decrypted_message = decode_hex_string secret_message;;

(* Show the decrypted message *)
print_endline decrypted_message

(* Encrypt the message back to hexidecimal *)
let encoded_message = encode_to_hex decrypted_message;;

(* Show the hexidecimal encoded message *)
print_endline encoded_message
