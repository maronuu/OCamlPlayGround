(*Objective: Do tsuru-kame numeration*)
(*tsurukame: int -> int -> int*)

let tsurukame sum_animals sum_legs = (4*sum_animals - sum_legs) / 2;;

(*test*)
let test1 = tsurukame 2 8 = 0
let test2 = tsurukame 10 22 = 9