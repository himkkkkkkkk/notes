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
  在不放回简单随机抽样下，当$N,n$ 足够大的时候，$overline(y)$ 具有渐进正态性，进而有区间估计
  $ [overline(y) - z_(1-(alpha)/2)sqrt(hat(Var)(overline(y))) , overline(y)+z_(1+(alpha)/2) sqrt(hat(Var)(overline(y)))  ] $ 
]
