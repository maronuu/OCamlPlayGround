(*Type: student data*)
type student_t = {
  name : string;
  score : int;
  grade : string
}

(*example*)
let student1 = {
  name = "sato";
  score = 70;
  grade = "B"
}
let student2 = {
  name = "suzuki";
  score = 90;
  grade = "A"
}
let student3 = {
  name = "hoge";
  score = 20;
  grade = "D"
}
let student4 = {
  name = "foo";
  score = 0;
  grade = "D"
}
let student5 = {
  name = "hogehoge";
  score = 65;
  grade = "C"
}

(*gakusei_t list*)
let lst1 = []
let lst2 = [student1; student2]
let lst3 = [student4]
let lst4 = [student5; student1; student3; student2]
let lst5 = [student1; student2; student4; student3]

(*get_score: student_t -> int*)
let get_score student = match student with
  {name = n; score = s; grade = g} -> s

(*student_max : student_t list -> student_t*)
let rec student_max lst = match lst with
  [] -> {name = ""; score = min_int ; grade = ""}
| first :: rest ->
  if get_score first >= get_score (student_max rest) then first
  else student_max rest

(*Test*)
let test1 = student_max [student1; student2; student3; student4; student5] = student2