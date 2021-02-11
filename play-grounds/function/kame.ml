(*Objective: Calc number of legs of turtle from number of turtles*)
(*kame_no_ashi: int -> int*)

let kame_no_ashi n_kame = n_kame * 4

(*test*)
let test1 = kame_no_ashi 2 = 8
let test2 = kame_no_ashi 100 = 400
let test3 = kame_no_ashi 0 = 0