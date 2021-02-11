type tree_t = Empty (*empty*)
            | Leaf of int (*or leaf that has value n*)
            | Node of tree_t * int * tree_t (*or node that has left tree t1, value n, and right tree t2*)

let tree1 = Empty
let tree2 = Leaf (3)
let tree3 = Node (Leaf (1), 2, Leaf (3))
let tree4 = Node (Empty, 7, Leaf (9))
let tree5 = Node (tree3, 6, tree4)



(*Objective: Given binary search tree and target, check if tree has target data*)
(*search: tree_t -> int -> bool*)
let rec search tree data = match tree with
  Empty -> false
| Leaf (n) -> data = n
| Node (t1, n, t2) -> if data = n then true
                      else if data < n then search t1 data
                      else search t2 data

let test1 = search tree1 3 = false
let test2 = search tree2 3 = true
let test3 = search tree2 4 = false
let test4 = search tree5 6 = true
let test5 = search tree5 2 = true
let test6 = search tree5 1 = true
let test7 = search tree5 4 = false


(*Objective: insert data to binary indexed tree*)
(*insert_tree: tree_t -> int -> tree_t*)
let rec insert_tree tree data = match tree with
  Empty -> Leaf (data)
| Leaf (n) ->
      if data = n then Leaf (data)
      else if data < n then Node (Leaf (data), n, Empty)
      else Node (Empty, n, Leaf (data))
| Node (t1, n, t2) -> 
      if data = n then Node (t1, n, t2)
      else if data < n then Node (insert_tree t1 data, n, t2)
      else Node (t1, n, insert_tree t2 data)

let test8 = insert_tree Empty 3 = Leaf (3)
let test9 = insert_tree (Leaf (3)) 2 = Node (Leaf (2), 3, Empty)
let test10 = insert_tree (Leaf (3)) 3 = Leaf (3)
let test11 = insert_tree (Leaf (3)) 4 = Node (Empty, 3, Leaf (4))
let test12 = insert_tree tree5 4 =
                          Node (Node (Leaf (1), 2, Node (Empty, 3, Leaf (4))), 6, Node (Empty, 7, Leaf (9)))


type 'a tree_t = Empty 
               | Leaf of 'a
               | Node of 'a tree_t * 'a * 'a tree_t