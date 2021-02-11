(*Main*)
let main n = 
  let result = Fac.f n in
  (
    print_string ("Factorial of " ^ string_of_int n ^ " = ") ; 
    print_int result;
    print_newline ()
  )

let _ = main (int_of_string Sys.argv.(1))