(*Salary per hour*)
let jikyu = 950 ;;

(*Base income*)
let kihonkyu = 100 ;;

(*Objective: Calcrate part-time salary based on working time x*)
(*kyuyo : int -> int*)
let kyuyo x = x * jikyu + kihonkyu

(*test*)
let test1 = kyuyo 25 = 23850
let test2 = kyuyo 28 = 26700
let test3 = kyuyo 31 = 29550