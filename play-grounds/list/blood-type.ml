(*Type person_t*)
type person_t = {
  name : string;
  blood_type : string
}
(*example*)
let person1 = {name = "sato"; blood_type = "A"}
let person2 = {name = "suzuki"; blood_type = "B"}
let person3 = {name = "yamaguchi"; blood_type = "A"}
let person4 = {name = "kawaguchi"; blood_type = "AB"}
let person5 = {name = "yamada"; blood_type = "A"}

(*person_t list
  -[]
  -first :: rest*)
let rec count_A_type lst = match lst with
  [] -> 0
| {name = n; blood_type = bt} :: rest ->
    (if bt = "A" then 1 else 0) + count_A_type rest

(*example*)
let lst1 = [person1 ; person2] 
let lst2 = []
let lst3 = [person1; person3; person4]
let lst4 = [person1; person2; person3; person4; person5]

(*test*)
let test1 = count_A_type lst1 = 1
let test2 = count_A_type lst2 = 0
let test3 = count_A_type lst3 = 2
let test4 = count_A_type lst4 = 3