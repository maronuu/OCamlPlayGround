(*A type that represents a station (kanji, kana, romaji, line)*)
type station_t = {
  kanji : string ;
  kana : string ;
  romaji : string ;
  line : string
}

(*Objective: Display "line, station(kana)"*)
(*display: station_t -> string*)
let display station = match station with
{kanji = kanji; kana = kana; romaji = romaji; line = line} ->
  line ^ ", " ^ kanji ^ "(" ^ kana ^")"

(*test*)

(*A type that represents connectivity between two stations*)
type between_station_t = {
  start : string ;
  goal : string ;
  via : string ;
  distance : float ;
  time : int
}
