(*Objective: do f on elements in lst from right*)
(* fold_right : ('a -> 'b -> 'b) -> 'a list -> 'b -> 'b*)

let rec fold_right f lst init = match lst with
  [] -> init
| first :: rest -> f first (fold_right f rest init)


let add_int first rest_result = first + rest_result
let sum lst = fold_right add_int lst 0

let add_one first rest_result = 1 + rest_result
let length lst = fold_right add_one lst 0

let concat first rest_result = first :: rest_result
let append lst1 lst2 = fold_right concat lst1 lst2

let conc first rest_result = first ^ rest_result
let concat_string s1 s2 = fold_right conc s1 s2