concrete ExtraBul of ExtraBulAbs = CatBul ** 
  open ResBul, MorphoFunsBul, Coordination, Prelude, Predef in {
  flags coding=cp1251 ;


  lin
    PossIndefPron p = {
      s = \\_,aform => p.gen ! (indefAForm aform) ;
      nonEmpty = True;
      spec = Indef
      } ;
      
    ReflQuant = {
      s = \\_,aform => reflPron ! aform ;
      nonEmpty = True;
      spec = Indef
    } ;

    ReflIndefQuant = {
      s = \\_,aform => reflPron ! (indefAForm aform) ;
      nonEmpty = True;
      spec = Indef
    } ;

    EmptyRelSlash slash = {
      s = \\t,a,p,agr => slash.c2.s ++ whichRP ! agr.gn ++ slash.s ! agr ! t ! a ! p ! Main ;
      role = RObj Acc
      } ;

    i8fem_Pron  = mkPron "��" "���" "��" "���" "���" "����" "���" "�����" "���" "�����" "���" "�����" (GSg Fem)  P1 ;
    i8neut_Pron = mkPron "��" "���" "��" "���" "���" "����" "���" "�����" "���" "�����" "���" "�����" (GSg Neut) P1 ;
    
    whatSg8fem_IP  = mkIP "�����" "�����" (GSg Fem) ;
    whatSg8neut_IP = mkIP "�����" "�����" (GSg Neut) ;

    whoSg8fem_IP  = mkIP "���" "����" (GSg Fem) ;
    whoSg8neut_IP = mkIP "���" "����" (GSg Neut) ;
    
    youSg8fem_Pron  = mkPron "��" "���" "��" "����" "����" "�����" "����" "������" "����" "������" "����" "������" (GSg Fem) P2 ;
    youSg8neut_Pron = mkPron "��" "���" "��" "����" "����" "�����" "����" "������" "����" "������" "����" "������" (GSg Neut) P2 ;

    onePl_Num = {s = table {
                       CFMasc Indef _ | CFFem Indef | CFNeut Indef            => "����" ;
                       CFMasc Def _ | CFMascDefNom _ | CFFem Def | CFNeut Def => "������"
                     } ;
                 nn = NCountable;
                 nonEmpty = True
                } ;

    UttImpSg8fem  pol imp = {s = pol.s ++ imp.s ! pol.p ! GSg Fem} ;
    UttImpSg8neut pol imp = {s = pol.s ++ imp.s ! pol.p ! GSg Fem} ;
    
    IAdvAdv adv = {s = \\qf => (mkIAdv "�����").s ! qf ++ adv.s} ;

  oper
    reflPron : AForm => Str =
      table {
        ASg Masc Indef => "����" ;
        ASg Masc Def   => "����" ;
        ASgMascDefNom  => "�����" ;
        ASg Fem  Indef => "����" ;
        ASg Fem  Def   => "������" ;
        ASg Neut Indef => "����" ;
        ASg Neut Def   => "������" ;
        APl Indef      => "����" ;
        APl Def        => "������"
      } ;

  lincat
    VPI   = {s : Agr => Str} ;
    [VPI] = {s : Bool => Ints 2 => Agr => Str} ;

  lin
    BaseVPI x y = {s  = \\d,t,a=>x.s!a++linCoord!t++y.s!a} ;
    ConsVPI x xs = {s  = \\d,t,a=>x.s!a++(linCoordSep comma)!d!t++xs.s!d!t!a} ;

    MkVPI vp = {s = daComplex Simul Pos vp ! Perf} ;
    ConjVPI conj vpi = {
      s = \\a => conj.s++(linCoordSep [])!conj.distr!conj.conj++vpi.s!conj.distr!conj.conj!a;
      } ;
    ComplVPIVV vv vpi = 
      insertObj (\\a => vpi.s ! a) (predV vv) ;

  lincat
    VPS   = {s : Agr => Str} ;
    [VPS] = {s : Bool => Ints 2 => Agr => Str} ;

  lin
    BaseVPS x y = {s  = \\d,t,a=>x.s!a++linCoord!t++y.s!a} ;
    ConsVPS x xs = {s  = \\d,t,a=>x.s!a++(linCoordSep comma)!d!t++xs.s!d!t!a} ;

    PredVPS np vps = {s = np.s ! RSubj ++ vps.s ! np.a} ;

    MkVPS t p vp = {
      s = \\a => 
            let verb  = vpTenses vp ! t.t ! t.a ! p.p ! a ! False ! Perf ;
                compl = vp.compl ! a
          in t.s ++ p.s ++ verb ++ compl
      } ;
      
    ConjVPS conj vps = {
      s = \\a => conj.s++(linCoordSep [])!conj.distr!conj.conj++vps.s!conj.distr!conj.conj!a;
      } ;

    PassVPSlash vp = insertObj (\\a => vp.s ! Perf ! VPassive (aform a.gn Indef (RObj Acc)) ++
                                       vp.compl1 ! a ++ vp.compl2 ! a) (predV verbBe) ;

} 
