let cnt = ref 0
let rec fib n =
  (cnt := !cnt + 1 ;
   if n < 2 then n
   else fib (n-1) + fib (n-2)
  )