let key =
  Challenge2.decode_hex_string
    "0e0b213f26041e480b26217f27342e175d0e070a3c5b103e2526217f27342e175d0e077e263451150104"
;;

(* convert decoded string to ascii codes *)
let ascii_codes = Array.init (String.length key) (fun i -> Char.code key.[i])

(* set flag pattern and decode *)
let flag_pattern_int =
  let flag_str = "crypto{" in
  Array.init (String.length flag_str) (fun i -> Char.code flag_str.[i])
;;

(* outputs the result myXORke; we can deduce the missing char is 'y' and add the integer value of 'y' to make the secret key *)
let pattern_xor_result =
  Array.mapi (fun i x -> Char.chr (ascii_codes.(i) lxor x)) flag_pattern_int
;;

(* get ascii codes for secret key *)
let secret_key =
  let xored_key = Array.append pattern_xor_result [| 'y' |] in
  Array.map (fun x -> Char.code x) xored_key
;;

(* xor the secret key with the secret message to get the flag *)
let flag =
  let char_flag =
    Array.mapi
      (fun i _ ->
        Char.chr (ascii_codes.(i) lxor secret_key.(i mod Array.length secret_key)))
      ascii_codes
  in
  let string_flag = Array.map (fun x -> String.make 1 x) char_flag in
  String.concat "" (Array.to_list string_flag)
;;


(* combine code into function *)
let get_secret_message key =
  let key = Challenge2.decode_hex_string key in
  let ascii_codes = Array.init (String.length key) (fun i -> Char.code key.[i]) in
  let flag_pattern_int =
    let flag_str = "crypto{" in
    Array.init (String.length flag_str) (fun i -> Char.code flag_str.[i])
  in
  let pattern_xor_result =
    Array.mapi (fun i x -> Char.chr (ascii_codes.(i) lxor x)) flag_pattern_int
  in
  let secret_key =
    let xored_key = Array.append pattern_xor_result [| 'y' |] in
    Array.map (fun x -> Char.code x) xored_key
  in
  let flag =
    let char_flag =
      Array.mapi
        (fun i _ ->
          Char.chr (ascii_codes.(i) lxor secret_key.(i mod Array.length secret_key)))
        ascii_codes
    in
    let string_flag = Array.map (fun x -> String.make 1 x) char_flag in
    (* Array.map (fun x -> String.concat "" (Array.to_list x )) *)
    String.concat "" (Array.to_list string_flag)
  in
  flag
;;
