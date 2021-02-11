(*Quick sort*)
(*quick_sort: int list -> int list*)
let rec quick_sort lst = 
  (*Objective: extract "item p n"*)
  (*take: int -> int list -> (int -> int -> bool) -> int list *)
  let take n lst p = List.filter (fun item -> p item n) lst
  (*Objective: extract elements that are less than n from list*)
  (*take_less: int -> int list -> int list*)
  in let take_less n lst = take n lst (<=)
  (*Objective: extract elemetns that are more than n from list*)
  (*take_greater: int -> int list -> int list*)
  in let take_greater n lst = take n lst (>)
  in match lst with
  [] -> []
| first :: rest -> quick_sort (take_less first rest)
                  @ [first] 
                  @ quick_sort (take_greater first rest)


(*test*)
let test1 = quick_sort [] = []
let test2 = quick_sort [1] = [1]
let test3 = quick_sort [1; 2] = [1; 2]
let test4 = quick_sort [2; 1] = [1; 2]
let test5 = quick_sort [5; 4; 9; 8; 2; 3] = [2; 3; 4; 5; 8; 9]
let test6 = quick_sort [1; 2; 3; 34; 3; 3; 4; 3; 1; 2; 32; 12123; 12; 12] = [1; 1; 2; 2; 3; 3; 3; 3; 4; 12; 12; 32; 34; 12123]