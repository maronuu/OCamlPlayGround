(*Objective: Filter function for list*)
(*filter : ('a -> bool) -> 'a list -> 'a list*)
let rec filter f lst = match lst with
  [] -> []
| first :: rest ->
    if f first then first :: filter f rest
    else filter f rest

(*test*)
let is_postive x = x > 0
let test1 = filter is_postive [1; -1; -2; 1; 2; -1; 0] = [1; 1; 2]
let test2 = filter is_postive [0; 0; -1; 0] = []

let is_even x = x mod 2 = 0
let test3 = filter is_even [1; 2; 3; 4; 5; 6] = [2; 4; 6]

type student_t = {
  name : string ;
  score : int ;
  grade : string ;
}

let is_grade_A student = match student with
    {name = n; score = s; grade = g} -> g = "A"

let count_A lst = List.length (filter is_grade_A lst)
let test4 = count_A [
  {name = "sato"; score = 90; grade = "A"};
  {name = "suzuki"; score = 80 ; grade = "A"};
  {name = "takada"; score = 60; grade = "C"};
] = 2