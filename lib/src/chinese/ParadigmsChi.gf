resource ParadigmsChi = open CatChi, ResChi, Prelude in {

flags coding = utf8 ;

flags coding=utf8;
oper
  mkN = overload {
    mkN : (man : Str) -> N 
      = \n -> lin N (regNoun n ge_s) ;  
    mkN : (man : Str) -> Str -> N 
      = \n,c -> lin N (regNoun n c)
    } ;  

  mkN2 = overload {
    mkN2 : Str -> N2
      = \n -> lin N2 (regNoun n ge_s ** {c2 = emptyPrep}) ; ---- possessive ?
----    mkN2 : N -> Str -> N2
----      = \n,p -> lin N2 (n ** {c2 = mkPrep p}) ;
    } ;

  mkN3 : N -> Prep -> Prep -> N3
      = \n,p,q -> lin N3 (n ** {c2 = p ; c3 = q}) ;

      
  mkPN : (john : Str) -> PN
     = \s -> lin PN {s = word s} ; 

  mkA = overload {
    mkA : (small : Str) -> A 
      = \a -> lin A (simpleAdj a) ;
    mkA : (small : Str) -> Bool -> A 
      = \a,b -> lin A (mkAdj a b) ;
    } ; 

  mkA2 : Str -> A2 = \a -> lin A2 (simpleAdj a ** {c2 = emptyPrep}) ;

  mkV = overload {      
    mkV : (walk : Str) -> V 
      = \walk -> lin V (regVerb walk) ;
    mkV : (arrive : Str) -> Str -> Str -> Str -> Str -> V
      = \arrive,pp,ds,dp,ep -> lin V (mkVerb arrive pp ds dp ep neg_s) ;
    mkV : (arrive : Str) -> Str -> Str -> Str -> Str -> Str -> V
      = \arrive,pp,ds,dp,ep,neg -> lin V (mkVerb arrive pp ds dp ep neg) ;
      } ;      

  mkV2 = overload {
    mkV2 : Str -> V2 
      = \s -> case s of {
         v + "+" + p => lin V2 (regVerb v ** {c2 = emptyPrep ; hasPrep = False ; part = word p}) ;
         v + "*" + p => lin V2 (regVerb v ** {c2 = ResChi.mkPreposition p [] ; hasPrep = True ; part = []}) ;
         _ => lin V2 (regVerb s ** {c2 = emptyPrep ; hasPrep = False ; part = []})
         } ;
    mkV2 : V -> V2 
      = \v -> lin V2 (v ** {c2 = emptyPrep ; hasPrep = False ; part = []}) ;
    mkV2 : V -> Prep -> V2 
      = \v,p -> lin V2 (v ** {c2 = p ; hasPrep = True ; part = []}) ;
    } ;

  mkV3 = overload {
    mkV3 : Str -> V3
      = \s -> lin V3 (regVerb s ** {c2,c3 = emptyPrep ; hasPrep = False ; part = []}) ;
    mkV3 : V -> V3
      = \s -> lin V3 (s ** {c2,c3 = emptyPrep ; hasPrep = False ; part = []}) ;
    mkV3 : V -> Prep -> Prep -> V3
      = \v,p,q -> lin V3 (v ** {c2 = p ; c3 = q ; hasPrep = True ; part = []}) ;
    } ;

  mkVV : Str -> VV = ----
    \v -> lin VV (regVerb v) ;

  mkVQ : V -> VQ =
    \v -> lin VQ v ;

  mkVS = overload {
  mkVS : V -> VS =
    \v -> lin VS v ;
  mkVS : Str -> VS =
    \v -> lin VS (regVerb v) ;
  } ;

  mkVA = overload {
  mkVA : Str -> VA =
    \v -> lin VA (regVerb v) ;
  mkVA : V -> VA =
    \v -> lin VA v ;
  } ;

  mkV2Q : V -> V2Q =
    \v -> lin V2Q (v ** {c2 = emptyPrep ; hasPrep = False ; part = []}) ; 
----  mkV2Q : V -> Str -> V2Q =
----    \v,p -> lin V2Q (v ** {c2 = mkPrep p}) ; 

  mkV2V= overload {
    mkV2V : Str -> V2V = 
    \s -> lin V2V (regVerb s ** {c2 = emptyPrep ; c3 = emptyPrep ; hasPrep = False ; part = []}) ; 

    mkV2V : V -> V2V =
    \v -> lin V2V (v ** {c2 = emptyPrep ; c3 = emptyPrep ; hasPrep = False ; part = []}) ; 
----  mkV2V : V -> Str -> Str -> V2V =
----    \v,p,q -> lin V2V (v ** {c2 = mkPrep p ; c3 = mkPrep q}) ; 
    } ;

  mkV2S = overload {
  mkV2S : Str -> V2S =
    \s -> lin V2S (regVerb s ** {c2 = emptyPrep ; hasPrep = False ; part = []}) ; 
  mkV2S : V -> V2S =
    \v -> lin V2S (v ** {c2 = emptyPrep ; hasPrep = False ; part = []}) ; 
----  mkV2S : V -> Str -> V2S =
----    \v,p -> lin V2S (v ** {c2 = mkPrep p}) ; 
  } ;

  mkV2A = overload {
    mkV2A : Str -> V2A
      = \s -> lin V2A (regVerb s ** {c2 = emptyPrep ; c3 = emptyPrep ; hasPrep = False ; part = []}) ; 
    mkV2A : V -> V2A
      = \v -> lin V2A (v ** {c2 = emptyPrep ; c3 = emptyPrep ; hasPrep = False ; part = []}) ; 
    } ;
----  mkV2A : V -> Str -> Str -> V2A
----    = \v,p,q -> lin V2A (v ** {c2 = mkPrep p ; c3 = mkPrep q}) ; 

  mkAdv = overload {
    mkAdv : Str -> Adv 
      = \s -> lin Adv {s = word s ; advType = ATPlace} ;
    mkAdv : Str -> AdvType -> Adv 
      = \s,at -> lin Adv {s = word s ; advType = at} ;
    } ;

  AdvType : Type
   = ResChi.AdvType ;
  placeAdvType : AdvType
   = ATPlace ;
  timeAdvType : AdvType
   = ATTime ;
  mannerAdvType : AdvType
   = ATManner ;
    
  mkPrep = overload { -- first pre part, then optional post part
    mkPrep : Str -> Prep 
     = \s -> lin Prep (ResChi.mkPreposition s []) ;
    mkPrep : Str -> Str -> Prep 
     = \s,t -> lin Prep (ResChi.mkPreposition s t) ;
    } ;

  mkInterj : Str -> Interj 
    = \s -> lin Interj {s = word s} ;

  emptyPrep : Preposition = mkPrep [] ;

  mkpNP : Str -> CatChi.NP 
    = \s -> lin NP {s = word s} ;
  mkAdV : Str -> AdV 
    = \s -> lin AdV {s = word s} ;
  mkAdN : Str -> AdN 
    = \s -> lin AdN {s = word s} ;
  mkSubj : Str -> Subj 
    = \s -> lin Subj (ResChi.mkSubj s []) ;
  mkConj : Str -> Conj 
    = \s -> lin Conj {s = \\_ => mkConjForm s} ;
  mkpDet : Str -> Det 
    = \s -> lin Det {s = word s ; detType = DTFull Sg} ;
  mkQuant : Str -> Quant 
    = \s -> lin Quant {s,pl = s ; detType = DTFull Sg} ;
  mkAdA : Str -> AdA 
    = \s -> lin AdA {s = word s} ;
  mkNum : Str -> Num 
    = \s -> lin Num {s = word s ; numType = NTFull} ;
  mkPredet : Str -> Predet 
    = \s -> lin Predet {s = word s} ;
  mkIDet : Str -> IDet 
    = \s -> lin IDet {s = word s} ;
  mkPConj : Str -> PConj 
    = \s -> lin PConj {s = word s} ;
  mkRP : Str -> RP 
    = \s -> lin RP {s = word s} ;


--. auxiliary

oper
  mkConjForm : Str -> {s1,s2 : Str} = \s -> {s1 = [] ; s2 = word s} ;
  mkConjForm2 : Str -> Str -> {s1,s2 : Str} = \s1,s2 -> {s1 = word s1 ; s2 = word s2} ; --obvious slip of a pen  chenpeng 11.19
 -- manually by AR, Jolene

}

