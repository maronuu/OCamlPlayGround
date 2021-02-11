(*Yugu jikyu*)
let yugu_jikyu = 980
let kihonkyu = 800
let jikyu = 900
let kyuyo x = 
  if x < 30 then kihonkyu + x * jikyu
  else kihonkyu + x * yugu_jikyu

(*test*)
let test1 = kyuyo 30 = 30200 ;;
let test2 = kyuyo 0 = kihonkyu ;;