#import "../template.typ": *

#show: notes.with(title: "随机抽样课堂笔记")
#let MSE = "MSE"
#let Var = "Var"
#let Cov = "Cov"

= 简单随机抽样
== 定义
#definition[
  从$N$ 个单元的总体中抽取$n$ 个单元，共有$C_(N)^(n)$ 种可能的样本，若每一个样本被抽中的概率相等，则称这种抽样方法为简单随机抽样(SRS,simple random sampling)
]
#proposition[
  从总体中逐个不放回的抽取单元，每次从尚未入样的单元中等概率的抽取一个，直到抽取$n$ 个样本为止。这样的抽样是简单随机抽样。
]
我们可以分出两类简单随机抽样
+ *有放回随机抽样* ： 每次抽取的编号服从${1,2,3,#sym.dots.h,N}$ 的均匀分布\
  他的特点如下：
  - 总体中的一个样本可能被多次选中
  - 重复的单元没有提供额外的信息，浪费了抽样的机会
+ *不放回的简单随机抽样* ： 如上面的定义 \
  特点为：
  - 抽样的单元不会重复
  - 相同的抽样机会包含更多（相对于有放回）的信息。
== 均值与方差
#theorem[
  如果$overline(Y)$ 是总体均值，$overline(y)$ 是样本均值，则$EE overline(y) = overline(Y)$
]

#proof[
  $overline(y)_(k) = (1)/n sum_(i in Omega_(k)) Y_(i)$,故
  $ EE overline(y) &= sum_(k=1)^(M) PP(Omega_(k)) overline(y)_(k) \ &= sum_(k=1)^(M) (1)/M (1)/n sum_(i in Omega_(k)) Y_(i) \ &= (1)/(M n) sum_(i=1)^(N)sum_(k:i in Omega_(k)) Y_(i)\ &= (1)/(M n) C_(N-1)^(n-1) N overline(Y) \ &= overline(Y) \ $
  其中$M = C_(N-1)^(n-1)$
]

#theorem[
  在不放回简单随机抽样下，方差和均方误差为
  $ "MSE"(overline(y)) = Var(overline(y)) = (1-f)/(n) S^(2) = ((1)/n - (1)/N) S^(2) $
  其中，$f = (n)/N$ 为抽样比，$1-f$ 记作有限总体校正系数，$S$ 为总体标准差。
]
#proof[
  $ Var(overline(y)) = Var((1)/n sum_(i=1)^(n) Y_(i)) = (1)/n Var(Y_(i)) $ (这一步并不严谨，没有说明独立性)
  考虑单个样本单元的方差，
  $ Var(Y_(i)) = EE ((Y_(i)-overline(Y))^(2)) = (1)/N sum_(i=1)^(N) (Y_(i)-overline(Y))^(2) = (N-1)/(N) S^(2) $ 
]
#remark[
  为了严谨的证明，我们采用以下方式。考虑随机变量$a_(i) = cal(1)_(Y_(i) in Omega_(k))$ 代表第$i$ 个样本是否被抽样到。
  $ Var(overline(y)) &= (1)/n^(2) Var(sum_(i=1)^(N) Y_(i)a_(i))\ &= (1)/n^(2) sum_(i,j) Cov(Y_(i)a_(i),Y_(j)a_(j))\ &= (1)/(n^(2)) (sum_(i=1)^(N) Y_(i)^(2)Var(a_(i)) + sum_(i!=j)Y_(i)Y_(j)Cov(a_(i),a_(j))) \ $ 
  简单的组合数学告诉我们，$EE a_(i) = PP a_(i) = (C_(N-1)^(n-1))/(C_(N)^(n)) = (n)/(N)$,$EE a_(i)^(2) = PP a_(i) = (n)/(N)$ 而
  $ EE a_(i)a_(j) = PP a_(i)a_(j) = (C_(N-2)^(n-2))/(C_(N)^(n)) = (n(n-1))/(N(N-1)) $ 
  因此,
  $ Var(a_(i)) = EE (a_(i)^(2)) - (EE a_(i))^(2) = (n)/N -(n^(2))/(N^(2)) $
  $ Cov(a_(i),a_(j)) = EE a_(i)a_(j) - EE a_(i) EE a_(j) = (n(n-1))/(N(N-1)) - ((n)/(N))^(2) $ 
  故
  $ Var(overline(y)) &= (1)/(n^(2)) (sum_(i=1)^(N) Y_(i)^(2) (N n - n^(2))/(N^(2)) + sum_(i!=j)Y_(i)Y_(j)((n(n-1))/(N(N-1)) - ((n)/(N))^(2))) \ &= (1)/n^(2) (n(N-n))/(N^(2)(N-1)) ((N-1)sum_(i=1)^(N) Y_(i)^(2) - sum_(i!=j)Y_(i)Y_(j)) \ &= (1)/n^(2) (n(N-n))/(N^(2)(N-1)) ( N sum_(i=1)^(N) Y_(i)^(2) - sum_(i,j)Y_(i)Y_(j)) \ &= (1)/n^(2) (n(N-n))/(N^(2)(N-1)) (N sum_(i=1)^(N) Y_(i)^(2) - N^(2)overline(Y)^(2)) \ &= (1)/n^(2) (n(N-n))/(N(N-1))(sum_(i=1)^(N) Y_(i)^(2) - N overline(Y)^(2)) \ &=(1)/n^(2)
  (n(N-n))/(N(N-1)) (N-1) S^(2) \ &=(1/n - 1/N) S^(2) $ 
]

