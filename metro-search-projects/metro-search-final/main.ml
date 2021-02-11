(*Main*)
let main start_romaji terminal_romaji =
  let res = Dijkstra.dijkstra start_romaji terminal_romaji in
  Dijkstra.print_eki res

let _ = main Sys.argv.(1) Sys.argv.(2)