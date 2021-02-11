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


val traverse : ('a -> 'b -> 'c -> 'a) -> 'a -> ('b, 'c) t -> 'a 
  (* 使い方：traverse f init tree *) 
  (* 全てのノードを深さ優先で訪れる *) 
  (* 初期値 init から始めて、各ノードで関数 f を順に適用する *) 
 
  
val length : ('a, 'b) t -> int 
  (* 使い方：length tree *) 
  (* 木の中にあるノードの数を求める *) 