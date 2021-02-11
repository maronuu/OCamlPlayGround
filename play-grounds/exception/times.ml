(*times: int list -> int*)
exception Zero

let times lst =
  let rec hojo lst = match lst with
    [] -> 1
  | first :: rest -> 
    if first = 0 then raise Zero
    else first * hojo rest in
    try hojo lst with
      Zero -> 0