(*Objective: Return symmetry point of given one on x-axis*)
(*sym_x: float*float -> float*float*)
let sym_x point = match point with
  (a, b) -> (a, -.b)

(*test*)
let test1 = sym_x (3., -1.) = (3., 1.)