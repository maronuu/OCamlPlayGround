(*Objective: merge two sorted list lst1, lst2*)
(* merge: int list -> int list -> int list*)
let rec merge lst1 lst2 = match (lst1, lst2) with
  ([], []) -> []
| ([], first2 :: rest2) -> lst2
| (first1 :: rest1, []) -> lst1
| (first1 :: rest1, first2 :: rest2) ->
    if first1 < first2 then first1 :: merge rest1 lst2
    else first2 :: merge lst1 rest2


let test1 = merge [] [] = []
let test2 = merge [] [1] = [1]
let test3 = merge [1] [] = [1]
let test4 = merge [1; 2] [] = [1; 2]
let test5 = merge [] [1; 2] = [1; 2]
let test6 = merge [1; 2] [3; 4] = [1; 2; 3; 4]
let test7 = merge [1; 3; 5] [2; 4; 6] = [1; 2; 3; 4; 5; 6]