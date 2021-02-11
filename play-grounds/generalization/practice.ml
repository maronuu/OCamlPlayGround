(*1*)
let f1 x = x
(*2*)
let f2 x y = x
(*3*)
let f3 x y = y
(*4*)
let f4 x g = g x
(*5*)
let f5 g1 g2 = let g3 x = g2 (g1 x) in g3

let compose f1 f2 = let f12 x = f1 (f2 x) in f12

let time2 x = x * 2
let add3 x = x + 3
let test1 = (compose time2 add3) 4 = 14


let twice f = let g x = f (f x) in g

let test1 = (twice twice add3) 7 = 19