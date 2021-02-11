(*Objective: check if given two list are the same length*)
(* is_same_length: 'a list -> 'a list -> bool*)
let rec is_same_length lst1 lst2 = match (lst1, lst2) with
  ([], []) -> true
| ([], first2 :: rest2) -> false
| (first1 :: rest1, []) -> false
| (first1 :: rest1, first2 :: rest2) -> is_same_length rest1 rest2

let test1 = is_same_length [] [] = true
let test2 = is_same_length [1] [2] = true
let test3 = is_same_length [1; 2] [] = false
let test4 = is_same_length [] [1; 2] = false
let test5 = is_same_length ["A"; "B"] [2; 4] = true
let test6 = is_same_length [[1; 2] ; [2; 3]] ["ABS"; "hogfe"; "asd"] = false 