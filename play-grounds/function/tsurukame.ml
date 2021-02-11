(*Objective: calc sum of legs from number of tsurus and kames*)
(*tsurukame_no_ashi: int -> int -> int*)

let tsurukame_no_ashi n_tsuru n_kame = n_tsuru * 2 + n_kame * 4

(*test*)
let test1 = tsurukame_no_ashi 1 2 = 10
let test2 = tsurukame_no_ashi 100 0 = 200
let test3 = tsurukame_no_ashi 0 0 = 0