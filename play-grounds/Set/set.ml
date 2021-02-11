type 'a t = 'a list

let empty = []

let singleton element = [element]

let union set1 set2 = set1 @ set2

let inter set1 set2 =
  List.filter (fun element -> List.mem element set2) set1

let diff set1 set2 =
  List.filter (fun element -> not (List.mem element set2)) set1

let mem element set = List.mem element set