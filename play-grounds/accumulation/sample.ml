type distance_t = {
  kyori : float;
  total : float;
}


(*Objective: calc total distance from first to each point*)
(*total_distance: distance_t list -> distance_t list*)
let total_distance lst =
  
  let rec hojo lst total0 = match lst with
  (*total0 = cummulative sum of distance*)
  [] -> []
  | {kyori = k; total = t} :: rest ->
    {kyori = k; total = total0 +. k} :: hojo rest (total0 +. k)
  
  in hojo lst 0.0


let sum_list lst =
  let rec f lst cum = match lst with
    [] -> []
  | first :: rest -> (first + cum) :: f rest (cum + first)
in f lst 0

let test1 = sum_list [3; 2; 1; 4] = [3; 5; 6; 10]


(*Objective: reverse list*)
(*reverse : 'a list -> 'a list*)
let reverse lst =
  (*Objective: (reversed lst) @ result*)
  (*result: current reversed list*)
  let rec rev lst result = match lst with
    [] -> result
  | first :: rest -> rev rest (first :: result)
in rev lst []


(*Fold Left*)
(*fold_left : ('b -> 'a -> 'b) -> 'b -> 'a list -> b*)
let rec fold_left f init lst = match lst with
  [] -> init
| first :: rest -> fold_left f (f init first) rest

let test1 = fold_left (+) 0 [1; 2; 3]= List.fold_left (+) 0 [1; 2; 3]