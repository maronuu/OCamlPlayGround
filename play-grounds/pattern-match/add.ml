(*Objective: calc sum of pair int*)
(*add: int * int -> int*)
let add pair = match pair with
  (a, b) -> a + b

(*test*)
let test1 = add (0, 0) = 0
let test2 = add (3, 5) = 8
let test3 = add (5, -3) = 2

type student_t = {name : string ; score : int ; grade : string}
let evaluate student = match student with
  {name = n; score = s; grade = g} ->
    {name = n;
    score = s;
    grade = if s >= 80 then "A"
    else if s >= 70 then "B"
    else if s >= 60 then "C"
    else "D"}