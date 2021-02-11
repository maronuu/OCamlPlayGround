(*Objective: approximation of e*)
(*e: int -> float*)
let rec a_n n =
  if n = 0 then 1.0
  else a_n (n-1) /. float_of_int n
let rec e n =
  let a = a_n n in
  if a < 0.00001 then a
  else a +. e (n+1)