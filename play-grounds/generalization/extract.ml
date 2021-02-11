(*Type person_T*)
type person_t = {
  name : string ;
  blood_type : string ;
}

(*Objective: Extract people's names from person_t data*)
(*extract_name : person_T -> string*)
let extract_name person = match person with
  {name = n; blood_type = bt} -> n

(*Objective: Make name list of pesron list*)
(*make_name_list : person_t list -> string_list*)
let make_name_list lst = List.map extract_name lst

let test1 = make_name_list [{name="sato"; blood_type="A"} ; {name = "yamada"; blood_type = "B"}] = ["sato"; "yamada"]
