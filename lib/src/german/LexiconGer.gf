--# -path=.:../common:../abstract:../../prelude

-- work by Aarne Ranta, Andreas Priesnitz, and Henning Thielemann.

concrete LexiconGer of Lexicon = CatGer ** 
  open Prelude, ParadigmsGer, (Mo = MorphoGer), IrregGer in {

flags 
  optimize=all_subs ;

lin
  add_V3 = dirV3 (prefixV "hinzu" (regV "f�gen")) zu_Prep ;
  airplane_N = mkN "Flugzeug"  ;
  already_Adv = mkAdv "schon" ;
  answer_V2S = mkV2S (regV "antworten") datPrep ;
  apartment_N = mkN "Wohnung" ;
  apple_N = reg2N "Apfel" "�pfel" masculine  ;
  art_N = reg2N "Kunst" "K�nste" feminine ;
  ask_V2Q = mkV2Q (regV "fragen") accPrep ;
  baby_N = reg2N "Baby" "Babies" neuter ; ----
  bad_A = regA "schlecht" ;
  bank_N = reg2N "Bank" "Banken" feminine ;
  beautiful_A = regA "sch�n" ;
  become_VA = mkVA IrregGer.werden_V ;
  beer_N = reg2N "Bier" "Biere" neuter ;
  beg_V2V = mkV2V (mk6V "bitten" "bittet" "bitte" "bat" "b�te" "gebeten") accPrep ;
  big_A = mk3A "gro�" "gr��er" "gr��te" ;
  bike_N = reg2N "Fahrrad" "Fahrr�der" neuter ;
  bird_N = reg2N "Vogel" "V�gel" masculine ;
  black_A = regA "schwarz" ;
  blue_A = regA "blau";
  boat_N = reg2N "Boot" "Boote" neuter ;
  book_N = reg2N "Buch" "B�cher" neuter ;
  boot_N = reg2N "Stiefel" "Stiefel" masculine ;
  boss_N = reg2N "Chef" "Chefs" masculine ; ----
  boy_N = reg2N "Junge" "Jungen" masculine ;
  bread_N = reg2N "Brot" "Brote" neuter ;
  break_V2 = dirV2 
    (irregV "zerschlagen" "zerschl�gt" "zerschlug" "zerschl�ge" "zerschlagen") ;
  broad_A = regA "breit" ;
  brother_N2 = mkN2 (reg2N "Bruder" "Br�der" masculine)  von_Prep ;
  brown_A = regA "braun" ;
  butter_N = reg2N "Butter" "Butter" feminine ; ---- infl
  buy_V2 = dirV2 (regV "kaufen") ;
  camera_N = reg2N "Kamera" "Kameras" feminine ;
  cap_N = mkN "M�tze" ;
  car_N = mkN "Auto" "Autos" neuter ;
  carpet_N = mkN "Teppich" ;
  cat_N = mkN "Katze" ;
  ceiling_N = reg2N "Dach" "D�cher" neuter ;
  chair_N = reg2N "Stuhl" "St�hle" masculine ;
  cheese_N = mkN "K�se" "K�se" masculine ;
  child_N = reg2N "Kind" "Kinder" neuter ;
  church_N = mkN "Kirche" ;
  city_N = reg2N "Stadt" "St�dte" feminine ;
  clean_A = regA "rein" ;
  clever_A = mk3A "klug" "kl�ger" "kl�gste" ;
  close_V2 = dirV2 (irregV "schlie�en" "schlie�t" "schlo�" "schl�sse" "geschlossen") ;
  coat_N = mkN "Jacke" ;
  cold_A = regA "kalt" ;
  come_V = seinV (mk6V "kommen" "kommt" "komm" "kam" "k�me" "gekommen") ;
  computer_N = reg2N "Rechner" "Rechner" masculine ;
  country_N = reg2N "Land" "L�nder" neuter ;
  cousin_N = reg2N "Vetter" "Vetter" masculine ; --- Kusine
  cow_N = reg2N "Kuh" "K�he" feminine ;
  die_V = seinV (irregV "sterben" "stirbt" "starb" "st�rbe" "gestorben") ;
  distance_N3 = mkN3 (mkN "Entfernung") von_Prep zu_Prep ;
  dirty_A = regA "schmutzig" ;
  do_V2 = dirV2 (irregV "tun" "tut" "tat" "t�te" "getan") ;
  doctor_N = reg2N "Arzt" "�rzte" masculine ;
  dog_N = mkN "Hund" ;
  door_N = reg2N "T�r" "T�ren" feminine ;
  drink_V2 = dirV2 (irregV "trinken" "trinkt" "trank" "tr�nke" "getrunken") ;
  easy_A2V = mkA2V (regA "leicht") (mkPrep "f�r" accusative) ;
  eat_V2 = dirV2 (irregV "essen" "i�t" "a�" "��e" "gegessen") ;
  empty_A = regA "leer" ; ---- check infl
  enemy_N = mkN "Feind" ; 
  factory_N = mkN "Fabrik" "Fabriken" feminine ;
  father_N2 = mkN2 (reg2N "Vater" "V�ter" masculine) von_Prep ;
  fear_VS = mkVS (regV "f�rchten") ;
  find_V2 = dirV2 (irregV "finden" "findet" "fand" "f�nde" "gefunden") ;
  fish_N = mkN "Fisch" ;
  floor_N = reg2N "Fu�boden" "Fu�b�den" masculine ;
  forget_V2 = dirV2 (irregV "vergessen" "vergi�t" "verga�" "verg��e" "vergessen") ;
  fridge_N = reg2N "K�hlschrank" "K�hlschr�nke" masculine ;
  friend_N = mkN "Freund" ;
  fruit_N = reg2N "Frucht" "Fr�chte" feminine ;
  fun_AV = mkAV (regA "toll") ;
  garden_N = reg2N "Garten" "G�rten" masculine ;
  girl_N = reg2N "M�dchen" "M�dchen" neuter ;
  glove_N = mkN "Handschuh" ;
  gold_N = reg2N "Gold" "Golde" neuter ; ---- infl
  good_A = mk3A "gut" "besser" "beste" ;
  go_V = seinV (irregV "gehen" "geht" "ging" "ginge" "gegangen") ;
  green_A = regA "gr�n" ;
  harbour_N = reg2N "Hafen" "H�fen" masculine ;
  hate_V2 = dirV2 (regV "hassen") ;
  hat_N = reg2N "Hut" "H�te" masculine ;
  hear_V2 = dirV2 (regV "h�ren") ;
  hill_N = mkN "H�gel" ;
  hope_VS = mkVS (regV "hoffen") ;
  horse_N = reg2N "Pferd" "Pferde" neuter ;
  hot_A = regA "hei�" ;
  house_N = reg2N "Haus" "H�user" neuter ;
  important_A = regA "wichtig" ;
  industry_N = mkN "Industrie" ;
  iron_N = reg2N "Eisen" "Eisen" neuter ;
  jump_V = seinV (irregV "springen" "springt" "sprang" "spr�nge" "gesprungen") ;
  king_N = mkN "K�nig" ;
  know_V2 = dirV2 (irregV "kennen" "kennt" "kannte" "k�nnte" "gekannt") ; ---- infl
  know_VQ = mkVQ wissen_V ;
  know_VS = mkVS wissen_V ;
  lake_N = reg2N "See" "Seen" masculine ; --- infl
  lamp_N = mkN "Lampe";
  learn_V2 = dirV2 (regV "lernen") ;
  leather_N = reg2N "Leder" "Leder" neuter ;
  leave_V2 = dirV2 (irregV "verlassen" "verl��t" "verlie�" "verlie�e" "verlassen") ;
  like_V2 = dirV2 (irregV "m�gen" "mag" "mochte" "m�chte" "gemocht") ;
  listen_V2 = prepV2 (prefixV "zu" (regV "h�ren")) datPrep ; ---- dat
  live_V = regV "leben" ;
  long_A = mk3A "lang" "l�nger" "l�ngste" ;
  lose_V2 = dirV2 (irregV "verlieren" "verliert" "verlor" "verl�re" "verloren") ;
  love_N = mkN "Liebe" ;
  love_V2 = dirV2 (regV "lieben") ;
  man_N = reg2N "Mann" "M�nner" masculine ;
  married_A2 = mkA2 (regA "verheiratet") (mkPrep "mit" dative) ;
  meat_N = reg2N "Fleisch" "Fleische" neuter ; ---- infl
  milk_N = reg2N "Milch" "Milche" feminine ; ---- infl
  moon_N = mkN "Mond" ;
  mother_N2 = mkN2 (reg2N "Mutter" "M�tter" feminine) von_Prep ;
  mountain_N = mkN "Berg" ;
  music_N = reg2N "Musik" "Musiken" feminine ;
  narrow_A = regA "schmal" ;
  new_A = regA "neu" ;
  newspaper_N = mkN "Zeitung" ;
  now_Adv = mkAdv "jetzt" ;
  number_N = reg2N "Zahl" "Zahlen" feminine ;
  oil_N = reg2N "�l" "�le" neuter ;
  old_A = mk3A "alt" "�lter" "�lteste" ;
  open_V2 = dirV2 (regV "�ffnen") ;
  paint_V2A = mkV2A (regV "malen") accPrep ;
  paper_N = reg2N "Papier" "Papiere" neuter ;
  paris_PN = mkPN "Paris" "Paris" ;
  peace_N = mk6N "Friede" "Frieden" "Frieden" "Friedens" "Frieden" "Frieden" masculine ;
  pen_N = mkN "Bleistift" ; ----
  planet_N = reg2N "Planet" "Planeten" masculine ;
  plastic_N = reg2N "Plastik" "Plastiken" feminine ; ----
  play_V2 = dirV2 (regV "spielen") ;
  policeman_N = reg2N "Polizist" "Polizisten" masculine ;
  priest_N = mkN "Priester" ;
  probable_AS = mkAS (regA "wahrscheinlich") ;
  put_V2 = dirV2 (regV "setzen") ;
  queen_N = reg2N "K�nigin" "K�niginnen" feminine ;
  radio_N = reg2N "Radio" "Radios" neuter ; ----
  rain_V0 = mkV0 (regV "regnen") ;
  read_V2 = dirV2 (irregV "lesen" "liest" "las" "l�se" "gelesen") ;
  red_A = regA "rot" ;
  religion_N = mkN "Religion" ;
  restaurant_N = reg2N "Restaurant" "Restaurants" neuter ;
  river_N = reg2N "Flu�" "Fl�sse" masculine ;
  rock_N = mkN "Stein" ;
  roof_N = reg2N "Dach" "D�cher" neuter ;
  rubber_N = reg2N "Gummi" "Gummis" neuter ;
  run_V = seinV (irregV "laufen" "l�uft" "lief" "liefe" "gelaufen") ;
  say_VS = mkVS (regV "sagen") ;
  school_N = mkN "Schule";
  science_N = reg2N "Wissenschaft" "Wissenschaften" feminine ;
  sea_N = reg2N "Meer" "Meere" neuter ;
  seek_V2 = dirV2 (regV "suchen") ;
  see_V2 = dirV2 (irregV "sehen" "sieht" "sah" "s�he" "gesehen") ;
  sell_V3 = accdatV3 (no_geV (regV "verkaufen")) ;
  send_V3 = accdatV3 (regV "schicken") ;
  sheep_N = reg2N "Schaf" "Schafe" neuter ;
  ship_N = reg2N "Schiff" "Schiffe" neuter ;
  shirt_N = reg2N "Hemd" "Hemden" neuter ; ---- infl
  shoe_N = mkN "Schuh" ;
  shop_N = reg2N "Laden" "L�den" masculine ;
  short_A =  mk3A "kurz" "k�rzer" "k�rzeste" ;
  silver_N = reg2N "Silber" "Silber" neuter ; ---- infl
  sister_N = reg2N "Schwester" "Schwestern" feminine ;
  sleep_V = irregV "schlafen" "schl�ft" "schlief" "schliefe" "geschlafen" ;
  small_A = regA "klein" ;
  snake_N = mkN "Schlange" ;
  sock_N = reg2N "Strumpf" "Str�mpfe" masculine ;
  song_N = reg2N "Lied" "Lieder" neuter ;
  speak_V2 = dirV2 (irregV "sprechen" "spricht" "sprach" "spr�che" "gesprochen") ;
  star_N = mkN "Sterne" ;
  steel_N = mkN "Stahl" ;
  stone_N = mkN "Stein" ;
  stop_V = seinV (irregV "halten" "h�lt" "hielt" "hielte" "gehalten") ;
  stove_N = mkN "Herd" ;
  student_N = reg2N "Student" "Studenten" masculine ;
  stupid_A = mk3A "dumm" "d�mmer" "d�mmste" ; ----
  sun_N = mkN "Sonne" ;
  switch8off_V2 = dirV2 (prefixV "aus" (regV "schalten")) ;
  switch8on_V2 = dirV2 (prefixV "ein" (regV "schalten")) ;
  table_N = mkN "Tisch"  ;
  talk_V3 = mkV3 (regV "reden") datPrep von_Prep ;
  teacher_N = reg2N "Lehrer" "Lehrer" masculine ;
  teach_V2 = dirV2 (no_geV (regV "unterrichten")) ;
  television_N = reg2N "Fernsehen" "Fernsehen" neuter;
  thick_A = regA "dick" ;
  thin_A = regA "d�nn" ;
  train_N = reg2N "Zug" "Z�ge" masculine  ;
  travel_V = regV "reisen" ;
  tree_N = reg2N "Baum" "B�ume" masculine ;
  ----  trousers_N = mkN "trousers" ; ---- pl t !
  ugly_A = regA "h��lich" ;
  understand_V2 = 
    dirV2 (irregV "verstehen" "versteht" "verstand" "verst�nde" "verstanden") ;
  university_N = reg2N "Universit�t" "Universit�ten" feminine  ;
  village_N = reg2N "Dorf" "D�rfer" neuter ;
  wait_V2 = prepV2 (regV "warten") (mkPrep "auf" accusative) ;
  walk_V = seinV (irregV "gehen" "geht" "ging" "ginge" "gegangen") ;
  warm_A = mk3A "warm" "w�rmer" "w�rmste" ;
  war_N = mkN "Krieg" ;
  watch_V2 = prepV2 (regV "schauen") (mkPrep "an" accusative) ;
  water_N = reg2N "Wasser" "Wasser" neuter ;
  white_A = regA "wei�" ;
  window_N = reg2N "Fenster" "Fenster" neuter ;
  wine_N = mkN "Wein" ;
  win_V2 = dirV2 (irregV "gewinnen" "gewinnt" "gewann" "gew�nne" "gewonnen") ;
  woman_N = reg2N "Frau" "Frauen" feminine ;
  wonder_VQ = mkVQ (reflV (regV "wundern") accusative) ;
  wood_N = reg2N "Holz" "H�lzer" neuter ;
  write_V2 = dirV2 (irregV "schreiben" "schreibt" "schrieb" "schriebe" "geschrieben") ;
  yellow_A = regA "gelb" ;
  young_A = mk3A "jung" "j�nger" "j�ngste" ;
  left_Ord = Mo.mkOrd (regA "link") ;
  right_Ord = Mo.mkOrd (regA "recht") ;
  far_Adv = mkAdv "weit" ;
  correct_A = regA "richtig" ;
  dry_A = regA "trocken" ;
  dull_A = regA "stumpf" ;
  full_A = regA "voll" ;
  heavy_A = mkA "schwer" "schwere" "schwerer" "schwerste" ;
  near_A = mk3A "nahe" "n�her" "n�chste" ;
  rotten_A = regA "verdorben" ;
  round_A = regA "rund" ;
  sharp_A = mk3A "scharf" "sch�rfer" "sch�rfste" ;
  smooth_A = regA "glatt" ;
  straight_A = regA "gerade" ;
  wet_A = regA "na�" ;
  wide_A = regA "breit" ;
  animal_N = reg2N "Tier" "Tiere" neuter ;
  ashes_N = mkN "Asche" ;
  back_N = reg2N "R�cken" "R�cken" masculine ;
  bark_N = mkN "Rinde" ;
  belly_N = reg2N "Bauch" "B�uche" masculine ;
  blood_N = mkN "Blut" "Blute" neuter ;
  bone_N = reg2N "Knochen" "Knochen" masculine ;
  breast_N = reg2N "Brust" "Br�ste" feminine ;
  cloud_N = mkN "Wolke" ;
  day_N = mkN "Tag" ;
  dust_N = reg2N "Staub" "St�ube" masculine ;
  ear_N = mkN "Ohr" "Ohren" neuter ;
  earth_N = mkN "Erde" ;
  egg_N = mkN "Ei" "Eier" neuter ;
  eye_N = mkN "Auge" "Augen" neuter;
  fat_N = mkN "Fett" "Fetter" neuter ;
  feather_N = mkN "Feder" "Federn" feminine ;
  fingernail_N = reg2N "Fingernagel" "Fingern�gel" masculine ;
  fire_N = mkN "Feuer" "Feuer" neuter ;
  flower_N = mkN "Blume" ;
  fog_N = mkN "Nebel" "Nebel" masculine ;
  foot_N = reg2N "Fu�" "F��e" masculine ;
  forest_N = reg2N "Wald" "W�lder" masculine ;
  grass_N = mkN "Gras" "Gr�ser" neuter ;
  guts_N = mkN "Eingeweide" ;
  hair_N = mkN "Haar" "Haare" neuter ;
  hand_N = mkN "Hand" "H�nde" feminine ;
  head_N = mkN "Kopf" "K�pfe" masculine ;
  heart_N = mkN "Herz" "Herzen" neuter ;
  horn_N = mkN "Horn" "H�rner" neuter ;
  husband_N = mkN "Ehemann" "Ehem�nner" masculine ;
  ice_N = mkN "Eis" "Eise" neuter ;
  knee_N = mkN "Knie" "Knien" neuter ;
  leaf_N = reg2N "Blatt" "Bl�tter" neuter ;
  leg_N = mkN "Bein" "Beine" neuter ;
  liver_N = mkN "Leber" "Lebern" feminine ;
  louse_N = reg2N "Laus" "L�use" feminine ;
  mouth_N = mkN "Mund" "M�nder" masculine ;
  name_N = mkN "Name" "Namen" "Namen" "Namens" "Namen" "Namen" masculine ;
  neck_N = mkN "Nacken" "Nacken" masculine ;
  night_N = reg2N "Nacht" "N�chte" feminine ;
  nose_N = mkN "Nase" ;
  person_N = mkN "Person" "Personen" feminine ;
  rain_N = mkN "Regen" ;
  road_N = mkN "Stra�e" ;
  root_N = mkN "Wurzel" "Wurzeln" feminine ;
  rope_N = mkN "Seil" "Seile" neuter ;
  salt_N = mkN "Salz" "Salze" neuter ;
  sand_N = mkN "Sand" ;
  seed_N = mkN "Same" ;
  skin_N = mkN "Haut" "H�ute" feminine ;
  sky_N = mkN "Himmel" ;  ---- pl
  smoke_N = mkN "Rauch" ;
  snow_N = mkN "Schnee" "Schneen" masculine ; ---- pl
  stick_N = mkN "Stock" "St�cke" masculine ;
  tail_N = mkN "Schwanz" "Schw�nze" masculine ;
  tongue_N = mkN "Zunge" ;
  tooth_N = mkN "Zahn" "Z�hne" masculine ;
  wife_N = mkN "Ehefrau" "Ehefrauen" feminine ;
  wind_N = mkN "Wind" ;
  wing_N = reg2N "Fl�gel" "Fl�gel" masculine ;
  worm_N = mkN "Wurm" "W�rmer" masculine ;
  year_N = mkN "Jahr" "Jahre" neuter ;
  blow_V = regV "blasen" ;
  breathe_V = regV "atmen" ;
  burn_V = regV "brennen" ;
  dig_V = regV "graben" ;
  fall_V = regV "fallen" ;
  float_V = regV "treiben" ;
  flow_V = regV "flie�en" ;
  fly_V = regV "fliegen" ;
  freeze_V = regV "frieren" ;
  give_V3 = accdatV3 (irregV "geben" "gibt" "gab" "g�be" "gegeben") ;
  laugh_V = regV "lachen" ;
  lie_V = regV "l�gen" ;
  play_V = regV "spielen" ;
  sew_V = regV "n�hen" ;
  sing_V = regV "singen" ;
  sit_V = irregV "sitzen" "sitzt" "sa�" "s��e" "gesessen" ;
  smell_V = regV "riechen" ;
  spit_V = regV "spucken" ;
  stand_V = regV "stehen" ;
  swell_V = prefixV "an" (regV "schwellen") ;
  swim_V = regV "schwimmen" ;
  think_V = regV "denken" ;
  turn_V = regV "drehen" ;
  vomit_V = regV "kotzen" ;

  bite_V2 = dirV2 (irregV "bei�en" "bei�t" "biss" "bisse" "gebissen") ;
  count_V2 = dirV2 (regV "z�hlen") ;
  cut_V2 = dirV2 (irregV "schneiden" "schneidet" "schnitt" "schnitte" "geschnitten") ;
  fear_V2 = dirV2 (regV "f�rchten") ;
  fight_V2 = dirV2 (regV "bek�mpfen") ;
  hit_V2 = dirV2 (irregV "schlagen" "schl�gt" "schlug" "schl�ge" "geschlagen") ;
  hold_V2 = dirV2 (irregV "halten" "h�lt" "hielt" "hielte" "gehalten") ;
  hunt_V2 = dirV2 (regV "jagen") ;
  kill_V2 = dirV2 (regV "t�ten") ;
  pull_V2 = dirV2 (irregV "ziehen" "zieht" "zog" "z�ge" "gezogen") ;
  push_V2 = dirV2 (irregV "schieben" "schiebt" "schub" "sch�be" "geschoben") ;
  rub_V2 = dirV2 (irregV "reiben" "reibt" "rieb" "riebe" "gerieben") ;
  scratch_V2 = dirV2 (regV "kratzen") ;
  split_V2 = dirV2 (prefixV "auf" (regV "teilen")) ;
  squeeze_V2 = dirV2 (regV "pressen") ;
  stab_V2 = dirV2 (irregV "stechen" "sticht" "stach" "st�che" "gestochen") ;
  suck_V2 = dirV2 (regV "saugen") ;
  throw_V2 = dirV2 (irregV "werfen" "wirft" "warf" "w�rfe" "geworfen") ;
  tie_V2 = dirV2 (irregV "binden" "bindet" "band" "b�nde" "gebunden") ;
  wash_V2 = dirV2 (irregV "waschen" "w�scht" "wusch" "w�sche" "gewaschen") ;
  wipe_V2 = dirV2 (regV "wischen") ;

  grammar_N = reg2N "Grammatik" "Grammatiken" feminine ;
  language_N = mkN "Sprache" ;
  rule_N = reg2N "Regel" "Regeln" feminine ;

    john_PN = regPN "Johann" ;
    question_N = mkN "Frage" ;
    ready_A = regA "fertig" ;
    reason_N = reg2N "Grund" "Gr�nde" masculine ;
    today_Adv = mkAdv "heute" ;
    uncertain_A = regA "unsicher" ;


} ;
