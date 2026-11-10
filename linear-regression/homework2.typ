#import "@preview/homiework:0.1.0": homework
#import "../template.typ": *
#import "../snippet.typ": *

#show: homework.with(
course: "Linear Regression",
  semester: "秋 2026",
  number: "1",
  author: "冯裕凯",
  date: datetime.today(),
)

= 2
A is singular $<=> det(Var X) = 0 <=> det(a Var X a^(tack.b)) = 0 <=> det(Var a^(tack.b) X) = 0 <=> a^(tack.b) X = b$

= 3
$ & EE X_(1)^(2) = 1+mu^(2) quad & EE X_1 X_2 = 0+mu^(2) \ & EE X_2 X_3 = (1)/4 + mu^(2) & EE X_3^(2) = 1+mu^(2) $ 
$EE[X_1^(2) + 2X_1 X_2 - 4 X_2 X_3 + X_3^(2)] = 1$ 

= 4
== i
$ Var(mat(1,-2,3) X) &= mat(1,-2,3) Var X mat(1;-2;3) \ &= mat(1,-2,3) mat(5,2,3;2,3,0;3,0,3) mat(1;-2;3) \ &= 54 \ $ 
== ii
$ Var Y &= mat(1,1,0;1,1,1) mat(5,2,3;2,3,0;3,0,3) mat(1,1;1,1;0,1) \ &= mat(12,15;15,21) \ $ 

= 5
$ Var X &= EE X X^(tack.b) - EE X EE X^(tack.b) \ &= EE [ EE X X^(tack.b)|Y ] - EE [ EE X|Y ] EE [ EE X^(tack.b)|Y ] \ &= EE [ EE X X^(tack.b)|Y ] - EE [ EE X|Y  EE X^(tack.b)|Y  ]+ EE [ EE X|Y EE X^(tack.b)|Y ] - EE [ EE X|Y ] EE [ EE X^(tack.b)|Y ] \ &= Var(EE X|Y)+EE Var(X|Y) \ $ 

= 6
let $Z = A Y$ 
$ EE X^(tack.b)A Y = EE X^(tack.b)Z &= Cov(X^(tack.b),Z^(tack.b)) + EE X^(tack.b) EE Z \ &= A Cov (Y,X) + EE X^(tack.b) A EE Y \ $
get trace, then 
$EE X^(tack.b)A Y = tr(A Cov(Y,X)) + EE X^(tack.b) A EE Y$

= 7
$ X = mat(1,0,0,#sym.dots.h,0;1,1,0,#sym.dots.h,0;#sym.dots.v,;1,1,1,#sym.dots.h,1)Y $
thus,
$ Var X &= mat(1,0,0,#sym.dots.h,0;1,1,0,#sym.dots.h,0;#sym.dots.v,;1,1,1,#sym.dots.h,1) id_(n times n) mat(1,0,0,#sym.dots.h,0;1,1,0,#sym.dots.h,0;#sym.dots.v,;1,1,1,#sym.dots.h,1)^(tack.b)\ &= mat(1,1,1,#sym.dots.h,1;1,2,2,#sym.dots.h,2;#sym.dots.v,;1,2,3,#sym.dots.h,n) \  $ 

= 9
$ Cov(X^(tack.b)A X,X^(tack.b)B X) &= EE[X^(tack.b) A X X^(tack.b) B X] - EE X^(tack.b)A X EE X^(tack.b)B X\ &= EE[tr(X^(tack.b) A X X^(tack.b) B X)]-sigma^(2)tr A sigma^(2) tr B \ &= tr(A EE[X^(tack.b)X B X X^(tack.b)]) - sigma^(4) tr A tr B \ &= tr(A sigma^(4)(tr B + 2B)) -sigma^(4) tr A tr B \ &= 2 sigma^(4) tr(A B) \ $ 
