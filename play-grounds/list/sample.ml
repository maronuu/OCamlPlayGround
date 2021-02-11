(*A list includes spring, summer, autumn, winter*)
"spring" :: "summer" :: "autumn" ::"winter" :: []


(*A type that represent a person (height(m), weight(kg), birthday_month, birthday_day, blood_type)*)
type person_t = {
  height : float;
  weight : float;
  birthday_month : int;
  birthday_day : int;
  blood_type : string
}

(*A list includes 3 person_t type data*)
let person_1 = {
  height = 1.73 ;
  weight = 80.0 ;
  birthday_month = 11;
  birthday_day = 1;
  blood_type = "A"
}
let person_2 = {
  height = 1.73 ;
  weight = 80.1 ;
  birthday_month = 11;
  birthday_day = 9;
  blood_type = "B"
}
let person_3 = {
  height = 1.63 ;
  weight = 50.0 ;
  birthday_month = 1;
  birthday_day = 14;
  blood_type = "O"
}

let people = person_1 :: person_2 :: person_3 :: [] ;;