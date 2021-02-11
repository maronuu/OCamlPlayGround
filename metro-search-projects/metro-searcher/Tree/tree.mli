(*Signature of module that represents binary tree*)
type ('a, 'b) t
(*Key :'a, Value'b, tree. Private*)
val empty : ('a, 'b) t

val insert : ('a, 'b) t -> 'a -> 'b -> ('a, 'b) t
(*insert tree key value*)
(*insert key and value to tree*)

val search : ('a, 'b) t -> 'a -> 'b
(*search tree key*)
(*search value according to key from tree*)
(*Exception : Not_found (when key is not found)*)