(*A type that represents person data*)
type person_t = {
  name : string ;
  blood_type : string ;
}
(*example*)
let p1 = {
  name = "sato";
  blood_type = "A"
}
let p2 = {
  name = "suzuki";
  blood_type = "B"
}
let p3 = {
  name = "takeda";
  blood_type = "AB"
}
let p4 = {
  name = "uchida";
  blood_type = "O"
}
let p5 = {
  name = "Asada";
  blood_type = "A"
}

(*person_t list example*)
let lst1 = []
let lst2 = [p1]
let lst3 = [p1; p2; p3]
let lst4 = [p1; p2; p3; p4]
let lst5 = [p1; p2; p3; p4; p5]


type n_blood_type_t = {
  a : int;
  b: int;
  ab: int;
  o: int;
}




(*Objective count number of person by each blood type*)
(*count_bt : person_t list -> n_blood_type_t*)
let rec count_bt lst = match lst with
  [] -> {a = 0; b = 0; ab = 0; o = 0}
| {name = n; blood_type = bt} :: rest -> 
  let count_bt_rest = count_bt rest in
    match count_bt_rest with
    {a = a; b = b; ab = ab; o = o} ->
      if bt = "A" then {a = a + 1; b = b; ab = ab; o = o}
      else if bt = "B" then {a = a; b = b + 1; ab = ab; o = o}
      else if bt = "AB" then {a = a; b = b; ab = ab + 1; o = o}
      else {a = a; b = b; ab = ab; o = o + 1}


(*test*)
let test1 = count_bt lst1 = {a = 0; b = 0; ab = 0; o = 0}
let test2 = count_bt lst2 = {a = 1; b = 0; ab = 0; o = 0}
let test3 = count_bt lst3 = {a = 1; b = 1; ab = 1; o = 0}
let test4 = count_bt lst4 = {a = 1; b = 1; ab = 1; o = 1}
let test5 = count_bt lst5 = {a = 2; b = 1; ab = 1; o = 1}