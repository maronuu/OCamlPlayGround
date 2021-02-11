open Heap

(*Objective: heap-sort*)
(*heap_sort : int list -> int list*)
let heap_sort lst =
  let rec extract_all_elements heap lst =
    try
      let ((a, ()), heap) = split_top heap
    in extract_all_elements heap (a::lst)
  with Empty -> lst
in match lst with
  [] -> []
| first :: rest ->
    let size = List.length lst in
    let heap = List.fold_left
                (fun heap x ->
                  let (_, heap) = insert heap x () in heap)
                    (create size first ()) lst in
    extract_all_elements heap []


let test1 = heap_sort [] = []
let test2 = heap_sort [1] = [1]
let test3 = heap_sort [1; 2] = [2; 1]
let test4 = heap_sort [2; 1] = [2; 1]
let test5 = heap_sort [5; 3; 8; 1; 7; 4] = [8; 7; 5; 4; 3; 1]