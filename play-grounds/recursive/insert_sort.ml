(*Objective: insert n in lst*)
(*insert : lst -> n -> lst*)
let rec insert lst n = match lst with
  [] -> [n]
| first :: rest -> if first < n then first :: insert rest n
                                else n :: first :: rest

(*Objective: insert_sort*)
(* insert_sort : int list -> int list*)
let rec insert_sort lst = match lst with
  [] -> []
| first :: rest -> insert (insert_sort rest) first
(*
[5; 1; 3; 76; 4; 2] = 5 :: [1; 3; 76; 4; 2]
*)

(*Test*)
let test1 = insert_sort [] = []
let test2 = insert_sort [3; 1] = [1; 3]
let test3 = insert_sort [5; 1; 3; 76; 4; 2] = [1; 2; 3; 4; 5; 76]
let test4 = insert_sort [-100; -200; -300; 100] = [-300; -200; -100; 100]