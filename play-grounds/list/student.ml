(*Student data*)
type student_t = {
  name : string ;
  score : int ;
  grade : string
}

(*student_t list
  - []
  - first :: rest     first is student_t type
                      rest is self-reference*)

(*example*)
let lst1 = []
let lst2 = [{name = "sato"; score = 70; grade = "B"}]
let lst3 = [{name = "suzuki" ; score = 90; grade = "A"};
            {name = "yoshida" ; score = 20; grade = "D"}]
let lst4 = [{name = "yoshida"; score = 20; grade = "D"} ;
            {name = "takamatsu"; score = 80; grade = "A"};
            {name = "nishida"; score = 100; grade = "A"}]
            

(*Objective: Return the number of people who have grade A in lst*) 
(*count_A : student_t list -> int*)
(* let rec count_A lst = match lst with
  [] -> 0
| first :: rest -> (match first with
                      {name = n; score = s; grade = g}
                      -> if g = "A" then 1 else 0)
                    + count_A rest count_A rest *)

(*Smarter style !!!*)                    
let rec count_A lst = match lst with
  [] -> 0
| {name = n; score = s; grade = g} :: rest ->
    (if g = "A" then 1 else 0) + count_A rest
            

(*test*)
let test1 = count_A lst1 = 0
let test2 = count_A lst2 = 0
let test3 = count_A lst3 = 1
let test4 = count_A lst4 = 2