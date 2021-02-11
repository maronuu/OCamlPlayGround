type index_t
(*index of heap*)

type ('a, 'b) t
(*'a : 最小値を求める値*)
(*'b : ohter info*)

exception Full

exception Empty

val create : int -> 'a -> 'b -> ('a, 'b) t
    (*usage: create size key value*)
    (*return empty heap*)

val insert : ('a, 'b) t -> 'a -> 'b -> index_t * ('a, 'b) t
    (*usage: insert heap key value*)
    (*insert new element into heap*)
    (*DESTRUCTIVE*)

val get : ('a, 'b) t -> index_t -> 'a * 'b
    (*usage: get heap index*)
    (*get index-th element in heap*)

val set : ('a, 'b) t -> index_t -> 'a -> 'b -> ('a, 'b) t
    (*usage: set heap index key value*)
    (*return heap whose index-th value is updated*)
    (*DESTRUCTIVE*)

val split_top : ('a, 'b) t -> ('a * 'b) * ('a, 'b) t
    (*usage: split_top heap*)
    (*return min-element * rest heap*)
    (*DESTRUCIVE*)

val length : ('a, 'b) t -> int
    (*usage: length heap*)
    (*return number of data in heap*)