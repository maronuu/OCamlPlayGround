exception Urikire

(*Objective: item price*)
(*Raise: Urikire when item is not found*)
let rec price item yaoya_list = match yaoya_list with
  [] -> raise Urikire
| (yasai, nedan) :: rest ->
    if item = yasai then nedan
    else price item rest

(*Objective: total price of items*)
(*total_price : string_list -> (string * int) list -> int*)
let total_price yasai_list yaoya_list =
  (*hojo: string list -> int*)
  let rec hojo yasai_list = match yasai_list with
    [] -> 0
  | first :: rest ->
      price first yaoya_list + hojo rest
  in try
        hojo yasai_list
  with Urikire -> 0