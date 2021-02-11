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

(*Objective: get score*)
(*get_score : student_t -> int*)
let get_score student = match student with
                                {name = n; score = s; grade = g} -> s
(*student_insert : student_t list -> student_t -> stundet_t list*)
let rec student_insert lst student = match lst with
                                [] -> [student]
                              | first :: rest -> if get_score first < get_score student then first :: (student_insert rest student)
                                                                        else student :: first :: rest 
(*student_sort: student_t list -> student_t list*)
let rec student_sort lst = match lst with
  [] -> []
| first :: rest -> student_insert (student_sort rest) first

(*test*)
let test1 = student_sort lst1 = []
let test2 = student_sort lst2 = [student1; student2]
let test3 = student_sort lst3 = [student4]
let test4 = student_sort lst4 = [student3 ; student5 ; student1 ; student2]
let test5 = student_sort lst5 = [student4 ; student3 ; student1 ; student2]