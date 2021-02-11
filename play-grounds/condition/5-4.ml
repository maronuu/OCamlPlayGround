(*Objective decisive expression for two dim equation*)
(*hanbetsu float -> float -> float -> float*)
let hanbetsu a b c = b**2. -. 4. *. a *. c
(*Objective: Calcurate the number of roots of 2-dim equation based on decisive expression*)
(*n_root float-> float -> float -> int*)
let n_root a b c = 
  if hanbetsu a b c > 0. then 2
  else if hanbetsu a b c = 0. then 1
  else 0
(*Objective: Check whether the given 2-dim equation has imaginary root(s)*)
(*is_imaginary: float -> float -> float -> bool*)
let is_imaginary a b c = 
  hanbetsu a b c < 0.

(*test*)
let test0 = hanbetsu 1. 2. 1. = 0.
let test1 = hanbetsu 1. 3. 1. = 5.
let test2 = hanbetsu 100. 200. 100. = 0.
let test3 = hanbetsu 1. 1. 9. = -35.
let test4 = n_root 1. 2. 1. = 1
let test5 = n_root 1. 1. 9. = 0
let test6 = n_root 1. 3. 1. = 2

let test7 = is_imaginary 1. 3. 1. = false
let test8 = is_imaginary 1. 1. 9. = true