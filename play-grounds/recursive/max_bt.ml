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

let rec count_bt lst = match lst with
  [] -> (0, 0, 0, 0)
| {name = n; blood_type = bt} :: rest ->
  let count_bt_rest = count_bt rest in
    match count_bt_rest with
      (a, b, ab, o) ->
        if bt = "A" then (a+1, b, ab, o)
        else if bt = "B" then (a, b+1, ab, o)
        else if bt = "AB" then (a, b, ab+1, o)
        else (a, b, ab, o+1)