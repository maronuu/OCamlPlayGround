open Metro
open Heap
open RedBlack


type eki_t = {
  namae : string; (*駅名(漢字の文字列)*)
  saitan_kyori : float ;(*最短距離(実数)*)
  temae_list : string list ;(*駅名のリスト*) 
}

(*Definition of exceptions*)
exception No_such_station of string


(*Objective: initialize and make eki_t list from ekimei_t list*)
(*make_initial_eki_list : ekimei_t list -> string -> eki_t list*)
let make_initial_eki_list lst kiten =
  List.map (
    fun ekimei ->
      match ekimei with
        {kanji = kanji; kana = kana; romaji = romaji; shozoku = shozoku} ->
          if kanji = kiten then {namae = kiten; saitan_kyori = 0.0; temae_list = [kiten]}
          else {namae = kanji; saitan_kyori = infinity; temae_list = []}
  ) lst

(*Objective: return kanji-name of given romaji-name from global_ekimei_list*)
(*romaji_to_kanji: string -> ekimei_t list -> string*)
let rec romaji_to_kanji ekimei lst = match lst with
  [] -> raise (No_such_station (ekimei))
| {kanji = kanji; kana = kana; romaji = romaji; shozoku = shozoku} :: rest ->
    if ekimei = romaji then kanji
    else romaji_to_kanji ekimei rest

(*Objective: insert ekikan to ekikan_tree*)
(*insert1 : tree_t -> string -> stirng -> float -> tree_T*)
let rec insert1 ekikan_tree kiten shuten kyori =
  let lst = try
              search ekikan_tree kiten
            with Not_found -> []
          in insert ekikan_tree kiten ((shuten, kyori) :: lst)
(*Objective: insert ekikan to ekikan_tree*)
(*insert_ekikan : (string * (string * float) list) t -> ekikan_t -> 
                  (string * (string * float) list) t*)
let insert_ekikan ekikan_tree ekikan = match ekikan with
{kiten = k; shuten = s; keiyu = y; kyori = r; jikan = j} ->
insert1 (insert1 ekikan_tree s k r) k s r

(*Objective: matomete*)
(*inserts_ekikan : (string * (string * float))
                  -> ekikan_T list
                  -> (string * (string * float)) t*)
let inserts_ekikan ekikan_tree ekikan_list =
  List.fold_left insert_ekikan ekikan_tree ekikan_list

(* 目的：ekikan_tree から eki_heap と index_tree を作り、kiten を初期化する *) 
(* make_eki_heap_and_index_tree : 
	string -> ekikan_tree_t -> heap_t * index_tree_t *) 
let make_eki_heap_and_index_tree kiten ekikan_tree = 
  traverse (fun (eki_heap, index_tree) k lst -> 
        let (index, heap) = Heap.insert eki_heap 
                (if k = kiten then 0. 
                  else infinity) (*key*)
                (k, if k = kiten then [k] 
              else []) (*value*) in 
        let index_tree' = insert index_tree k index in 
        (heap, index_tree')) 
      ((Heap.create (length ekikan_tree) 0. ("駅名", [])), 
      empty) ekikan_tree

(*Objective: get ekikan-kyori*)
(*get_ekikan_kyori : string -> strgin ->
                      (string * (string * float)) t
                      -> float*)
let rec get_ekikan_kyori eki1 eki2 tree =
  List.assoc eki2 (search tree eki1)


(*Objective: Given p (determined just now) and v (not-determined list), update*)
(*koshin: eki_t -> eki_t list -> ekikan_t list -> eki_t list*)
let koshin p v ekikan_list = 
  List.map (
    (*Objective: check if station p and station q are connected with each other*)
    (* koshin1: eki_t -> eki_t -> eki_t*)
    (fun p q ->
      try 
        let ekikan_kyori = get_ekikan_kyori p.namae q.namae ekikan_list in
        match (p, q) with
            ({namae = n1; saitan_kyori = s1; temae_list = l1}, {namae = n2; saitan_kyori = s2; temae_list = l2}) ->
              if s1 +. ekikan_kyori < s2 then {namae = n2; saitan_kyori = s1 +. ekikan_kyori; temae_list = n2 :: l1}
              else q
      with Not_found -> q
        ) p) v

(*Objective: separate eki list into min-eki & other list*)
(*saitan_wo_bunri : eki_t -> eki_t list -> eki_t * eki_t list*)
let rec saitan_wo_bunri eki eki_list = match eki_list with
  [] -> (eki, [])
| first :: rest ->
    let (p, v) = saitan_wo_bunri first rest in
      if eki.saitan_kyori < p.saitan_kyori then (eki, p :: v)
      else (p, eki :: v)

(*Objective: Main loop of dijkstra || not-determiend list (eki_t) -> ekikan list -> determined eki_t list*)
(*dijkstra_main : eki_t list -> ekikan_t tree -> eki_t list*)
let rec dijkstra_main eki_list ekikan_tree = match eki_list with
      [] -> []
    | first :: rest ->
        let (saitan, other) = saitan_wo_bunri first rest in
        let eki_list2 = koshin saitan other ekikan_tree in
        saitan :: dijkstra_main eki_list2 ekikan_tree

let rec find shuten eki_list = match eki_list with
  [] -> {namae = ""; saitan_kyori = infinity; temae_list = []}
  | first :: rest -> if first.namae = shuten then first
                    else find shuten rest

(*Objective: print eki_t record beautifully*)
(*print_eki : eki_t -> unit*)
let print_eki eki = 
  let rec print_string_list lst = match lst with
    [] -> print_newline ()
  | first :: rest -> (print_string_list rest; print_newline (); print_string first)
in match eki with
  {namae=n; saitan_kyori=s; temae_list=t} ->
    (
      print_string ("Terminal : " ^ n) ;
      print_newline ();
      print_string ("Distance: " ^ string_of_float s) ;
      print_newline ();
      print_string_list t;
    )

(*Objective: Given start and end, calc shortet path*)
(*dijkstra : string -> string -> eki_t*)
let dijkstra start_romaji terminal_romaji =
  let start = romaji_to_kanji start_romaji global_ekimei_list in
  let terminal = romaji_to_kanji terminal_romaji global_ekimei_list in
  let eki_list = make_initial_eki_list global_ekimei_list start in
  let global_ekikan_tree = inserts_ekikan empty global_ekikan_list in
  let eki_list2 = dijkstra_main eki_list global_ekikan_tree in 
  let result = find terminal eki_list2 in
  result
