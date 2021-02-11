(*Objective: min of lst*)
(*min : int list -> int*)
let rec min lst = match lst with
  [] -> max_int
| first :: rest -> 
    if first <= min rest then first else min rest
let test1 = min [] = max_int
let test2 = min [1; 3; 2; 1] = 1