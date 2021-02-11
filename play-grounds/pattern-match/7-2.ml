(*Objective: Return strings "hoge's grade is fuga"*)
(*grade: string * string -> string*)
let grade (name, score) = name ^ "'s grade is " ^ score ;;

(*test*)
let test1 = grade ("Alice", "A+") = "Alice's grade is A+"
let test2 = grade ("Bob", "B") = "Bob's grade is B"
let test3 = grade ("Ken", "D") = "Ken's grade is D"
