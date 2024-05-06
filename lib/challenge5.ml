let xor_string_with_13 str =
  let xor_char c = Char.chr (Char.code c lxor 13) in
  String.map xor_char str 