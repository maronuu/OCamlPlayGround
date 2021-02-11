type color_t = Red | Black

type ('a, 'b) rb_tree_t = Empty
              |  Node of ('a, 'b) rb_tree_t * 'a * 'b * color_t * ('a, 'b) rb_tree_t

(*Objective: make rb-tree balanced. check if the tree are specific 4 patterns, transform it*)
(* balance : ('a, 'b) rb_tree_t -> ('a, 'b) rb_tree_t*)
let balance tree = match tree with
  Node (Node (Node (a, k_x, v_x, Red, b), k_y, v_y, Red, c), k_z, v_z, Black, d) |
  Node (Node (a, k_x, v_x, Red, Node (b, k_y, v_y, Red, c)), k_z, v_z, Black, d) |
  Node (a, k_x, v_x, Black, Node (Node (b, k_y, v_y, Red, c), k_z, v_z, Red, d)) |
  Node (a, k_x, v_x, Black, Node (b, k_y, v_y, Red, Node (c, k_z, v_z, Red, d))) ->
    Node (Node (a, k_x, v_x, Black, b), k_y, v_y, Red, Node (c, k_z, v_z, Black, d))
| t -> t

(*Objective: insert*)
(*insert: ('a, 'b) rb_tree_t -> 'a -> 'b -> ('a, 'b) rb_tree_t*)
let insert tree key value =
  let rec insert_inside_func tree key value = match tree with
      Empty -> Node (Empty, key, value, Red, Empty)

    | Node (left, key_0, value_0, Black, right) ->
        if key = key_0 then balance (Node (left, key, value, Black, right))
        else if key < key_0 then balance (Node (insert_inside_func left key value, key_0, value_0, Black, right))
        else balance (Node (left, key_0, value_0, Black, insert_inside_func right key value))

    | Node (left, key_0, value_0, Red, right) ->
        if key = key_0 then Node (left, key, value, Red, right)
        else if key < key_0 then Node (insert_inside_func left key value, key_0, value_0, Red, right)
        else Node (left, key_0, value_0, Red, insert_inside_func right key value)
  in let res_tree = insert_inside_func tree key value
  in match res_tree with
    Empty -> assert false
  | Node (left, key_1, value_1, color_1, right) -> Node (left, key_1, value_1, Black, right)

(*search : ('a, 'b) rb_tree_t -> 'a -> 'b*)
let rec search tree key = match tree with
  Empty -> raise Not_found
| Node (left, key_0, value_0, color_0, right) ->
    if key = key_0 then value_0
    else if key < key_0 then search left key
    else search right key