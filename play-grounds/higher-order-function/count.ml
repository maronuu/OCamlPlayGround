type student_t = {
  name : string;
  score : int;
  grade : string;
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
(*Count number of student who has given grade*)
(*count : student_t list -> string -> int*)
let count lst grade_0 =
  let is_grade_grade_0 student =
    match student with
      {name = n; score = s; grade = g} -> g = grade_0 in
        List.length (List.filter is_grade_grade_0 lst)

let test1 = count [] "A" = 0
let test2 = count [s1; s2] "A" = 2
let test3 = count [s3] "C" = 0