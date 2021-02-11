(*A type that represent a student's (name, score, grade)*)
type student_t = {
  name: string ;
  score: int;
  grade: string
}

(*Objective: Return graded data*)
(*evaluate: student_t -> student_t*)
let evaluate student = match student with
  {name = n; score = s; grade = g} ->
    {name = n;
     score = s;
     grade = if s >= 80 then "A"
     else if s >= 70 then "B"
     else if s >= 60 then "C"
     else "D"}


(*test*)
let test1 = evaluate {name = "oguri"; score = 90; grade = ""}
                    = {name = "oguri"; score = 90; grade = "A"}
let test2 = evaluate {name = "oguri"; score = 85; grade = ""}
                    = {name = "oguri"; score = 85; grade = "A"}
let test2 = evaluate {name = "oguri"; score = 80; grade = ""}
= {name = "oguri"; score = 80; grade = "A"}
let test3 = evaluate {name = "oguri"; score = 74; grade = ""}
= {name = "oguri"; score = 74; grade = "B"}
let test4 = evaluate {name = "oguri"; score = 65; grade = ""}
= {name = "oguri"; score = 65; grade = "C"}
let test5 = evaluate {name = "oguri"; score = 100; grade = ""}
= {name = "oguri"; score = 100; grade = "A"}
let test6 = evaluate {name = "oguri"; score = 90; grade = ""}
= {name = "oguri"; score = 90; grade = "A"}
let test7 = evaluate {name = "oguri"; score = 50; grade = ""}
= {name = "oguri"; score = 50; grade = "D"}