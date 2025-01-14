--1 Verb Phrases in Finnish

concrete VerbFin of Verb = CatFin ** open Prelude, ResFin, StemFin in {

  flags optimize=all_subs ;

  lin
    UseV = predSV ;

    SlashV2a v = predSV v ** {c2 = v.c2} ;

    Slash2V3 v np = 
      insertObj 
        (\\fin,b,_ => appCompl fin b v.c2 np) (predSV v) ** {c2 = v.c3} ;
    Slash3V3 v np = 
      insertObj 
        (\\fin,b,_ => appCompl fin b v.c3 np) (predSV v) ** {c2 = v.c2} ;

    ComplVV v vp = 
      insertObj 
        (\\_,b,a => infVP v.sc b a vp v.vi) 
        (predSV {s = v.s ; 
                sc = case vp.sc of {
                  NPCase Nom => v.sc ;   -- minun t�ytyy pest� auto
                  c => c                 -- minulla t�ytyy olla auto
                  } ;
                h = v.h ; p = v.p
               }
         ) ;

    ComplVS v s  = insertExtrapos ("," ++ etta_Conj ++ s.s) (predSV v) ;
    ComplVQ v q  = insertExtrapos ("," ++ q.s) (predSV v) ;
    ComplVA v ap = 
      insertObj 
        (\\_,b,agr => 
           let n = (complNumAgr agr) in
           ap.s ! False ! (NCase n (npform2case n v.c2.c))) --- v.cs.s ignored
        (predSV v) ;

    SlashV2S v s = 
      insertExtrapos ("," ++ etta_Conj ++ s.s) (predSV v) ** {c2 = v.c2} ;
    SlashV2Q v q = 
      insertExtrapos ("," ++ q.s) (predSV v) ** {c2 = v.c2} ;
    SlashV2V v vp = 
      insertObj (\\_,b,a => infVP v.sc b a vp v.vi) (predSV v) ** {c2 = v.c2} ;
    SlashV2A v ap = 
      insertObj 
        (\\fin,b,_ => 
          ap.s ! False ! (NCase Sg (npform2case Sg v.c3.c))) ----agr to obj
        (predSV v) ** {c2 = v.c2} ;

    ComplSlash vp np = insertObjPre np.isNeg (\fin,b,_ -> appCompl fin b vp.c2 np) vp ;

    UseComp comp = 
      insertObj (\\_,_ => comp.s) (predV (verbOlla ** {sc = NPCase Nom ; h = Back ; p = []})) ;

    UseCopula = predV (verbOlla ** {sc = NPCase Nom ; h = Back ; p = []}) ;

    SlashVV v vp = 
      insertObj 
        (\\_,b,a => infVP v.sc b a vp v.vi) 
        (predSV {s = v.s ; 
                sc = case vp.sc of {
                  NPCase Nom => v.sc ;   -- minun t�ytyy pest� auto
                  c => c                 -- minulla t�ytyy olla auto
                  } ;
                h = v.h ; p = v.p
               }
         ) ** {c2 = vp.c2} ; ---- correct ??

    SlashV2VNP = StemFin.slashV2VNP ; ---- compilation to pgf takes too long 6/8/2013 hence a simplified version in stemmed/

    AdvVP vp adv = insertAdv (\\_ => adv.s) vp ;

    AdVVP adv vp = insertAdv (\\_ => adv.s) vp ;

    AdvVPSlash vps adv = insertAdv (\\_ => adv.s) vps ** {c2 = vps.c2} ;

    AdVVPSlash adv vps = insertAdv (\\_ => adv.s) vps ** {c2 = vps.c2} ;

    ReflVP v = insertObjPre False (\fin,b,agr -> appCompl fin b v.c2 (reflPron agr)) v ;

    PassV2 v = let vp = predSV v in {
      s = \\vif,ant,pol,agr => case vif of {
        VIFin t  => vp.s ! VIPass t ! ant ! pol ! agr ;
        _ => vp.s ! vif ! ant ! pol ! agr 
        } ;
      s2 = \\_,_,_ => [] ;
      adv = \\_ => [] ;
      ext = [] ;
      h = vp.h ;
      isNeg = False ;
      sc = v.c2.c ; -- minut valitaan ; minua rakastetaan ; minulle kuiskataan 
      } ;           ---- talon valitaan: should be marked like inf.

----b    UseVS, UseVQ = \v -> v ** {c2 = {s = [] ; c = NPAcc ; isPre = True}} ;

    CompAP ap = {
      s = \\agr => 
          let
            n = complNumAgr agr ;
            c = case n of {
              Sg => Nom ;  -- min� olen iso ; te olette iso
              Pl => Part   -- me olemme isoja ; te olette isoja
              }            --- definiteness of NP ?
          in ap.s ! False ! (NCase n c)
      } ;
    CompCN cn = {
      s = \\agr => 
          let
            n = complNumAgr agr ;
            c = case n of {
              Sg => Nom ;  -- min� olen iso ; te olette iso
              Pl => Part   -- me olemme isoja ; te olette isoja
              }            --- definiteness of NP ?
          in cn.s ! (NCase n c)
      } ;
    CompNP np = {s = \\_ => np.s ! NPCase Nom} ;
    CompAdv a = {s = \\_ => a.s} ;

    VPSlashPrep vp prep = vp ** {c2 = prep} ;
}


--2 The object case
--
-- The rules involved are ComplV2 and ComplVV above.
-- The work is done jointly in ResFin.infVP and appCompl. 
-- Cases to test: l -table (to see negated forms)
--```
--   minun t�ytyy ostaa auto
--   PredVP (UsePron i_Pron) (ComplVV must_VV 
--     (ComplV2 buy_V2 (DetCN (DetSg (SgQuant DefArt) NoOrd) (UseN car_N))))
--   min� tahdon ostaa auton
--   PredVP (UsePron i_Pron) (ComplVV want_VV 
--     (ComplV2 buy_V2 (DetCN (DetSg (SgQuant DefArt) NoOrd) (UseN car_N))))
--   minulla t�ytyy olla auto
--   PredVP (UsePron i_Pron) (ComplVV must_VV 
--     (ComplV2 have_V2 (DetCN (DetSg (SgQuant DefArt) NoOrd) (UseN car_N))))
--```
-- Unfortunately, there is no nice way to say "I want to have a car".
-- (Other than the paraphrases "I want a car" or "I want to own a car".)
