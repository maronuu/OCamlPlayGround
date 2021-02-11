type tree_t = Empty (*empty*)
            | Leaf of int (*or leaf that has value n*)
            | Node of tree_t * int * tree_t (*or node that has left tree t1, value n, and right tree t2*)

(*ex*)
let tree1 = Empty
let tree2 = Leaf (3)
let tree3 = Node (tree1, 4, tree2)
let tree4 = Node (tree2, 5, tree3)

(*Objective: sum_tree*)
(*sum_tree: tree_t -> int*)
let rec sum_tree tree = match tree with
  Empty -> 0
| Leaf (n) -> n
| Node (t1, n, t2) -> sum_tree t1 + n + sum_tree t2
let test1 = sum_tree tree1 = 0
let test2 = sum_tree tree2 = 3
let test3 = sum_tree tree3 = 7
let test4 = sum_tree tree4 = 15


(*Objective: double all value in tree*)
(*tree_double: tree_t -> tree_t*)
let rec tree_double tree = match tree with
  Empty -> Empty
| Leaf (n) -> Leaf (2*n)
| Node (t1, n, t2) -> Node (tree_double t1, 2*n, tree_double t2)

let test5 = tree_double tree1 = tree1
let test6 = tree_double tree3 = Node (Empty, 8, Leaf (6))


(*Objective: map f for tree*)
(*tree_map: (int -> int) -> tree_t -> tree_t*)
let rec tree_map f tree = match tree with
  Empty -> Empty
| Leaf (n) -> Leaf (f n)
| Node (t1, n, t2) -> Node (tree_map f t1, f n, tree_map f t2)

let test7 = tree_map (fun x -> 1) tree3 = Node (Empty, 1, Leaf (1))


(*Objective: tree_length, length := node + leaf*)
(*tree_length : tree_t -> int*)
let rec tree_length tree = match tree with
  Empty -> 0
| Leaf (n) -> 1
| Node (t1, n, t2) -> tree_length t1 + 1 + tree_length t2

let test8 = tree_length tree4 = 4

(*Objective: tree_depth*)
(*tree_depth: tree_t -> int*)
let tree_depth tree =
  (*depth = the depth of just done node. init = 0*)
  let rec search tree depth = match tree with
    Empty -> depth
  | Leaf (n) -> depth
  | Node (t1, n, t2) -> max (search t1 (depth+1)) (search t2 (depth+1)) in
  search tree 0

let test9 = tree_depth tree1 = 0
let test10 = tree_depth tree4 = 2 





