#import "@preview/homiework:0.1.0": homework
#import "../snippet.typ":*

#show: homework.with(
course: "Random Sampling",
  semester: "秋 2026",
  number: "2",
  author: "冯裕凯",
  date: datetime.today(),
)

== 3.6

某居民区共有 10000 户，现用抽样调查估计该区居民用水量。采用简单随机抽样抽选了 100 户，得 $overline(y) = 12.5$，$s^2 = 1252$。估计该居民区的总用水量 95% 的置信区间。若要求估计的相对误差不超过 20%，试问应抽多少户作样本？

*解*：

区间估计为$ [ybar - z_(1-alpha / 2)sqrt(Var ybar),ybar + z_(1-alpha/2)sqrt(Var ybar)] = [5.9207,19.0793] $

由于$ frac(ybar - overline(Y),sqrt(Var overline(y))) ~> cal(N)(0,1) $
故，
$ 0.95 >= PP(|frac(ybar - overline(Y),overline(Y))|<=d) = PP(abs(ybar - overline(Y))<=d abs(overline(Y))) $
从而，
$ frac(1-f,n) s^(2) <= (frac(d abs(overline(Y)),z_(1-alpha/2)))^(2) $
解得，$n=715>=714.5603$


== 3.13

假设总体中每个单元有两个指标 $Y_i$ 和 $X_i$，$i = 1, dots, N$，记 $overline(y)$，$overline(x)$ 为相应的简单随机样本的均值。试证样本协方差

$ s_(y x) = 1 / (n - 1) sum_(i=1)^n (y_i - overline(y)) (x_i - overline(x)) $

是总体协方差

$ S_(y x) = 1 / (N - 1) sum_(i=1)^N (Y_i - overline(Y)) (X_i - overline(X)) $

的无偏估计。

*解*:

$ EE s_(y x) &= (1)/(n-1) EE sum_(i=1)^(n) [(y_(i)-overline(y))(x_(i) - overline(x))] \ &= (1)/(n-1) EE [sum_(i=1)^(n) x_(i)y_(i) - n overline(x)overline(y)] \ &= (1)/(n-1) (sum_(i=1)^(N) X_(i)Y_(i) EE alpha_(i) - n EE overline(x)overline(y)) \ &= (1)/(n-1) [sum_(i=1)^(N) X_(i)Y_(i)(n)/(N) -(1)/n (sum_(i=1)^(N) X_(i)Y_(i) (n)/N + sum_(i!=j) X_(i)Y_(j)(n(n-1))/(N(N-1)))] \ &= (1)/N sum_(i=1)^(N) X_(i)Y_(i) - (1)/(N(N-1))sum_(i!=j) X_(i)Y_(j) \ &= S_(y x) \ $ 

== 3.14

设 $overline(y)$ 是从总体 ${Y_1, dots, Y_N}$ 中抽取的样本量为 $n$ 的简单随机样本均值，$overline(y)_(n_1)$ 是从该样本中抽取的样本量为 $n_1$ 的简单随机子样本均值，$overline(y)_(n_2)$ 是剩余的样本单元的均值。试证：

$ "Cov"(overline(y)_(n_1), overline(y)_(n_2)) = - S_y^2 / N $

*解*:

考虑在样本给定的条件下,记$alpha_(i)$ 标记第$i$ 个样本是抽取到$n_(1)$ 的样本。则
$ Cov (overline(y)_(n_(1)),overline(y)_(n_(2))) &=(1)/(n_(1)n_2) sum_(i,j) y_(i)y_(j) Cov(alpha_(i),1-alpha_(j)) \ &= -(1)/n s_(y)^(2) $ 
其中用到了$alpha_(i)(1-alpha_(i))=0$ 恒成立。
根据全方差公式，我们有
$ Cov(overline(y)_(n_1),overline(y)_(n_2)) &= EE [-(1)/n s_(y)^(2)] + Cov(EE overline(y)_(n_1)|y,EE overline(y)_(n_2)|y) \ &= -(1)/n S_(y)^(2) + Cov(overline(y),overline(y)) \ &= -(1)/n S_(y)^(2) + (1-f)/n S_(y)^(2) \ &= -(1)/N S_(y)^(2) \ $ 

== 5.7

某养兔专业户购进 100 只兔，平均重量为 3.1 磅，随机抽取了 10 只兔为样本，记录其重量，经过两个月的饲养，再次称重，其资料如下：

#table(
  columns: 3,
  align: center,
  table.header([样本], [原重（磅）], [现重（磅）]),
  [1], [3.2], [4.1],
  [2], [3.0], [4.0],
  [3], [2.9], [4.1],
  [4], [2.8], [3.9],
  [5], [2.8], [3.7],
  [6], [3.1], [4.1],
  [7], [3.0], [4.2],
  [8], [3.2], [4.1],
  [9], [2.9], [3.9],
  [10], [2.8], [3.8],
)

要求：

1) 用回归估计法估计每只兔现有平均重量，并计算其方差的近似估计量；

2) 若每只兔的平均重量允许最大误差为 0.05 磅，置信度为 95%，应抽取多少只兔为样本？

*解*:

$hat(beta) = S_(x y)/S_(x)^(2) = 0.7560$,故$y = 3.99 + 0.756 times (x - 2.97)$

$hat(Var) = (1-f)/(n)(n-1)/(n-2)s_(y)^(2)(1-rho^(2)) = (1-f)/(10) (9)/8 0.0254 (1-0.744^(2)) = 0.0128 (1-f)/(n) = 0.0115$

$(0.05)/(z_(1-alpha)) ^(2) >= Var = (1-f)/(n) s^(2) = (1-f)/(n) 0.0128$ 
解得，$n = 17 >=16.4362$

== 5.9

某县欲调查某种农作物的产量，由于平原和山区的产量有差别，故拟划分为平原和山区两层采用分层抽样。全部 120 个平原村上年总产量为 24500（百斤）；全部 180 个山区村上年总产量为 21200（百斤）。现用简单随机抽样抽取 6 个平原村，9 个山区村，样本村上年及当年的产量如下：

#table(
  columns: 3,
  align: center,
  table.header(
    table.cell(colspan: 3)[平原],
  ),
  table.header([样本], [上年产量（百斤）], [当年产量（百斤）]),
  [1], [204], [210],
  [2], [143], [160],
  [3], [82], [75],
  [4], [256], [280],
  [5], [275], [300],
  [6], [198], [190],
)

#table(
  columns: 3,
  align: center,
  table.header(
    table.cell(colspan: 3)[山区],
  ),
  table.header([样本], [上年产量（百斤）], [当年产量（百斤）]),
  [1], [137], [150],
  [2], [189], [200],
  [3], [119], [125],
  [4], [63], [60],
  [5], [103], [110],
  [6], [107], [100],
  [7], [159], [180],
  [8], [63], [75],
  [9], [87], [90],
)

试用分别比估计与联合比估计分别估计当年的总产量，给出估计量的标准误，并对上述两种结果进行比较和分析。
