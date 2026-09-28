#import "@preview/homiework:0.1.0": homework
#import "../template.typ": *

#show: homework.with(
course: "Linear Regression",
  semester: "秋 2026",
  number: "1",
  author: "冯裕凯",
  date: datetime.today(),
)

= 1
== iii
设矩阵 $A$ 有 $n$ 个实特征值，记作 $lambda_(1),lambda_(2),#sym.dots.h,lambda_n$，并且有 $n$ 个可以正交归一化的特征向量。

#proof[
  对 $n = dim V$ 作归纳。当 $n=0,1$ 时显然成立。

  假设当 $n=k$ 时结论成立。
  则当 $n=k+1$ 时，$A$ 有一个特征值 $lambda_(1)$ 和单位特征向量 $v_(1)$。
  将 $V$ 分解为 $ V = ip(v_(1)) plus.o ip(v_(1))^tack.b $
  由于 $dim ip(v_(1))^(tack.b) = k$，于是 $A$ 上还有 $n-1$ 个特征值和特征向量。
]

== iv 
对任意的对称矩阵，我们有正交阵$P$ 使得
$ A = P diag(lambda_1,lambda_2,#sym.dots.down,lambda_n) P^(tack.b) = P Lambda P^(tack.b) $ 
#proof[
  由上问，我们有正交阵满足
  $ A P = P Lambda $
  故,
  $ A = P Lambda P^(-1) = P Lambda P^tack.b $ 
]

== v
对任意的正整数$s$, $ A^(s) = P diag(lambda_1^(s),lambda_2^(s),#sym.dots.down,lambda_3^(s)) P^(tack.b) = P Lambda^(s) P^(tack.b) $ 
#proof[
  $ A^(s) = P Lambda P^(tack.b) P Lambda P^(tack.b) #sym.dots.h = P Lambda Lambda Lambda #sym.dots.h P^(tack.b) = P Lambda^(s) P^(tack.b) $ 
]

== vi
$A$ 是非奇异阵当且仅当$lambda_(i) != 0 forall i$,并且$A^(-1)$的特征值为$lambda_(i)^(-1)$
#proof[
  $ A"是非奇异阵"=> lambda_(i)!=0 $
  $ lambda_(i)!= 0 => det(A) = det(P Lambda P^(tack.b)) = det(Lambda) = product_(i=1)^(n) lambda_(i)!=0 =>A"非奇异"$ 

  容易验证$P Lambda^(-1) P^(tack.b)$是矩阵$A$ 的逆，结合矩阵逆的唯一性可得.
]

== vii
$bold(I) + c A$ 的特征值为$1+c lambda_(i)$ 
#proof[
  对于矩阵$A$ 的任意特征向量$v_(i)$ ，我们有
  $ (bold(I) + c A) v_(i) = v_(i) + c lambda_(i) v_(i) = (1+c lambda_(i)) v_(i) $ 
  故$v_(i)$也是$bold(I)+c A$ 的特征向量，对应的特征值为$1+c lambda_(i)$。

  由于任意性以及一个$n$ 阶方阵最多有$n$ 个特征值，因此上面即找出了这个矩阵的全部特征值。
]

== viii
半正定矩阵的特征值非负
#proof[
  由半正定性,$forall v in V, quad v^(tack.b)A v >= 0$,
  考虑矩阵$A$ 的所有特征向量，我们有$ v_(i)^(tack.b) A v_(i) = v_(i)^(tack.b) lambda_(i) v_(i) = lambda_(i) v_(i)^(tack.b) v_(i) >=0 => lambda_(i)>=0 $
]

