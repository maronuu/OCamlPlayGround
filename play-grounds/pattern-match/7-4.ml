let mid p1 p2 = match p1, p2 with
  (x1, y1), (x2, y2) -> ((x1+.x2)/. 2., (y1+.y2)/. 2.)

(*test*)
let test1 = mid (1., 1.) (2., 2.) = (1.5, 1.5)