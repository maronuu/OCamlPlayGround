(*Objective: calc absolute value of input*)
(*abs_value: float -> float*)

let abs_value x = if x >= 0. then x else -.x ;;

(*test*)
let test1 = abs_value 2.88 = 2.88
let test2 = abs_value 0. = 0.
let test3 = abs_value (-1.1) = 1.1