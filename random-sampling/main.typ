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
  $ Var(overline(y)) &= Var(sum_(i=1)^(N) Y_(i)a_(i))\ &= (1)/n^(2) sum_(i,j) Cov(Y_(i)a_(i),Y_(j)a_(j))\ &= (1)/(n^(2)) (sum_(i=1)^(N) Y_(i)^(2)Var(a_(i)) + sum_(i!=j)Y_(i)Y_(j)Cov(a_(i),a_(j))) \ $ 
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

=== 精度要求
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
=== 比估计
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
  方差的渐进无偏估计为$ hat(Var)(hat(R)) = (1)/(overline(x)^(2)) (1-f)/(n) (s_(y y)^(2) -2 hat(R) s_(x y) + hat(R)^(2) s_(x x)^(2)) $ 
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

=== 回归估计
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
   + $EE(hat(overline(Y)_(l r))) = overline(Y)$ 
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
  + 方差: $Var(overline(y)_(s t)) = sum_(h=1)^(L) W_(h)Var(overline(y)_(h)) = sum_(h=1)^(L) W_(h)^(2) (1-f_(h))/(n_(h)) S_(h)^(2)$
  + 无偏估计： $hat(Var)(hat(y)_(s t)) = sum_(h=1)^(L) W_(h)Var(overline(y)_(h)) = sum_(h=1)^(L) W_(h)^(2) (1-f_(h))/(n_(h)) s_(h)^(2)$
]
