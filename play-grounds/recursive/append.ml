(*Objective: Concatnate lst1 & lst2*)
(*append: 'a list -> 'a list -> 'a list*)
let rec append lst1 lst2 = match lst1 with
  [] -> lst2
| first :: rest -> first :: append rest lst2

let test1 = append [] [] = []
let test2 = append [1] [2] = [1; 2]
let test3 = append [1; 2; 3] [4; 5] = [1; 2; 3; 4; 5]
let test4 = append [] [1; 2] = [1; 2]
let test5 = append [1; 2] [] = [1; 2]