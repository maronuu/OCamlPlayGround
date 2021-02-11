type team_t = Red | White

let team_string team = match team with
  Red -> "red-team"
| White -> "white-team"


type nengou_t = Meiji of int 
              | Taisho of int
              | Showa of int
              | Heisei of int

let to_seireki  nengou = match nengou with
  Meiji (n) -> n + 1867
| Taisho (n) -> n + 1911
| Showa (n) -> n + 1925
| Heisei (n) -> n + 1988

(*Objective: return nenrei based on birth-year*)
(*nenrei: nengou_t -> nengou_t -> n*)
let nenrei birth_year year = to_seireki year - to_seireki birth_year

type year_t = January of int
            | February of int
            | March of int
            | April of int
            | May of int
            | June of int
            | July of int
            | August of int
            | September of int
            | October of int
            | November of int
            | December of int