#theorem[
  不放回的简单随机抽样样本方差是总体方差的无偏估计。
]
#proof[
  $ EE s^(2) &= EE (1)/(n-1) sum_(i=1)^(n) (y_(i)-overline(y))^(2) \ &= (1)/(n-1) EE sum_(i=1)^(n) (y_(i) - overline(Y) + overline(Y) - overline(y))^(2) \ &= (1)/(n-1) (sum_(i=1)^(n) EE(y_(i)-overline(Y)^(2)) + 2(overline(Y)-overline(y))sum_(i=1)^(n) EE(y_(i)-overline(Y)) + n  (overline(Y)-overline(y))^(2)) \ &= (1)/(n-1) (sum_(i=1)^(n) EE(Y_(i)a_(i)-overline(Y)^(2)) + n Var(overline(y))) \ &= (1)/(n-1) ((n(N-1))/(N)S^(2) - (N-n)/(N)S^(2)) \ &= S^(2) \ $ 
]
由于实际中的数据大多为轻尾的，我们可以认为大部分情况下大数定律依然成立。
考虑方差的估计$hat(Var)(overline(y)) = s^(2)$ ，则我们有区间估计
#theorem[
  在不放回简单随机抽样下，当$N,n$ 足够大的时候，$overline(y)$ 具有正态性，进而有区间估计
  $ [overline(y) - z_(1-(alpha)/2)sqrt(hat(Var)(overline(y))) , overline(y)+z_(1+(alpha)/2) sqrt(hat(Var)(overline(y)))  ] $ 
]

=== 简单的应用：比例
考虑被一个性质划分的总体及其上面的一个样本，$P$ 来标记符合这个性质的比例，即
$ Y_(i) = cases(
    1 quad Y_(i) in C ,
    0 quad "otherwise"
) $
$ P = (1)/N sum_(i=1)^(n) Y_(i) $ 
则根据上面的公式，我们有
$ p = EE overline(y) = EE overline(Y) = P $ 
$ Var(overline(y)) = (1-f)/(n) S^(2) = (1-f)/(n) (N P(1-P))/(N-1) $ 

== 样本量的确定
一般的抽样调查中，样本量越大那么调查的方差和MSE就会越小。但同样的，调查的成本会增加。
确定样本量的因素主要考虑两点：
+ 实际的成本限制
+ 需要的精度要求

=== 费用限制
假设成本满足$c = c_(0)+n c_(1)$,在成本限制为$C$ 的情况下，$n<=(C-c_(0))/(c_(1))$ 

=== 精度要求 <req:var>
通常我们有四种精度描述
+ 估计量的方差不大于某个值 $Var(hat(theta)) <= V_(0)$ 
+ 估计量的变异系数不超过某个值 $sqrt(Var(hat(theta)))/theta <= C_(0)$ 
+ 在$1-alpha$ 的置信度下，估计量的绝对误差小于$d$,即$PP (abs(hat(theta)-theta) <=d) >= 1-alpha$ 
+ 在$1-alpha$ 的置信度下，估计量的相对误差小于$d$,即$PP (abs((hat(theta)-theta)/theta) <=d) >= 1-alpha$ 

==== 精度要求1
$ ((1)/n - (1)/N)S^(2)<=V_(0) <=> n>=(n_(0))/(1+n_(0)/N) $
其中，$n_(0) = S^(2)/V_(0)$ 

==== 精度要求2
$ sqrt(Var(overline(y)))/overline(Y) <=C_(0) <=> Var(overline(y)) <= C_(0)^(2)overline(Y)^(2) $,有次化归为1的情形，故
$ n>=(n_(0))/(1+(n_(0))/(N)) $ 其中$n_(0) = S^(2)/(C_(0)^(2)overline(Y)^(2))$

==== 精度要求3
考虑估计量$overline(Y)$,根据$overline(Y)$ 的正态性，$(|hat(overline(Y)) - overline(Y)|)/sqrt( (Var(hat(overline(Y)))) ) ~> N(0,1)$ 
故该条件等价于$ (d)/(sqrt((Var(hat(overline(Y)))))) >= z_(1-(alpha)/2) <=> Var(hat(overline(Y))) <= ((d)/(z_(1-(alpha)/2)))^(2) $
化归为要求2
 
