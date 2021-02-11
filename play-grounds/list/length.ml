(*Objective: Calc length of given list*)
(*length: 'a list -> int*)
let rec length lst = match lst with
  [] -> 0
| first :: rest -> 1 + length rest

(*test*)
let test1 = length [] = 0
let test2 = length [1] = 1
let test3 = length [1; 2; 3; 4] = 4
let test4 = length ["spring"; "summer"; "autumn"; "winter"] = 4