(*Objective: sum of lst*)
(*sum : int list -> int*)
let sum lst =
  List.fold_right (fun first rest_result -> first + rest_result) lst 0

let length lst =
  List.fold_right (fun first rest_result -> 1 + rest_result) lst 0

let append lst1 lst2 =
  List.fold_right (fun first rest_result -> first :: rest_result) lst1 lst2