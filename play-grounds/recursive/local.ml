(*Objective: min*)
(*min: int list -> int*)
let rec min lst = match lst with
  [] -> []
| first :: rest -> 
    let min_rest = min rest in
      if first <= min_rest then first
      else min_rest

(*Objective: max score student*)
(*max_student : student_t list -> student_t*)
type student_t = {
  name : string;
  score : int;
  grade : string;
}
let get_score student = match student with
      {name = n; score = s; grade = g} -> s

let rec max_student lst = match lst with
      [] -> {name = ""; score = min_int; grade = ""}
    | first :: rest -> 
        let max_rest = max_student rest in
          if get_score first >= get_score max_rest then first
          else max_rest