==== 精度要求4
$ PP (abs((hat(overline(Y))-overline(Y))/overline(Y)) <=d) >= 1-alpha <=> PP (abs((hat(overline(Y))-overline(Y))<=d overline(Y)) <= 1-alpha $ 
化归为要求3

== 利用辅助信息：比估计和回归估计
=== 比估计 <ass:R>
首先将上面的记号推广到多维情景
$ S_(bold(Z))^(2) = (1)/(N-1) sum_(i=1)^(n) (bold(Z)_(i)-overline(bold(Z)))(bold(Z)_(i)-overline(bold(Z)))^(tack.b) $
$ EE overline(bold(z)) = overline(bold(Z)) $
$ EE s_(overline(bold(z)))^(2) = S_(overline(bold(Z)))^(2) $ 
$ Var(overline(bold(z))) = (1-f)/(n) S_(bold(Z))^(2) $ 
$ Var(overline(bold(Z)))^(-(1)/2) (bold(Z) - overline(bold(Z))) ~> N(bold(0),bold(I)) => (bold(Z) - overline(bold(Z)))Var(overline(bold(Z)))^(-1)(bold(Z) - overline(bold(Z))) ~> Chi^(2)_(n) $ 

同时，我们有delta方法
$ g(overline(bold(z))) ~ g(overline(bold(Z))) + (partial g)/(partial z) |_(z = overline(bold(Z))) (overline(bold(z))-overline(bold(Z))) $ 
故，
$ g(overline(bold(z))) ~ N(g(overline(bold(Z))),((partial g)/(partial z) |_(z = overline(bold(Z))))^(tack.b) Var(overline(bold(z)))(partial g)/(partial z) |_(z = overline(bold(Z)))) $ 
对于二维统计量$bold(Z)=(Y,X)^(tack.b)$,考虑比率统计量$R = overline(Y)/overline(X)$,使用估计量$hat(R) = (overline(y))/(overline(x))$ 
#theorem[
  + $EE hat(R) = R$ 
  + $Var(hat(R)) = (1)/(overline(X)^(2)) (1-f)/(n)(s_(y)^(2)-2R s_(x y)+R^(2)s_(x)^(2))$
]
#proof[
  考虑$f(bold(z)) = (y)/(x)$,则$(partial f) / (partial bold(z)) = ((1)/x , -(y)/(x^(2)))^(tack.b)$
  有delta方法，
  $ f(overline(bold(z))) = f(overline(bold(Z))) + (((1)/x , -(y)/(x^(2)))|_(bold(z) = overline(bold(Z))))^(tack.b) (overline(bold(z)) - overline(bold(Z))) $ 
  因此，
  $ f(overline(bold(z))) = hat(R) ~> N(R,(1)/(overline(X)^(2)) (Var(overline(y))-2R Cov(overline(x),overline(y)) + R^(2)Var(overline(x)))) $ 
  即
  $ EE hat(R) = R $
  $ Var(hat(R)) = (1)/(overline(X)^(2)) (1-f)/(n) (S_(y y)^(2) -2R S_(x y) + R^(2) S_(x x)^(2)) $ 
]
#theorem[
  方差的渐进无偏估计为$ hat(Var)(hat(R)) = (1)/(overline(X)^(2)) (1-f)/(n) (s_(y y)^(2) -2 hat(R) s_(x y) + hat(R)^(2) s_(x x)^(2)) $ 
]
#proof[
  先略
]

因此，在已知$overline(X)$ 的信息情况下，我们可以利用比估计来估计$overline(Y)_(R) = hat(R) overline(X)$.
我们有如下性质
#proposition[
  + $EE(hat(overline(Y)_(R))) = overline(Y)$ 
  + $Var(hat(overline(Y)_(R))) = (1-f)/(n) (S_(y y)^(2) -2 R S_(x y) + R^(2) S_(x x)^(2))$
  + $hat(Var)hat(overline(Y)_(R)) = (1-f)/(n) (s_(y y)^(2) -2 hat(R) s_(x y) + hat(R)^(2) s_(x x)^(2))$
]
如何判断与简单估计的更优性？考虑方差的差
$ Var(hat(overline(Y))) - Var(hat(overline(Y)_(R))) = (1-f)/(n) S_(y y)^(2) - (1-f)/(n) (S_(y y)^(2) -2 R S_(x y) + R^(2) S_(x x)^(2)) \ = (1-f)/(n) (2R S_(x y) - R^(2)S_(x x)^(2)) $
#proposition[
  当$2R S_(x y) - R^(2)S_(x x)^(2)>=0$时，比估计更优（方差更小），在实际应用中，通常比$R$ 为正，因此当
  $ rho > (R S_(x x))/(2 S_(y y)) $ 
  比估计更好，其中$rho S_(x x)S_(y y) = S_(x y)$
]

=== 回归估计 <ass:re>
回归估计不要求像比估计一样两个变量之间的正比例关系，回归估计可以考虑更一般的线性关系，并且可以利用更多的额外信息。
在简单不放回随机抽样下，总体均值的回归估计为
$ hat(overline(Y)_(l r)) = overline(y) + beta(overline(X)-overline(x)) $ 

