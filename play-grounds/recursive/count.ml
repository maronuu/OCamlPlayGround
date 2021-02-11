(*Objective: count number of students who has each of grades "A B C D"*)
(*count: student_t list -> int * int * int * int *)
type student_t = {
  name : string;
  score : int;
  grade : string;
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


let rec count lst = match lst with
  [] -> (0, 0, 0, 0)
| {name = n; score = s; grade = g} :: rest ->
    let count_rest = count rest in
      match count_rest with
      (n1, n2, n3, n4) ->
        if g = "A" then (n1 + 1, n2, n3, n4)
        else if g = "B" then (n1, n2 + 1, n3, n4)
        else if g = "C" then (n1, n2, n3 + 1, n4)
        else (n1, n2, n3, n4 + 1)
  
let test1 = count lst1 = (0, 0, 0, 0)
let test2 = count lst5 = (1, 1, 0, 2)      