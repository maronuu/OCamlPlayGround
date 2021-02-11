(*factorial n*)
(*factorial : int -> int*)
let rec factorial n = 
  if n = 0 then 1
  else n * (factorial (n-1))

let test1 = factorial 0 = 1
let test2 = factorial 1 = 1
let test3 = factorial 5 = 120

(*Objective: m ** n*)
(*power : int -> int -> int*)

let rec pow m n = 
  if n = 0 then 1
  else m * (pow m (n-1))

(*test*)
let test4 = pow 3 0 = 1
let test5 = pow 3 1 = 3
let test6 = pow 3 2 = 9
let test7 = pow 3 3 = 27


(*Objective: square sum of 0 ~ n*)
(*sum_of_square: int -> int*)
let rec sum_of_square n =
  if n = 0 then 0
  else n * n + sum_of_square (n-1)

let test8 = sum_of_square 0 = 0
let test9 = sum_of_square 1 = 1
let test10 = sum_of_square 4 = 30


(*Objective: calc general expression of linear-recursive-structure*)
(*a: int -> int*)
let rec a n =
  if n = 0 then 3
  else 2 * a (n-1) - 1

let test11 = a 0 = 3
let test12 = a 1 = 5
let test13 = a 2 = 9