#theorem[
  在$beta$ 已知的情况下，我们有
  + $EE(hat(overline(Y)_(l r))) = overline(Y)$ 
  + $Var(hat(overline(Y)_(l r))) = (1-f)/(n) (S_(y y)^(2) - 2 beta S_(x y) + beta^(2)S_(x x)^(2))$
]
#proof[
  $ EE(hat(overline(Y)_(l r))) &= EE(overline(y) + beta(overline(X)-overline(x))) \ &= EE(overline(y)) + beta EE(overline(X)-overline(x)) \ &= overline(Y) + beta times 0 \ &= overline(Y) \ $ 
  $ Var(hat(overline(Y)_(l r))) &= Var(overline(y) + beta(overline(X)-overline(x))) \ &= Var(overline(y) - beta overline(x)) \ &= Var((1)/n sum_(i=1)^(n) (y_(i)-beta x_(i))) \ &= (1-f)/(n) Var(y_(i)-beta x_(i)) \ &= (1-f)/(n) (S_(y y)^(2) -2 beta S_(x y)+beta^(2)S_(x x)^(2)) \ $ 
  在这里我们用到了简单估计的方差公式。
]

如果$beta$ 未知（这也是大部分实际情况），我们需要$MSE$最小的估计 $hat(beta)$ ，又我们需要的统计量是近似无偏的，因此我们要$hat(beta)$ 最小化我的方差,即$hat(beta) = (S_(x y))/(S_(x x)^(2))$
 此时我们有
 #theorem[
   + $EE(hat(overline(Y)_(l r))) approx overline(Y)$ 
   + $Var(hat(overline(Y)_(l r))) = (1-f)/(n)(S_(y y)^(2) - 2 hat(beta) S_(x y) + hat(beta)^(2)S_(x x)^(2)) = (1-f)/(n) S_(y y)^(2) (1-rho^(2))$
   + $hat(Var)(hat(overline(Y)_(l r))) = (1-f)/(n) (n-1)/(n-2) s_(y y)^(2)(1-hat(rho)^(2))$ 
   在这里因为残差的期望为0，并且残差与数据独立，因此自由度为$n-2$ 故需要$(1)/(n-2)$ 的修正。
 ]
可以看出，回归估计总是比简单估计更优。

同样的，通过做差，也可以得到回归估计比比估计更优。

== 子总体特征的估计
#definition[
  总体按照属性进行划分称为子总体。
]
假定总体有$N$ 个单元，指标为$Y_(i)$ 若单元$i in D$则， $X_(i) = 1$，否则为0.
#definition[
  子总体的规模定义为$N_(D) = sum_(i=1)^(n) X_(i)$ 

  子总体的总和为$Y_(D) = sum_(i=1)^(N) y_(i)X_(i)$

  子总体的均值为$overline(Y)_(D) = (Y_(D))/(N_(D))$
]

子总体总和$Y_(D)$的估计
#theorem[
  定义$Z_(i) = Y_(i)X_(i)$ 则
  + $hat(Y)_(D) = N overline(z) = (N)/(n) sum_(i=1)^(n) z_(i)$ 
  + $hat(Var)(hat(Y)_(D)) = N^(2) (1-f)/(n) s_(z)^(2)$
]
子总体均值的估计，由于规模通常未知，我们做如下变换
$hat(overline(Y)_(D)) = (sum_(i=1)^(n) z_(i))/(n_(D)) = (overline(z))/(overline(x))$ 
因此可以使用比估计的方法去解决。

= 分层抽样
当总体内部存在明显的分层结构时，简单随机抽样会导致某些子总体代表性不足，影响估计的精度。
== 均值和方差
总体均值的估计量$overline(Y) = overline(y)_(s t)$ 有这些性质：
#theorem[
  + 无偏性：$EE(overline(y)_(s t)) = sum_(h=1)^(L) W_(h)EE(overline(y)_(h)) = sum_(h=1)^(L) W_(h)overline(Y)_(h) = overline(Y)$ 
  + 方差: $Var(overline(y)_(s t)) = sum_(h=1)^(L) W_(h)^(2)Var(overline(y)_(h)) = sum_(h=1)^(L) W_(h)^(2) (1-f_(h))/(n_(h)) S_(h)^(2)$
  + 无偏估计： $hat(Var)(hat(y)_(s t)) = sum_(h=1)^(L) W_(h)^(2)Var(overline(y)_(h)) = sum_(h=1)^(L) W_(h)^(2) (1-f_(h))/(n_(h)) s_(h)^(2)$
]

== 样本量的分配
同样先考虑成本问题，一般来说，每层抽样的成本是不一样的。那么成本约束为
$ sum_(h=1)^(L) c_(h)n_(h) <= V_(0) $
未知数个数比方程更多，没有解，我们考虑这样的分配
$ n_(h) = w_(h)n $
在分配给定的情况下，只有一个未知量n.
我们期望估计的方差最小，即
$ Var(overline(y)_(s t)) = sum_(h=1)^(L) W_(h)^(2) (1-f_(h))/(n_(h)) S_(h)^(2) = sum_(h=1)^(L) W_(h)^(2) (1)/(n w_(h)) S_(h)^(2) - sum_(h=1)^(L) W_(h) (1)/(N_(h)) S_(h)^(2) $ 
根据权方和不等式，当$w_(h) prop abs(W_(h)S_(h))$ 时最小。因此分配给定了，进而样本量也确定。