= 2
假设$A$ 是对称矩阵，那么$ max_(x^(tack.b)x != 0) (x^(tack.b)A x)/(x^(tack.b)x) = lambda_("max")(A) quad "and" quad min_(x^(tack.b)x != 0) (x^(tack.b)A x)/(x^(tack.b)x) = lambda_("min")(A) $ 
#proof[
  $ dif (x^(tack.b)A x) &= (dif x)^(tack.b) A x + x^(tack.b)A dif x \ &= x^(tack.b)A^(tack.b) dif x + x^(tack.b) A dif x \ &= 2 x^(tack.b) A dif x \ &= (2 A x)^(tack.b) dif x \ $
  又因为$ max_(x^(tack.b)x != 0) (x^(tack.b)A x)/(x^(tack.b)x) = max_(x^(tack.b)x = 1) (x^(tack.b)A x)/(x^(tack.b)x) $ 
  因此考虑限制在流形$S^(n-1)$ 上，$T_(x)S^(n-1) = {v:x^(tack.b)v = 0}$.

  故在流形上$x^(tack.b)A x$的最大值满足
  $ dif (x^(tack.b)A x) (v) = 0 ,quad forall v in T_(x)S^(n-1) $
  即，
  $ (2A x)^(tack.b) v = 0,quad forall v in T_(x)S^(n-1) $ 
  故， $2A x = lambda x$,即取到极值点处为 $A$ 的特征向量
  带入的最大为$lambda_(max)$,最小为$lambda_(min)$
]

= 3
== 1)
对于任意的$n$ 维向量$bold(a)$, $(partial (bold(beta)^(tack.b)bold(a)))/(partial bold(beta)) = bold(a)$,并且对于任意的$m times n$ 矩阵有$(partial A bold(beta))/(partial bold(beta)^(tack.b)) = A$
#proof[
  由于 $bold(beta)^(tack.b)bold(alpha) = sum_(i=1)^(n) beta_(i)alpha_(i)$,
  故$ (partial (bold(beta)^(tack.b)bold(a)))/(partial bold(beta)) = mat(alpha_(1);alpha_(2);#sym.dots.v ; alpha_(n);) = bold(alpha) $
  对于矩阵，我们可以看作是由向量组成的。运用上面的结论既得。
]

== 2）
$(partial bold(beta)^(tack.b)A bold(beta))/(partial bold(beta)) = 2 A bold(beta)$ 
#proof[
  问题2已经做过了
]

= 4
求分块矩阵$mat(A,B;C,D)$的逆
#proof[
  考虑增广分块矩阵
  $ mat(A,B,I,0;C,D,0,I)->mat(I,A^(-1)B,A^(-1),0;C,D,0,I)->mat(I,A^(-1)B,A^(-1),0;0,D-C A^(-1) B,-C A^(-1),I) $ 
  记$E = D-C A^(-1) B$,则
  $ mat(I,A^(-1)B,A^(-1),0;0,E,-C A^(-1),I)->mat(I,A^(-1)B,A^(-1),0;0,I,-E^(-1)C A^(-1),E^(-1))->mat(I,0,A^(-1)+A^(-1)B E^(-1)C A^(-1),-A^(-1)B E^(-1);0,I,-E^(-1)C A^(-1),E^(-1)) $ 
  因此，逆为
  $ mat(A^(-1)+A^(-1)B E^(-1)C A^(-1),-A^(-1)B E^(-1);-E^(-1)C A^(-1),E^(-1)) $ 
] 

