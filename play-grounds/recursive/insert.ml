(*Objective: insert n in lst*)
(*insert : lst -> n -> lst*)
let rec insert lst n = match lst with
  [] -> [n]
| first :: rest -> if first < n then first :: insert rest n
                                else n :: first :: rest

(*test*)
let test1 = insert [] 1 = [1]
let test2 = insert [1; 2; 3] 2 = [1; 2; 2; 3]
let test3 = insert [1; 100; 200] 300 = [1; 100; 200; 300]
let test4 = insert [1; 2; 4; 6; 20] 5 = [1; 2; 4; 5; 6; 20]