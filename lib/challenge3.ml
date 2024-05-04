(* use decode_hex_string *)

let hex_to_b64 hex_string=
  let byte_string = Challenge2.decode_hex_string hex_string in
  let decoded_hex = Base64.decode_exn byte_string in
  print_endline decoded_hex

let() = 
  let hex_string = "72bca9b68fc16ac7beeb8f849dca1d8a783e8acf9679bf9269f7bf" in
  hex_to_b64 hex_string