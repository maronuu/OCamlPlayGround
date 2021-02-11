let rec gcd m n =
  (
    print_string "m = ";
    print_int m;
    print_string ", n = ";
    print_int n;
    print_newline ();
  if n = 0 then m
  else gcd n (m mod n)
  )

let rec prime n =
  let rec enumerate n =
    if n = 1 then []
    else (enumerate (n-1)) @ [n]
  in let rec sieve lst = 
  (print_int (List.length lst) ;
   print_newline ();
    match lst with
    [] -> []
  | first :: rest -> first :: sieve (List.filter (fun num -> num mod first != 0) rest)
  )
  in sieve (enumerate n)