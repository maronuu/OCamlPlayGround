(*Type person_t*)
type person_t = {
  name : string;
  score : int
}
(*example person_t*)
let p1 = {
  name = "sato";
  score = 10
}
let p2 = {
  name = "suzuki";
  score = 100
}
let p3 = {
  name = "yamada";
  score = 1000
}
let p4 = {
  name = "takada";
  score = 340
}
let p5 = {
  name = "uchida";
  score = 200
}



(*person_t list
  - [] -> []
  - lst -> first :: rest*)
let lst1 = []
let lst2 = [p1; p2]
let lst3 = [p3; p4; p5]
let lst4 = [p1; p4]
let lst5 = [p2; p4; p1; p3; p5]



(*Objective: get name from person_t data*)
(*get_name : person_t -> string*)
let get_name person = match person with
  {name = n; score = s} -> n
(*test*)
let test1 = get_name p1 = "sato"
let test2 = get_name p2 = "suzuki"


(*Objective: Insert given person as a sorted person_t list*)
(*insert_person : person_t list -> person_t -> person_t list*) 
let rec insert_person lst person = match lst with
  [] -> [person]
| first :: rest -> if get_name first < get_name person then first :: (insert_person rest person)
                   else person :: first :: rest
(*test*)
let test3 = insert_person [] p1 = [p1]
let test4 = insert_person [p1; p2; p3] p4 = [p1; p2; p4; p3]



(*Objective: Do insert sort on list by name*)
(*person_sort: person_t list -> person_t list*)
let rec persont_sort lst = match lst with
  [] -> []
| first :: rest -> insert_person (persont_sort rest) first
(*test*)
let test5 = persont_sort lst1 = []
let test6 = persont_sort lst2 = [p1; p2]
let test7 = persont_sort lst3 = [p4; p5; p3]
let test8 = persont_sort lst4 = [p1; p4]
let test9 = persont_sort lst5 = [p1; p2; p4; p5; p3]