(*Return a list that includes only even number in a given list*)
(*even: int list -> int list*)
let rec even lst = match lst with
  [] -> []
| first :: rest -> if first mod 2 = 0 then first :: even rest
                   else even rest

(*Test*)
let test1 = even [] = []
let test2 = even [1; 2] = [2]
let test3 = even [1; 3; 5] = []
let test4 = even [2; 4; 6; 8; 10; 10000] = [2; 4; 6; 8; 10; 10000]