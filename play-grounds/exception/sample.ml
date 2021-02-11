(* type 'a option = None
               | Some of 'a *)

let yaoya_list = [("tomato", 300); ("onion", 200); ("carrot", 150); ("hourenso", 200)]
(*Objective: return item's price*)
(*price : string -> (string * int) list -> int*)
let rec price item yaoya_list = match yaoya_list with
  [] -> None
| (yasai, nedan) :: rest ->
    if item = yasai then Some (nedan)
    else price item rest

type person_t = {
  name : string ;
  blood_type : string ;
}
let lst1 = [{name="sato"; blood_type="A"}; {name="suzuki"; blood_type="B"}; {name="tanaka"; blood_type="A"}]

(*Objective: return A-type person*)
(*first_A : person_t list -> person_t*)
let rec first_A lst = match lst with
    [] -> None
  | {name = n; blood_type = bt} :: rest ->
      if bt = "A" then Some ({name = n; blood_type = bt})
      else first_A rest


let test1 = first_A lst1 = Some {name="sato"; blood_type="A"}
let test2 = first_A [] = None

(*Objective: total price when u buy all yasai in yasai_list that is on yaoya_list*)
(*total_price : string list -> (string * int) list -> int*)
let rec total_price yasai_list yaoya_list = match yasai_list with
      [] -> 0
    | first :: rest ->
        match price first yaoya_list with
          None -> total_price rest yaoya_list
        | Some (p) -> p + total_price rest yaoya_list


let rec count_urikire_yasai yasai_list yaoya_list = match yasai_list with
      [] -> 0
    | first :: rest ->
        match price first yaoya_list with
          None -> 1 + count_urikire_yasai rest yaoya_list
        | Some (p) -> count_urikire_yasai rest yaoya_list


let total_price yasai_list yaoya_list =
  let rec hojo yasai_list yaoya_list = match yasai_list with
      [] -> Some (0)
    | first :: rest ->
      match price first yaoya_list with
        None -> None
      | Some(p) -> match hojo rest yaoya_list with
                      None -> None
                    | Some (q) -> Some (p + q) in
    match hojo yasai_list yaoya_list with
      None -> 0
    | Some (p) -> p

(*assoc: 'a -> ('a * 'b) list -> 'b*)
let rec assoc key lst = match lst with
      [] -> Not_found
    | (key0, value0) :: rest ->
        if key = key0 then value0
        else assoc key rest 