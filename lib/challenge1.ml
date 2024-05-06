(* ASCII is a 7-bit encoding standard which allows the representation of text using the integers 0-127. *)

(* Using the below integer array; convert the numbers to their corresponding ASCII characters to obtain a flag. *)

let _ = print_endline "Convert to ascii\n"

let int_array =
  [ 99
  ; 114
  ; 121
  ; 112
  ; 116
  ; 111
  ; 123
  ; 65
  ; 83
  ; 67
  ; 73
  ; 73
  ; 95
  ; 112
  ; 114
  ; 49
  ; 110
  ; 116
  ; 52
  ; 98
  ; 108
  ; 51
  ; 125
  ]
;;

let ascii_array = List.map (fun x -> String.make 1 (Char.chr x)) int_array
let flag = String.concat "" ascii_array
let _ = print_endline flag
