let () = print_endline "Hello, World!"

(* Challenge 2 *)
let () =
  let hex_string = "63727970746f7b596f755f77696c6c5f62655f776f726b696e675f776974685f6865785f737472696e67735f615f6c6f747d" in
  let decoded_string = Cryptohacks.Challenge2.decode_hex_string hex_string in
  print_endline decoded_string

(* Challenge 3 *)
(* let () =
  let hex_string = "63727970746f7b596f755f77696c6c5f62655f776f726b696e675f776974685f6865785f737472696e67735f615f6c6f747d" in
  let b64_string = Cryptohacks.Challenge3.hex_to_b64 hex_string in
  print_endline b64_string *)


