(define (problem pfile18)
 (:domain domain-tms-2-3-light)
 (:objects 
 kiln0 - kiln8
 kiln0 - kiln20
 pone0 pone1 pone2 pone3 pone4 pone5 pone6 pone7 pone8 pone9 pone10 pone11 pone12 pone13 pone14 pone15 pone16 pone17 pone18 pone19 pone20 pone21 pone22 pone23 pone24 pone25 pone26 pone27 pone28 pone29 pone30 pone31 pone32 pone33 pone34 pone35 pone36 pone37 pone38 pone39 pone40 pone41 pone42 pone43 pone44 pone45 - piecetype1
 ptwo0 ptwo1 ptwo2 ptwo3 ptwo4 ptwo5 ptwo6 ptwo7 ptwo8 ptwo9 ptwo10 ptwo11 ptwo12 ptwo13 ptwo14 ptwo15 ptwo16 ptwo17 ptwo18 ptwo19 ptwo20 ptwo21 ptwo22 ptwo23 ptwo24 ptwo25 ptwo26 ptwo27 ptwo28 ptwo29 ptwo30 ptwo31 ptwo32 ptwo33 ptwo34 ptwo35 ptwo36 ptwo37 ptwo38 ptwo39 ptwo40 ptwo41 ptwo42 ptwo43 ptwo44 ptwo45 ptwo46 ptwo47 ptwo48 ptwo49 ptwo50 ptwo51 ptwo52 ptwo53 ptwo54 ptwo55 ptwo56 ptwo57 ptwo58 ptwo59 ptwo60 ptwo61 ptwo62 ptwo63 ptwo64 ptwo65 ptwo66 ptwo67 ptwo68 - piecetype2
 pthree0 pthree1 pthree2 pthree3 pthree4 pthree5 pthree6 pthree7 pthree8 pthree9 pthree10 pthree11 pthree12 pthree13 pthree14 pthree15 pthree16 pthree17 pthree18 pthree19 pthree20 pthree21 pthree22 pthree23 pthree24 pthree25 pthree26 pthree27 pthree28 pthree29 pthree30 pthree31 pthree32 pthree33 pthree34 pthree35 pthree36 pthree37 pthree38 pthree39 pthree40 pthree41 pthree42 pthree43 pthree44 pthree45 pthree46 pthree47 pthree48 pthree49 pthree50 pthree51 pthree52 pthree53 pthree54 pthree55 pthree56 pthree57 pthree58 pthree59 pthree60 pthree61 pthree62 pthree63 pthree64 pthree65 pthree66 pthree67 pthree68 pthree69 pthree70 pthree71 pthree72 pthree73 pthree74 pthree75 pthree76 pthree77 pthree78 pthree79 pthree80 pthree81 pthree82 pthree83 pthree84 pthree85 pthree86 pthree87 pthree88 pthree89 pthree90 pthree91 pthree92 pthree93 pthree94 pthree95 pthree96 pthree97 pthree98 pthree99 pthree100 pthree101 pthree102 pthree103 pthree104 pthree105 pthree106 pthree107 pthree108 pthree109 pthree110 pthree111 pthree112 pthree113 pthree114 - piecetype3
)
 (:init 
  (energy)
)
 (:goal
  (and
     (baked-structure pone45 pthree38)
     (baked-structure ptwo29 pthree68)
     (baked-structure pthree94 pone23)
     (baked-structure pthree50 pthree10)
     (baked-structure pone35 pthree92)
     (baked-structure pone39 ptwo38)
     (baked-structure pthree44 pthree85)
     (baked-structure pthree62 pthree23)
     (baked-structure pthree99 pthree75)
     (baked-structure ptwo25 ptwo22)
     (baked-structure pone30 pthree37)
     (baked-structure pone20 pthree0)
     (baked-structure pone32 pthree13)
     (baked-structure ptwo7 pthree107)
     (baked-structure pthree15 ptwo42)
     (baked-structure pone6 pthree53)
     (baked-structure ptwo58 pthree72)
     (baked-structure ptwo44 pone18)
     (baked-structure pthree66 pthree27)
     (baked-structure pthree86 pthree25)
     (baked-structure pthree74 ptwo20)
     (baked-structure ptwo33 ptwo1)
     (baked-structure pone37 ptwo5)
     (baked-structure ptwo2 ptwo10)
     (baked-structure ptwo62 pone27)
     (baked-structure pthree103 pthree18)
     (baked-structure pthree42 ptwo0)
     (baked-structure ptwo18 pone1)
     (baked-structure ptwo39 pthree113)
     (baked-structure pthree100 pthree81)
     (baked-structure pthree55 pone33)
     (baked-structure pone5 pone2)
     (baked-structure pthree17 pthree102)
     (baked-structure pthree5 ptwo30)
     (baked-structure pone9 pthree61)
     (baked-structure ptwo53 ptwo68)
     (baked-structure ptwo55 pthree90)
     (baked-structure pone12 ptwo34)
     (baked-structure pthree48 ptwo57)
     (baked-structure ptwo61 ptwo41)
     (baked-structure ptwo27 ptwo36)
     (baked-structure pthree52 ptwo50)
     (baked-structure pthree114 ptwo46)
     (baked-structure pthree19 pone36)
     (baked-structure ptwo52 pone3)
     (baked-structure pthree73 pone43)
     (baked-structure pthree47 ptwo17)
     (baked-structure pthree21 pone38)
     (baked-structure pone42 pone29)
     (baked-structure pthree110 ptwo47)
     (baked-structure ptwo21 ptwo66)
     (baked-structure pthree56 pone24)
     (baked-structure pthree39 pthree101)
     (baked-structure pone14 ptwo65)
     (baked-structure ptwo32 pone11)
     (baked-structure pthree77 pone40)
     (baked-structure ptwo9 pthree97)
     (baked-structure pthree30 pone22)
     (baked-structure ptwo59 ptwo43)
     (baked-structure ptwo13 pone16)
     (baked-structure pthree12 pthree51)
     (baked-structure pthree69 ptwo45)
     (baked-structure pthree96 pthree9)
     (baked-structure pthree83 pthree57)
     (baked-structure pthree31 pthree76)
     (baked-structure pthree82 ptwo60)
     (baked-structure ptwo26 pthree35)
     (baked-structure pone15 pthree11)
     (baked-structure ptwo40 pthree45)
     (baked-structure pthree88 ptwo8)
     (baked-structure pthree41 pthree87)
     (baked-structure ptwo63 pthree95)
     (baked-structure ptwo37 pthree36)
     (baked-structure pthree24 pthree54)
     (baked-structure pthree6 pthree28)
     (baked-structure ptwo14 pthree70)
     (baked-structure ptwo15 pone26)
     (baked-structure pthree78 pone17)
     (baked-structure pthree65 pthree3)
     (baked-structure pthree2 pthree80)
     (baked-structure ptwo49 pthree14)
     (baked-structure pone4 pone19)
     (baked-structure ptwo28 pthree60)
     (baked-structure ptwo64 pone25)
     (baked-structure pthree20 ptwo19)
     (baked-structure ptwo12 pthree33)
     (baked-structure pthree40 pthree93)
     (baked-structure pone8 ptwo48)
     (baked-structure pone7 pone13)
     (baked-structure ptwo67 pthree91)
     (baked-structure ptwo16 pone34)
     (baked-structure pone0 pthree7)
     (baked-structure pthree46 pthree58)
     (baked-structure pthree59 pone10)
     (baked-structure pthree98 pone28)
     (baked-structure pone31 ptwo3)
     (baked-structure ptwo51 ptwo11)
     (baked-structure ptwo35 pthree34)
     (baked-structure pthree8 pone44)
     (baked-structure pthree71 pthree108)
     (baked-structure pthree43 ptwo54)
     (baked-structure pthree109 pone41)
     (baked-structure pthree79 pthree104)
     (baked-structure pone21 pthree16)
     (baked-structure pthree49 ptwo24)
     (baked-structure pthree63 pthree106)
     (baked-structure pthree4 ptwo56)
     (baked-structure ptwo23 pthree105)
     (baked-structure pthree1 pthree67)
     (baked-structure ptwo31 pthree32)
     (baked-structure pthree22 pthree64)
     (baked-structure pthree89 pthree84)
     (baked-structure ptwo6 pthree29)
     (baked-structure pthree112 pthree111)
     (baked-structure pthree26 ptwo4)
))
 (:metric minimize (total-time))
)
