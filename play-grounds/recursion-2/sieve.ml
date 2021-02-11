(*Objective: enumerate all prime numbers list less than or equal to n*)
(*prime: int -> int list*)
let prime n =
  (*Objective: enumerate 2 ~ n numbers*)
  (*enumerate: int -> int list*)
  let rec enumerate n =
    if n <= 1 then []
    else enumerate (n-1) @ [n] in

  (*Objective: enumerate all prime numbers less than or equal to n*)
  (*sieve: int list -> int list*)
  let rec sieve lst = match lst with
    [] -> []
  | first :: rest -> first :: sieve (List.filter (fun x -> x mod first != 0) rest) in

  sieve (enumerate n)

let test1 = prime 1 = []
let test2 = prime 2 = [2]
let test3 = prime 7 = [2; 3; 5; 7]
let test4 = prime 11 = [2; 3; 5; 7; 11]
let test5 = prime 19 = [2; 3; 5; 7; 11; 13; 17; 19]