=== 比例分配
如果每层样本层权与总体层权相同，即$w_(h) = W_(h)$那么我们称之为比例分配。
则
+ $n_(h) = n (N_(h))/(N)$ 
+ $overline(y)_(s t) = sum_(h=1)^(L) W_(h)overline(y)_(h) = sum_(h=1)^(L) W_(h) (1)/n_(h) sum_(i=1)^(n_(h)) y_(h i) = (1)/n sum_(h=1)^(L) sum_(i=1)^(n_(h)) y_(h i)$
+ $Var(overline(y)_(s t)) = sum_(h=1)^(L) W_(h)^(2) (1-f_(h))/n_(h) S_(h)^(2) = sum_(h=1)^(L) W_(h)(1-f)/(n) S_(h)^(2) $

=== 最优分配
分层抽样中，在给定成本的条件下使得估计方差最小的分配称之为最优分配。
即
$ min Var(overline(y)_(s t)) = sum_(h=1)^(L) W_(h)^(2)((1)/n_(h) - (1)/N_(h)) S_(h)^(2) \ "s.t." C = c_(0)+sum_(h=1)^(L) c_(h)n_(h) $ 
考虑权方和不等式，$ n_(h) prop (W_(h)S_(h))/sqrt(c_(h)) $ 
结合$sum_(h=1)^(L) n_(h) = n$ 即得。

=== Nyman 分配
每层单位成本相同情况下的最优分配称为Nyman分配。

== 样本量的确定
=== 成本控制
$ c_0 + n sum_(h=1)^(L) c_(h)w_(h) <= C => n<=(C-c_0)/(sum_(h=1)^(L) c_(h)w_(h)) $ 

=== 方差控制
与 @req:var 相同，不过将其中的估计量方差替换为本章的估计量方差

== 利用辅助信息
=== 分层下的比估计 <ass:Rh>
要估计比率$R = (overline(Y))/(overline(X))$ ，我们使用估计量$hat(R)_(C) = (overline(y)_(s t ))/(overline(x )_(s t))$
根据 @ass:R 的理论，我们有
+ $EE hat(R)_(C) = R$
+ $ Var(hat(R)_(C)) &= (1)/(overline(X)^(2)) Var(overline(y)_(s t) - R overline(x)_(s t)) \ &= (1)/(overline(X)^(2)) sum_(h=1)^(L) W_(h)^(2) (1-f_(h))/(n_(h)) (S_(y h)^(2) - 2 R S_(x h,y h) + R^(2)S_(x h)^(2))  \ $
+ $ hat(Var)(hat(R)_(C)) = (1)/(overline(x)_(s t)^(2)) sum_(h=1)^(L) W_(h)^(2) (1-f_(h))/(n_(h)) (s_(y h)^(2) - 2 R_(C) s_(x h,y h) + R_(C)^(2)s_(x h)^(2)) $ 

=== 分別比估计与联合比估计
考虑对于$R$的估计量，我们可以考虑分层的 $R_(h)$ 进行层权加权，也可以考虑样本总体的估计量。
如果我们取$hat(R) = sum_(h=1)^(L) W_(h)hat(R)_(h)$,这样的估计是无偏的，则称为分别比估计。
==== 分别比估计
考虑估计$hat(overline(Y))_(R S) = sum_(h=1)^(L) W_(h)hat(R)_(h)overline(X)_(h) = sum_(h=1)^(L) W_(h)(overline(y)_(h))/(overline(x)_(h))overline(X)_(h)$ 
其有如下性质
+ $EE hat(overline(Y))_(R S) = overline(Y)$ 
+ $Var(hat(overline(Y))_(R S)) = sum_(h=1)^(L) W_(h)^(2) (1-f_(h))/(n_(h)) (S_(y h)^(2) - 2 R_(h)S_(x h, y h) + R_(h)^(2) S_(x h)^(2))$ 
+ $hat(Var)(hat(overline(Y))_(R S)) = sum_(h=1)^(L) W_(h)^(2) (1-f_(h))/(n_(h)) (s_(y h)^(2) - 2 hat(R)_(h)s_(x h, y h) + hat(R)_(h)^(2) s_(x h)^(2))$
==== 联合比估计
见 @ass:Rh , 只需将分别比估计中每层的R估计换成总体估计$hat(R)_(C)$ 即可。

==== 两者的比较
- 在各层比率$R_(h) = R$时，两者估计精度相同。
- 通常，在每一层总体均值的比率估计量优于简单估计量，则分别比率估计优于总体比率估计。
- 当某一层样本量很小的时候，分别比估计的偏差大，导致其均方误差大，从而联合比估计更优。

