(*Types*)
(*type of index of heap*)
type index_t = int ref

(*type of heap*)
(*'a : target value*)
(*'b : other info*)
(* size_of_heap * (index * a * b) array*)
type ('a, 'b) t = int ref * (index_t * 'a * 'b) array

(*Exceptions*)
(*exception when you try to insert something into filled heap*)
exception Full

(*exception when you try to get somthing from empty heap*)
exception Empty

(*Example_index*)
let init_index = ref (-1)

(*Objective : create empty heap*)
(*create : int -> 'a -> 'b -> ('a, 'b) t*)
let create size init_key init_value =
  (
    ref 0,
    Array.make size (init_index, init_key, init_value)
  )

(*Objective: swap current and parent*)
(*swap : (index_t * 'a * 'b) array -> int -> int -> unit*)
let swap array current_idx parent_idx =
  let (index_ref_c, a_c, b_c) as entry_c = array.(current_idx)
in let (index_ref_p, a_p, b_p) as entry_p = array.(parent_idx)
in (
  array.(current_idx) <- entry_p;
  array.(parent_idx) <- entry_c;
  index_ref_c := parent_idx;
  index_ref_p := current_idx;
  ()
) 

(*Objective: swap elements from top to bottom*)
(*adjust_child : int -> (index_t * 'a * 'b) array -> int -> unit*)
let rec adjust_child size array current_idx =
  if current_idx >= size then ()
  else let (_, a_c, _) = array.(current_idx) in
       let left_child_idx = 2 * current_idx + 1 in
       let right_child_idx = 2 * current_idx + 2 in
       if left_child_idx >= size then ()
       else let (_, a_left, _) = array.(left_child_idx) in
            if right_child_idx >= size then 
              if a_c > a_left then (
                                      swap array left_child_idx current_idx;
                                      adjust_child size array left_child_idx;
                                    )
              else ()
            else let (_, a_right, _) = array.(right_child_idx) in
              if a_left > a_right then
                if a_c > a_right then (
                                        swap array right_child_idx current_idx;
                                        adjust_child size array right_child_idx;
                                      )
                else ()
              else 
                if a_c > a_left then (
                                        swap array left_child_idx current_idx;
                                        adjust_child size array left_child_idx;
                                      )
                else ()
                 
(*Objective: swap elements from bottom to top*)
(*adjust_parent : (index_t * 'a * 'b) array -> int -> unit*)
let rec adjust_parent array current_idx =
  if current_idx = 0 then ()
  else let parent_idx = (current_idx - 1) / 2 in
       let (_, a_p, _) = array.(parent_idx) in
       let (_, a_c, _) = array.(current_idx) in
       if a_c < a_p then (
                            swap array current_idx parent_idx;
                            adjust_parent array parent_idx;
                          )
       else ()


(*Objective: Insert data into heap*)
(*insert : ('a, 'b) t -> 'a -> 'b -> index_t * ('a, 'b) t*)
(*Raise : Full*)
(*DESTRUVTICE*)
let insert (size_ref, array) key value =
  if !size_ref >= Array.length array then raise Full
  else let index = ref (!size_ref) in (
    array.(!size_ref) <- (index, key, value);
    adjust_parent array !size_ref;
    size_ref := !size_ref + 1;
    (index, (size_ref, array))
  )
      

(*Objective: Get data from heap*)
(*get : ('a, 'b) t -> index_t -> 'a * 'b*)
(*Raise : Not_found*)
let get (size_ref, array) index_ref =
  if 0 <= !index_ref && !index_ref < !size_ref
    then let (_, a, b) = array.(!index_ref) in
      (a, b)
  else raise Not_found


(*Objective: Set data to heap*)
(* set : ('a, 'b) t -> index_t -> 'a -> 'b -> ('a, 'b) t*)
(*DESTRUCTIVE*)
let set (size_ref, array) index_ref key value =
  let (_, a_before, _) = array.(!index_ref) in
  (
    array.(!index_ref) <- (index_ref, key, value);
    if key < a_before then adjust_parent array !index_ref
    else adjust_child !size_ref array !index_ref;
    (size_ref, array)
  )
  

(*Objective: split min-element and return it and rest heap*)
(*split_top : ('a, 'b) t -> ('a * 'b) * ('a * 'b) t*)
(*Raise : Empty*)
(*DESTRUCTIVE*)
let split_top (size_ref, array) =
  if !size_ref = 0 then raise Empty
  else let (index_ref, key, value) = array.(0) in
       (
         size_ref := !size_ref - 1;
         array.(0) <- array.(!size_ref);
         adjust_child !size_ref array 0;
         index_ref := -1;
         ((key, value), (size_ref, array))
       )

(*Objective: get length of heap*)
(*length : ('a, 'b) t -> int*)
let length (size_ref, _) = !size_ref