= 5
求矩阵$A-B C^(-1)D$的逆
#proof[
  先证明引理，若$I_(m)+A B$可逆，则$I_(n)+B A$ 也可逆且逆为$I_(n)-B (I_(m)+ A B)^(-1) A$ 
  考虑如下式子,
   $ A(I_(n)+B A) &= A + A B A \ &= (I_(m)+A B) A \ $ 
   则，$I_(n) + B A = A^(-1) (I_(m) + A B) A$ 可逆。且，
   $ I_(n) &= I_(n) + B A -B A \ &= I_(n) + B A - B (I_(m)+A B)^(-1) A (I_(n)+B A) \ &= [I_(n)-B(I_(m)+A B)^(-1)A](I_(n)+B A) \ $ 
   引理证毕。

   对于原命题，考虑这样的分解
   $ A - B C^(-1)D = A(I_(n)-A^(-1)B C^(-1)D) = A(I_(n)-( A^(-1)B ) ( C^(-1)D )) $ 
   根据引理，可以得到他的逆为
   $ (I_(n) + C^(-1)D (I_(m)-C^(-1)D A^(-1)B)^(-1) A^(-1)B)A^(-1) $ 
]
= 6
== 1)
给出矩阵$A$ 的广义逆矩阵不唯一的例子
#proof[
  考虑矩阵$mat(1,0;0,0)$,那么对于任意的 $mat(1,b;c,d)$,都是他的广义逆。
]
== 2)
写出广义逆的计算公式
#proof[
  MP广义逆即可
  设$T$ 有奇异值分解
   $ T = Q diag(sigma_1,sigma_2,#sym.dots.down,sigma_(r),"补0") P^(tack.b) $
   则他的MP广义逆为
   $ S = P diag(sigma_1^(-1),sigma_2^(-1),#sym.dots.down,sigma_(r)^(-1),"补0") Q^(tack.b) $ 
]

= 7
对于任意的矩阵$X_(n times p)$,证明
== 1)
矩阵$X(X^(tack.b)X)^(-)X^(tack.b)$与广义逆的选取无关
#proof[
  如果证明了2），则根据投影的唯一性即证。 
]
== 2）
证明$X(X^(tack.b)X)^(-)X^(tack.b)$是从$RR^(n)$ 到$cal(M)(X)$ 的投影矩阵
#proof[
  由于$X^(tack.b)X (X^(tack.b)X)^(-) X^(tack.b)X = X^(tack.b)X$
  因此
  $ (X(X^(tack.b)X)^(-)X^(tack.b))^(2) = X(X^(tack.b)X)^(-)X^(tack.b) $ 
  故是投影矩阵。

  考虑直和分解,
  $RR^(n) = cal(M)(X) plus.o cal(M)(X)^(tack.b)$
  由于$X (X^(tack.b)X)^(-) X^(tack.b)X = X$,故矩阵在$cal(M)(X)$的限制下是恒等映射。
  对于$forall v in cal(M)(X)^(tack.b)$,$T^(tack.b) v = 0$,故矩阵的核空间为$cal(M)(X)$.

  因此这个矩阵是$RR^(n)-> cal(M)(X)$ 的投影映射。
]

= 8
假设$X=(X_(1),X_2)$ 则$X (X^(tack.b)X)^(-) X^(tack.b)X_1 = X_1$且$X (X^(tack.b)X)^(-) X^(tack.b)X_1 = X_1$
#proof[
  由于$cal(M)(X_(1)) subset cal(M)(X) quad "and" quad cal(M)(X_2)subset cal(M)(X)$
  结合上问即得。
]

= 9
求矩阵$Sigma = (1-rho)I_(n)+rho bb(1)_(n)bb(1)_(n)^(tack.b)$的特征值和特征向量
#proof[
  根据前面的作业，特征值为$(1-rho) + rho"eigenvalues"(bb(1)_(n)bb(1)_(n)^(tack.b))=cases(
      1-rho+rho n,
      1-rho
  ) $

  $1-rho+rho n$的特征向量为 $bb(1)$

  $1-rho$的特征向量构成的空间为 $bb(1)^(tack.b)$
]

