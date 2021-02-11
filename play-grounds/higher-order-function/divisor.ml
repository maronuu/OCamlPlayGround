(*Objective: Make integer list from 1 to n*)
(*enumerate : int -> int list*)
let rec enumerate n =
  if n = 0 then []
  else n :: enumerate (n-1)

let test1 = enumerate 5 = [5; 4; 3; 2; 1]
let test2 = enumerate 1 = [1]


(*Objective: return list of divisors of n*)
(*divisor: int -> int list*)
let divisor n = List.filter (fun x -> n mod x = 0) (enumerate n)

let test3 = divisor 24 = [24; 12; 8; 6; 4; 3; 2; 1]


(*Objective: enumerate complete numbers less than or equal to m*)
(*perfect : int -> int list*)
let perfect m =
  List.filter (fun n -> List.fold_right (+) (divisor n) 0 - n = n) (enumerate m)

let test4 = perfect 10000 = [8128; 496; 28; 6]


(*Objective: sum from one to n*)
let one_to_n n = List.fold_right (+) (enumerate n) 0

let test5 = one_to_n 1 = 1
let test6 = one_to_n 2 = 3
let test7 = one_to_n 10 = 55


let fuc n = List.fold_right ( * ) (enumerate n) 1

let test8 = fuc 0 = 1
let test9 = fuc 5 = 120