(*Objective: Concat all elements in list*)
(*concat: string list -> string*)
let rec concat lst = match lst with
  [] -> ""
| first :: rest -> first ^ (concat rest)

(*test*)
let test1 = concat [] = ""
let test2 = concat ["a"] = "a"
let test3 = concat ["a" ; "b"] = "ab"
let test4 = concat ["a" ; "b" ; "c"; "d"; "1"; "2"; "3"; "######"; "池袋"] = "abcd123######池袋"