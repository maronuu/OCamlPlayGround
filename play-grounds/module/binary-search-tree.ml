(*module: binary search tree*)
module Tree = struct
  (*type of binary search tree*)
  type ('a, 'b) t = Empty
                  | Node of ('a, 'b) t * 'a * 'b * ('a, 'b) t
  
  (*Empty tree*)
  let empty = Empty

  (*Objective: return tree inserted (k, v)*)
  (*insert: ('a, 'b) t -> 'a -> 'b -> ('a, 'b) t*)
  let rec insert tree k v = match tree with
    Empty -> Node (Empty, k, v, Empty)
  | Node (t1, k0, v0, t2) ->
      if k = k0 then Node (t1, k0, v0, t2)
      else if k < k0 then Node (insert t1 k v, k0, v0, t2)
      else Node (t1, k0, v0, insert t2 k v)

  (*Objective: search key and return value in tree*)
  (*Exception: Not_found (when the key is not found)*)
  (*search : ('a, 'b) t -> 'a -> 'b*)
  let rec search tree k = match tree with
    Empty -> raise Not_found
  | Node (t1, k0, v0, t2) ->
      if k = k0 then v0
      else if k < k0 then search t1 k
      else search t2 k
      
end