=== 分层抽样下的回归估计
==== 分别回归估计
参考 @ass:re ,我们考虑估计量$hat(overline(Y))_(l r s) = sum_(h=1)^(L) W_(h)[overline(y)_(h) + beta_(h)(overline(X)_(h)-overline(x)_(h))]$
在$beta_(h)$ 已知的情况下，
我们有
- $EE hat(overline(Y))_(l r s) = overline(Y)$ 
- $Var(hat(overline(Y))_(l r s)) = sum_(h=1)^(L) W_(h)^(2) (1-f_(h))/(n_(h)) (S_(y y)^(2) - 2 beta_(h)S_(x y) + beta_(h)^(2) S_(x x)^(2))$
在 $beta_(h)$ 未知的时候，我们最优的选择为$Beta_(h) = (S_(x h,y h))/(S_(x h)^(2))$,此时均方误差最小。
则
+ $EE hat(overline(Y))_(l s r) approx overline(Y)$ 
+ $Var(hat(overline(Y))_(l r s)) = sum_(h=1)^(L) W_(h)^(2)  (1-f_(h))/(n_(h)) S_(y h)^(2) (1-rho_(h)^(2))$,其中$rho_(h) = (S_(x h,y h))/(S_(x h)S_(y h))$
+ $hat(Var)(hat(overline(Y))_(l r s)) = sum_(h=1)^(L) W_(h)^(2) (1-f_(h))/(n_(h)) (n-1)/(n-2) s_(y h)^(2)(1-hat(rho)_(h)^(2))$ 

==== 联合回归估计
只需将上述的$hat(beta)$ 替换为$hat(beta) = B_(C) = (sum_(h=1)^(L) W_(h)^(2)(1-f_(h))/(n_(h))S_(x h,y h))/(sum_(h=1)^(L) W_(h)^(2)(1-f_(h))/(n_(h))S_(x h)^(2))$

== 分层抽样与简单随机抽样的比较

两者都是无偏估计，因此考虑其方差（均方误差）。
分层抽样的方差不仅取决于样本量，还取决于分配方案。因此我们考虑与简单抽样相同样本量下的比例分配。

=== 方差比较
- 比例分配下分层抽样的方差为 $(1-f)/(n)sum_(h=1)^(L) W_(h) S_(h)^(2)$ 
- 简单随机抽样的方差为 $(1-f)/(n)S^(2)$ 

在$N,N_(h)$ 都较大的情况下$S^(2) approx sum_(h=1)^(L) W_(h)S_(h)^(2) + sum_(h=1)^(L) W_(h)(overline(Y)_(h)-overline(Y))^(2)$ 

其中，前一项为层内误差，后一项为层间误差。由于样本给定的情况下，$S^(2)$ 是固定的，为了使得我们的分层抽样方差最小，我们需要层间误差尽可能的大。
这就是我们分层的原则。

== 设计效应

#definition[
  设计效应指采用特定抽样设计的估计量方差与相同样本量下无放回简单随机抽样的估计量方差的比值
  $ "DEFF" = (Var(hat(theta)_(c x)))/(Var(hat(theta)_(s r s))) $ 
]

在分层抽样下，我们容易得到分子的值，那如何在分层抽样的情况下估计分母呢？我们这样分解
$ Var(overline(y)_(s r s)) &= (1-f)/(n) S^(2) \ &= (N-n)/(N n)(1)/(N-1)sum_(h=1)^(L) sum_(i=1)^(N_h) (Y_(h i) - overline(Y))^(2) \ &= (N-n)/(n(N-1))((1)/N sum_(h=1)^(L) sum_(i=1)^(N_h)Y_(h i)^(2) - overline(Y)^(2)) \ $ 
由于各层都是简单随机抽样，因此 $ (1)/N sum_(h=1)^(L) (N_h)/(n_h) sum_(i=1)^(n_h) y_(h i)^(2) $ 
是括号中第一项的无偏估计

同时，$overline(Y)^(2)$的无偏估计为$overline(y)_(s t )^(2) - hat(Var)(overline(y)_(s t))$ 

因此，分母的估计为
$ hat(Var)(overline(y)_(s r s)) = (N-n)/(n(N-1))((1)/N sum_(h=1)^(L) (N_h)/(n_h) sum_(i=1)^(n_h) y_(h i)^(2) - overline(y)_(s t )^(2) + hat(Var)(overline(y)_(s t))) $ 

= 不等概率抽样
#footnote[每个不等概率抽样的方法都需要知道名字，以及前两个方法应该需要知道原理]
当总体存在明显异质性时，简单随机抽样会导致估计量方差较大。分层抽样时，分层变量与主要调查变量的相关性较弱，或层内方差较大时，估计量方差仍然较大。

不等概率抽样允许每个单元以不同的概率抽中，其优势在于
+ 效率提升
+ 适应性增强

#definition[
  实行抽样时，如果每个单元都被赋予一个大小不等的入样概率，这样的抽样方案称为不等概率抽样
]

入样概率通常与某个或某些辅助变量相关，若总体特征与辅助变量之间存在明显相关关系，且方差较大时，不同单元的代表性可能因辅助变量的不同而不同。

== 多项抽样
#definition[
  在N个单元的总体中进行有放回抽样，每次抽样时第i个单元抽到的概率为$Z_i,Z_i>0$且 $sum_(i=1)^(N) Z_i = 1$
   独立的进行n次上述抽样，这样的抽样方法称为多项抽样。
]

