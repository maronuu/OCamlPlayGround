(*Objective: Calc sum and average of scores of five subjects*)
(*sum_and_avg: float -> float -> float -> float -> float -> (float, float)*)

let sum_and_avg a b c d e = (a+.b+.c+.d+.e, (a+.b+.c+.d+.e)/. 5.)

(*test*)
let test1 = sum_and_avg 10. 10. 20. 20. 10. = (70. , 18.)
