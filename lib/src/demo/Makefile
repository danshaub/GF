compile = runghc Compile 

all: src compdemo linkdemo

src:
	runghc MkMini.hs

compdemo:
	$(compile) Afr Bul Cat Chi Dan Dut Eng Fin Fre Ger Gre Hin Ita Jpn Lav Mlt Nep Nor Pes Pnb Pol Ron Rus Snd Spa Swe Tha Urd

linkdemo:
	$(compile) -link Afr Bul Cat Chi Dan Dut Eng Fin Fre Ger Gre Hin Ita Jpn Lav Mlt Nep Nor Pes Pnb Pol Ron Rus Snd Spa Swe Tha Urd
