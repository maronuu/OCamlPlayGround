(*Objective: return given strings attached with some number. the number incremented by the func is called*)
(*gensym : string -> string*)
let cnt = ref 0
let gensym s = 
  let now_cnt = !cnt in
  (
  cnt := !cnt + 1 ;
  s ^ string_of_int now_cnt ;
  )

let test1 = gensym "a" = "a0"
let test2 = gensym "xx" = "xx1"
let test3 = gensym "asa" = "asa2"