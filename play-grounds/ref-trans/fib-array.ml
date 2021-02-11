(*Objective: return array that includes fibbonatti numbers in order*)
(*fib_array : int array -> int array*)
let fib_array arr =
  let len = Array.length arr
in let rec setter n =
  if n = len then ()
  else (
        arr.(n) <- arr.(n-1) + arr.(n-2);
        setter (n+1)
       )
in if len = 0 then [||]
else if len = 1 then [|0|]
else if len = 2 then [|0; 1|]
else (
  arr.(0) <- 0;
  arr.(1) <- 1;
  setter 2;
  arr;
)

let test1 = fib_array [|0; 0; 0; 0; 0; 0; 0; 0|] = [|0; 1; 1; 2; 3; 5; 8; 13|]