用$t_i$ 表示总体第i个单元在n 次抽样中被抽到的次数，那么$0<=t_i<=n$ 且$sum_(i=1)^(n) t_i = n$, 向量$(t_1,t_2,#sym.dots.h,t_n)$服从多项分布
联合概率为
$ (n!)/(t_1!t_2!#sym.dots.h t_n!) Z_1^(t_1)Z_2^(t_2)#sym.dots.h Z_n^(t_n) $ 

#definition[
  在多项抽样中，如果每个单元在每次抽样中入样概率与其大小规模成正比，即
  $ Z_i = (M_i)/(M), M= sum_(i=1)^(n) M_i $
  则称之为PPS抽样
]

总体总和的估计量为
$ hat(Y)_(H H) = (1)/n sum_(i=1)^(n) (y_(i))/(Z_(i)) $

#proposition[
  + $EE hat(Y)_(H H) = Y$
  + $Var(hat(Y)_(H H)) = (1)/n sum_(i=1)^(N) Z_i ((Y_i)/(Z_i) - Y)^(2)$ 
  + $hat(Var)(hat(Y)_(H H)) = (1)/n (1)/(n-1) sum_(i=1)^(n) ((y_i)/(Z_i) - hat(Y)_(H H))^(2)$
]

#proof[
  $ EE (y_i)/(Z_i) = sum_(i=1)^(N) Z_i (Y_i)/(Z_i) = sum_(i=1)^(N) Y_(i) $
  因此$EE hat(Y)_(H H) = (1)/n sum_(i=1)^(n) EE (y_i)/(Z_i) = (1)/n n sum_(i=1)^(N) Y_(i) = sum_(i=1)^(N) Y_(i) = Y$ 

  $ Var(hat(Y)_(H H)) &= (1)/(n^(2)) sum_(i=1)^(n) Var((y_(i))/(Z_(i))) \ &= (1)/n sum_(j=1)^(N) Z_(i)((Y_(i))/(Z_(i)) - Y)^(2) $ 
  我们用样本方差代替总体方差来估计方差，
  $ (1)/(n-1)sum_(i=1)^(n) ((y_i)/(Z_i) - hat(Y)_(H H)) $ 
]

== 不放回不等概率抽样
定义下述的符号：

$pi_i$表示单元i入样概率

$pi_(i j)$表示单元i和单元j都被抽入样本的联合概率

$eta_(i j)$单元i在第j次入样的概率

基本性质： $sum_(i=1)^(n) eta_(i j) = 1 quad forall j,1<=j<=n$ 

#theorem[
  + $sum_(i=1)^(N) pi_i = n$
  + $sum_(j:j!=i) pi_(i j) = (n-1)pi_i$
]
#proof[
  $ sum_(j!=i) pi_(i j) = sum_(j!=i) pi_(i) Pr(j in S | i in S) = pi_(i) sum_(j!=i) Pr(j in S | i in S) = (n-1) pi_(i) $ 
]

如果入样概率与样本规模成正比，则这种不放回不等抽样称作$pi$ PS抽样。
若记$Z_i = M_i / M_0$,则有 $pi_i = n Z_i$

样本总和的最常用的估计量为HT(Horvitz & Thompson)估计量：
 $ hat(Y)_(H T) = sum_(i=1)^(n) (y_i)/(pi_i) = sum_(i=1)^(N) (y_(i))/(pi_(i)) bb(1)_(i) $ 

#theorem[
  + $EE hat(Y)_(H T) = Y$
  + $Var(hat(Y)_(H T)) = sum_(i,j) (Y_(i)Y_(j))/(pi_(i)pi_(j)) (pi_(i j)-pi_(i)pi_(j)) $
  + $hat(Var)(hat(Y)_(H T)) = sum_(i,j) y_(i)y_(j)((1)/(pi_(i)pi_(j)) - (1)/(pi_(i j)))$
]
#proof[
  $ EE bb(1)_i = pi_(i) , EE bb(1)_(i j) = pi_(i j) $
  故
  $ EE hat(Y)_(H T) = sum_(i=1)^(N) Y_(i)/pi_(i) EE bb(1)_(i) = sum_(i=1)^(N) Y_(i) $
  $ Var(hat(Y)_(H T)) &= sum_(i j) (Y_(i))/(pi_(i)) (Y_(j))/(pi_(j)) Cov(bb(1)_(i),bb(1)_(j)) \ &= sum_(i j) (Y_(i))/(pi_(i)) (Y_(j))/(pi_(j)) (pi_(i j) - pi_(i)pi_(j)) \ $ 
  $ EE hat(Var)(hat(Y)_(H T)) &= EE sum_(i j) Y_(i)Y_(j) bb(1)_(i)bb(1)_(j) ((1)/(pi_(i)pi_(j)) - (1)/(pi_(i j))) \ &=sum_(i j) Y_(i)Y_(j) ((pi_(i j))/(pi_(i)pi_(j)) - 1) \ $ 
]

然而，上述的方差估计有可能出现负值的情况，为了避免这种情况，我们使用另外的估计量（考试考这个）
$ Var(hat(Y)_(H T)) = sum_(i=1)^(N) sum_(j > i) ((Y_(i))/(pi_(i)) - (Y_(j))/(pi_(j)))^(2)(pi_(i)pi_(j) - pi_(i j)) $ 
他的无偏估计为
$ hat(Var)(hat(Y)_(H T)) = sum_(i=1)^(N) sum_(j > i) ((y_(i))/(pi_(i)) - (y_(j))/(pi_(j)))^(2)(pi_(i)pi_(j) - pi_(i j))/(pi_(i j)) $ 

