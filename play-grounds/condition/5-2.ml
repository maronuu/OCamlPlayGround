(*Objective: Return morning or afternoon*)
(*jikan: int -> string*)
let jikan x = if x < 12 then "morning" else "afternoon"

(*test*)
let test0 = jikan 1 = "morning"
let test1 = jikan 12 = "afternoon"
let test2 = jikan 11 = "morning"
let test3 = jikan 23 = "afternoon"