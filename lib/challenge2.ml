(* Decode the below hex string back into bytes *)
(* let decode_hex_string () =

   let hex_string = "63727970746f7b596f755f77696c6c5f62655f776f726b696e675f776974685f6865785f737472696e67735f615f6c6f747d" in

   let byte_string = Hex.to_cstruct (`Hex hex_string) in

   let decoded_string = Cstruct.to_string byte_string in

   print_endline decoded_string *)

let decode_hex_string hex_string =
  let byte_string = Hex.to_cstruct (`Hex hex_string) in
  let decoded_string = Cstruct.to_string byte_string in
  decoded_string
;;
