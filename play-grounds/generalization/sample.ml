type student_t = {
  name : string ;
  score : int ;
  grade : string ;
}

(*Objective: count num of students who have given grade*)
(*count : student_t list -> string -> int*)
let rec count lst grade_0 = match lst with
  [] -> 0
| {name = n; score = s; grade = g} :: rest ->
    (if g = grade_0 then 1 else 0) + count rest grade_0