我们证明这个方差与上面的方差是等价的，
#proof[
  由于$ sum_(i j) (Y_(i)Y_(j))/(pi_(i)pi_(j)) (pi_(i j) - pi_(i)pi_(j)) &= sum_(i j) (1)/2 ((Y_(i)/pi_(i))^(2) + (Y_(j)/pi_(j))^(2) - (Y_(i)/pi_(i) - Y_(j)/pi_(j))^(2)) (pi_(i j) - pi_(i)pi_(j)) \ &= C + sum_(i=1)^(N) sum_(j>i) (Y_(i)/pi_(i) - Y_(j)/pi_(j))^(2) (pi_(i)pi_(j) - pi_(i j)) \ $
  其中
   $ C &= sum_(i,j) ((Y_(i))/(pi_(i)))^(2) (pi_(i j)- pi_(i)pi_(j)) \ &= sum_(i) (Y_(i)/pi_(i))^(2) sum_(j) (pi_(i j) - pi_(i)pi_(j)) \ &= sum_(i) ((Y_(i))/(pi_(i)))^(2) (n pi_(i) - n pi_(i)) \ &= 0 \ $ 
]

== 大数据子抽样
将大规模数据集中选择合适的子集进行抽样的技术称之为大数据子抽样(subsampling).
大数据子抽样主要通过研究如何设计入样概率来使得子样本的统计量具有更好的统计性质。
=== 有放回大数据子抽样
- 给定$N$ 个样本的抽样概率${Z_i}$
- 通过入样概率，从$N$ 个样本中抽取$n$ 个单元。
- 记入样单元为${u_(i)}$,入样概率为${Z_i}$
我们对于目标参数的估计为
 $ hat(theta)_(w r) = "argmin"_(theta) sum_(i=1)^(n) (cal(l)(theta;u_(i)))/(z_(i)) $ 

该参数估计有渐进正太性
$ sqrt(n N)(hat(theta)_(w r),theta) -> N(0,B_(N)^(-1)V_(N 1)B_(N)^(-1)) $
其中
$ B_(N) = - (1)/(N) sum_(i=1)^(N) nabla_(theta theta^(tack.b)) cal(l)(hat(theta);U_(i)) , V_(N 1) = (1)/(N) sum_(i=1)^(N) (nabla_(theta)cal(l)(hat(theta);U_(i))(nabla_(theta)cal(l)(hat(theta),U_(i)))^(tack.b))/(Z_(i)) $    

==== A最优准则
A最优准则要求方差的迹最小，即
$ min tr(B_(N)^(-1)V_(N 1)B_(N)^(-1)) = (1)/(N) sum_(i=1)^(N) (||B_(N)^(-1)nabla_(theta)cal(l)(hat(theta);U_(i))||^(2))/(Z_(i)) $ 
根据柯西不等式，最小值在
$ Z_(i) = (||B_(N)^(-1)nabla_(theta)cal(l)(hat(theta);U_(i))||)/(sum_(i=1)^(N) ||B_(N)^(-1)nabla_(theta)cal(l)(hat(theta);U_(i))||) $ 
==== L最优准则
给定线性变换Q，L最优准则要求最小化$Q B_(N)^(-1) V_(N 1) B_(N)^(-1) Q^(tack.b)$
与上面的类似，最小值在
 $ Z_(i) = (||Q B_(N)^(-1)nabla_(theta)cal(l)(hat(theta);U_(i))||)/(sum_(i=1)^(N) ||Q B_(N)^(-1)nabla_(theta)cal(l)(hat(theta);U_(i))||) $ 

=== 算法实现
由于确定$Z_(i)$ 需要对于$theta$ 有一个估计，因此可以使用EM算法
=== 不放回大数据子抽样
使用估计量
$ hat(theta)_("wor") = arg min_(theta) sum_(i=1)^(n) (cal(l)(theta;u_(i)))/(Z_(i)) $
则有渐进性
$ sqrt(N) (hat(theta)_("wor") - theta) -> N(0,B_(N)^(-1) V_(N 2)B_(N)^(-1)) $
其中
$ V_(N 2) = (1)/(N) sum_(i=1)^(N) (1-pi_(i))/(pi_(i)) nabla_(theta)cal(l)(hat(theta);U_(i)) nabla_(theta)cal(l)(hat(theta);U_(i))^(tack.b) $ 

L准则下的最小值在
$ Z_(i) = n times (||Q B_(N)^(-1)nabla_(theta)cal(l)(hat(theta);U_(i))||)/(sum_(i=1)^(N) ||Q B_(N)^(-1)nabla_(theta)cal(l)(hat(theta);U_(i))||) $ 

=== 主动学习
为了解决人工标注成本过高的问题，我们希望筛选出可能含有更大信息的样本进行人工标注。
考试应该不考
