type student_t = {
  name : string ;
  score : int ;
  grade : string ;
}
let s1 = {
  name = "sato";
  score = 90;
  grade = "A"
}
let s2 = {
  name = "suzuki";
  score = 80;
  grade = "A"
}
let s3 = {
  name = "takagi";
  score = 20;
  grade = "D"
}

(*student_sum : student_t list -> int*)
let student_score_sum lst =
  let get_score student = match student with
    {name = n; score = s; grade = g} -> s in
    let add_int first rest_result =
      (get_score first) + rest_result in
          List.fold_right add_int lst 0

let test1 = student_score_sum [] = 0
let test2 = student_score_sum [s1; s2; s3] = 190