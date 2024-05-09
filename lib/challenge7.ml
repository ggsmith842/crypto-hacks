(*Helper function for range*)

let range i = List.init i succ
let key_str = "73626960647f6b206821204f21254f7d694f7624662065622127234f726927756d"

let get_decoded_strings key =
  let byte_key = Challenge2.decode_hex_string key in
  let ascii_codes =
    Array.init (String.length byte_key) (fun i -> Char.code byte_key.[i])
  in
  let single_byte_list = range 64 in
  let xored_arrays =
    Array.map
      (fun i -> Array.map (fun x -> x lxor i) ascii_codes)
      (Array.of_list single_byte_list)
  in
  (* xored_array in *)
  let char_arrays =
    Array.map (fun i -> Array.map (fun x -> String.make 1 (char_of_int x)) i) xored_arrays
  in
  (* char_arrays *)
  let string_array =
    Array.map (fun x -> String.concat "" (Array.to_list x)) char_arrays
  in
  string_array
;;

(* pattern match to find flag *)
let flag_pattern = Str.regexp "crypto.*"

(* Example using for loop *)
(* let flag_find (str_arr : string array) =
   let flag_match = ref ~-1 in
   try
   for i = 0 to Array.length str_arr - 1 do
   if Str.string_match (Str.regexp "crypto.*") str_arr.(i) 0
   then (
   flag_match := i;
   raise Exit)
   done;
   if !flag_match = ~-1 then raise Not_found;
   !flag_match
   with
   | Exit -> !flag_match
   ;; *)

let find_flag_pattern (str_arr : string array) =
  try
    Array.find_index (fun str -> Str.string_match (Str.regexp "crypto.*") str 0) str_arr
  with
  | Not_found -> raise (Failure "Flag not found")
;;

let xor_single_byte_decryption key =
  let decoded_strings = get_decoded_strings key in
  let flag_idx = find_flag_pattern decoded_strings in
  let flag = decoded_strings.(Option.get flag_idx) in
  print_endline flag

