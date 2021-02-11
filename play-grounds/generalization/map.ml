(*Objective: map sqrt for list*)
(*map_sqrt: float list -> float list*)
let rec map_sqrt lst = match lst with
  [] -> []
| first :: rest -> sqrt first :: map_sqrt rest

let test1 = map_sqrt [1.; 4.; 9.] = [1.; 2.; 3.]
let test2 = map_sqrt [] = []

(*map : ('a -> 'b) -> 'a list -> 'b list*)
let rec map f lst = match lst with
  [] -> []
| first :: rest -> f first :: map f rest

let test3 = map sqrt [1. ; 4.; 9.;] = [1.; 2.; 3.;]