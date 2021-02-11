(*Objective: Calc number of legs from number of tsuru*)
(*tsuru_no_ashi: int -> int*)
let tsuru_no_ashi n_tsuru = n_tsuru * 2

(*test*)
let test1 = tsuru_no_ashi 2 = 4
let test2 = tsuru_no_ashi 10 = 20
let test3 = tsuru_no_ashi 0 = 0