= 10
在$RR^(n)$的超平面是这样的点集满足方程$H_(A,bold(b)) = {bold(x):A bold(x) = bold(b)}$ 
== i)
固定点$bold(x)_0 in H_(A,bold(b))$,证明$H_(A,bold(b)) = {bold(x):bold(x)-bold(x)_(0) perp cal(M)(A^(tack.b))}$
#proof[
  $ bold(x) - bold(x)_(0) perp cal(M)(A^(tack.b)) <=> A(bold(x)-bold(x)_(0)) = 0 <=> A bold(x) = A bold(x)_(0) = 0 <=> x in H_(A,bold(b)) $ 
]
== ii)
假设矩阵$A$ 满秩，计算欧几里得距离$d(x,H_(A,bold(b)))$ 
#proof[
  $ d(bold(x),H_(A,bold(b))) = inf_(bold(y) in H_(A,bold(b))) d(bold(x),bold(y)) = inf_(bold(y) in H_(A,bold(b))) || bold(x)-bold(y) || $ 
  考虑将$bold(x)-bold(y)$ 分解为$bold(x)-bold(y) = bold(v) + bold(v)^(perp),bold(v) in ker(A),bold(v)^(perp) in ker(A)^(perp) = cal(M)(A^(tack.b))$ 
  且$A(bold(x)-bold(y)) = A bold(v)^(perp) = A bold(x)-bold(b)$,则，
  $ inf_(bold(y) in H_(A,bold(b))) || bold(x)-bold(y) ||&= inf_(bold(v)) || bold(v)+bold(v)^(perp) || \ &= ||bold(v)^(perp)|| $
  由于$bold(v)^(perp) in cal(M)(A^(tack.b))$,故,$bold(v)^(perp) = A^(tack.b) bold(c)$
  从而有$A A^(tack.b) bold(c) = A bold(x)- bold(b)$,即$bold(c) = (A A^(tack.b))^(-1)(A bold(x)-bold(b))$
   进而$bold(v)^(perp) = A^(tack.b) bold(c) = A^(tack.b) (A A^(tack.b))^(-1)(A bold(x)-bold(b))$ 
  因此,
  $ ||bold(v)^(perp) || &= sqrt( ( A^(tack.b) (A A^(tack.b))^(-1)(A bold(x)-bold(b)) )^(tack.b)(A^(tack.b) (A A^(tack.b))^(-1)(A bold(x)-bold(b))) ) \ &= sqrt((A bold(x) - bold(b))^(tack.b)(A A^(tack.b))^(-1) (A bold(x) - bold(b))) \ $ 
]

= 11
证明：$det(A,B;C,D) = det(A)det(D-C A^(-1) B)$
#proof[
  $ det(A,B;C,D) &= det(A,B;0,D-C A^(-1)B) \ &= det(A)det(D-C A^(-1)B) \ $ 
]
= 12
构造反例使得存在正交阵$mat(P,Q)$ 让$P^(tack.b)Sigma P =lambda_(r)$ 且$Q^(tack.b)Sigma Q = 0$而$Sigma$不是半正定的
#proof[
   $ Sigma=mat(1,2;2,0),mat(P,Q) = mat(1,0;0,0) $ 
] 
= 13
$A,B$ 是半正定矩阵使得在Lowner order下$A<=B$ 。
== i
证明$A B^(-1) A <= A$
#proof[
  在空间$im(A),im(B)$ 下$A,B$ 可逆，由于$ A<=B <=> bold(x)^(tack.b)A bold(x) <= bold(x)^(tack.b) B bold(x) <=> ker(B) subset ker(A) <=> im(A) subset im(B) $
  
  当$bold(x) in ker(A)$时，$0=bold(x)^(tack.b) A B^(-) A bold(x) <= bold(x)^(tack.b)A bold(x) =0$ 成立
  当$bold(x) in.not ker(A)$时，$A,B$都可逆，因此广义逆就是限制在像空间上的逆，因此有
   $ bold(x)^(tack.b) A B^(-1) A bold(x) = (A bold(x))^(tack.b) B^(-1) (A bold(x)) = bold(y)^(tack.b) B^(-1) bold(y) <=bold(y)^(tack.b) A^(-1) bold(y) = bold(y)^(tack.b) A^(-1) A A^(-1) bold(y) = bold(x)^(tack.b) A bold(x) $
]
== ii
说明上述结论与广义逆的选取无关
#proof[
  根据上面的证明，该结论的成立只跟矩阵在像空间上的行为相关，而广义逆在像空间上唯一，因此与选取无关。
]
= 14
$A$ 是幂等矩阵，证明$tr(A) = "rank"(A)$
#proof[
  由于$A^(2) - A =0$因此$x^(2)-x | "Min"_(T)$,故$A$ 的特征值只能为0或1.
  考虑特征分解即得
  $ tr(A) = tr(mat(I_(r),0;0,0)) = r = "rank"(A) $ 
]
= 16
说明半正定矩阵$A,B$， $cal(M)(A) subset cal(M)(B)$,而不成立$A <= B$ 
#proof[
  取$A = mat(1,0;0,0)$, $B = mat(1,2;2,1)$
]
