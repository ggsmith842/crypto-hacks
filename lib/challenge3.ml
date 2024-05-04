(* Take the below hex string, decode it into bytes and then encode it into Base64. *)

let hex_to_b64 hex_string=
  let byte_string = Challenge2.decode_hex_string hex_string in
  let decoded_hex = Base64.encode_string byte_string in
  decoded_hex