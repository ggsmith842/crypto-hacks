

let key = Challenge2.decode_hex_string 
"0e0b213f26041e480b26217f27342e175d0e070a3c5b103e2526217f27342e175d0e077e263451150104";;

let ascii_codes = Array.init (String.length key) (fun i -> Char.code key.[i])

let flag_pattern = "crypto{";;

let flag_pattern_int = Array.init (String.length flag_pattern) (fun i -> Char.code flag_pattern.[i])
;;

let () = for i = 0 to (Array.length flag_pattern_int) - 1  do print_char (Char.chr (ascii_codes.(i) lxor flag_pattern_int.(i)) ) done ;;

let result = Array.mapi (fun i x ->
  Char.chr (ascii_codes.(i) lxor x)
) flag_pattern_int