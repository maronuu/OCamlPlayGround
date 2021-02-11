(*Objective: calc comfortability from current temperature*)
(*kion int -> string*)
let comf t = 
  t >= 15 && t <= 25
let kion t = 
  if comf t then "good"
  else "normal"

let test1 = kion 7 = "normal"
let test2 = kion 15 = "good"
let test3 = kion 25 = "good"
let test4 = kion 30 = "normal"