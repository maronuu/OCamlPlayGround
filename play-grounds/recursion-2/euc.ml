(*Objective: Euclide *)
(*gcd : int -> int -> int*)
let rec gcd m n =
  if n = 0 then m
  else gcd n (m mod n)

let test1 = gcd 3 1 = 1
let test2 = gcd 3 0 = 3
let test3 = gcd 90 45 = 45
let test4 = gcd 129 11 = 1