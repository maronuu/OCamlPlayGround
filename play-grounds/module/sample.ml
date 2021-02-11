(*Module that represent axes*)
module Zahyou = struct
  let x = 3.0
  let y = 4.0
  (*Objective: calc distance from (a,b) to (x,y)*)
  (*kyori: float * float -> float*)
  let kyori (a, b) =
    sqrt ((x -. a) ** 2. +. (y -. b) ** 2.)
end

