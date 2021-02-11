(*A type that represent a person (height(m), weight(kg), birthday_month, birthday_day, blood_type)*)
type person_t = {
  height : float;
  weight : float;
  birthday_month : int;
  birthday_day : int;
  blood_type : string
}

(*Objective: return "hoge's blood type is fuga"*)
(*get_blood_type: person_t -> string*)
let get_blood_type person = match person with
  {height = h; weight = w; birthday_month = m; birthday_day = d; blood_type = bt} ->
    "Your blood type is " ^ bt

(*test*)
let test1 = get_blood_type {height = 1.73; weight = 42.21; birthday_month = 11; birthday_day = 12; blood_type = "B"} = "Your blood type is B"