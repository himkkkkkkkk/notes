#import "../template.typ": *

#show: notes.with(title: "信息几何笔记")

= 一些需要的几何基础

== 切向量、余切向量以及切空间和余切空间

流形上的向量由如下性质定义：
#definition[
  记$cal(F)(M)$为微分流形上的光滑标量场，即所有$f:M->bb(R)$的函数所构成的集合。

  则微分流形上$p$点所对应的切向量为$v_(p):cal(F)(M)->bb(R)$满足如下性质：

  + $v_(p)(alpha f + beta g) = alpha v_(p) f + beta v_(p)g$
  + $v_(p)(f g) = f(p) v_(p)(g) + g(p) v_(p)(f)$
]

由于线性，$p$点处的切向量构成了一个向量空间。我们记作$T_(p)M$.

#remark[
  在分析中，我们定义切向量的方式如下：

  记$cal(L)$为经过所有$p$点的曲线集合，即$cal(L) = {gamma:[0,1]->M|gamma (0) = p in M}$

  则$p$点的切向量为所有可能的$gamma^(')(0)$.(这里是粗略的说明，严谨的定义应该是商完后的等价类)
]

由于切向量能够构成向量空间，我们能够自然的定义出来余切向量，即
#definition[
  $p$点处的余切向量$v_(p)^(*):T_(p)M->bb(R)$满足如下性质：
  $v_(p)^(*) (alpha v_(p)_(1) + beta v_(p)_(2)) =  alpha v_(p)^(*)(v_(p)_(1)) + beta v_(p)^(*)(v_(p)_(2))$
]

同理，余切向量能够构成余切向量空间，记作$T^(*)_(p)M$.

#remark[
  点$p$关于标量场$f$的微分$(dif f)|_(p)$是$p$点的余切向量，满足：

  $ (dif f)|_(p) (v_(p)) = v_(p)(f) $
]

== 张量积与张量、张量场

我们需要一些简单的张量知识，我们并不太需要从一些莫名其妙的坐标变换去定义张量积，只需要了解其数学本质。
我们通过泛性质去定义张量积（泛性质是范畴论的术语，指的是一个对象可以由其满足的性质来定义，更一般地说，终对象和始对象在差距一个同构的情况下是唯一的）

#definition[
  存在$F$向量空间$L_("univ")$连同双线性映射$B_("univ"):V times W -> L_("univ")$,使得对于所有的向量空间$L$和双线性映射$B:V times W->L$,存在唯一的$phi$,使下图交换：
#diagram(
  node((0,0),$V times W$,name: <a>),
  node((1,0),$L_("univ")$,name:<b>),
  node((1,1),$L$,name:<c>),
  edge(<a>,<b>,$B_("univ")$,"->"),
  edge(<b>,<c>,$exists ! phi$,"->",label-side: left),
  edge(<a>,<c>,$B$,"->"),
)

我们称这样的$B_("univ")$为张量积。
]
张量积的性质如下：
+ _函子性_：对任意的一族线性映射$f_i:V_(i)->W_(i)$,都诱导了张量积之间的线性映射
$ f_(1) tensor f_(2) tensor dots tensor f_(n):V_(1) tensor V_(2) tensor dots tensor V_(n)->W_(1) tensor W_(2) tensor dots tensor W_(n) $
+ _结合约束_: 存在自然同构$V_(1)tensor (V_(2) tensor V_(3)) tilde.eq V_(1) tensor V_(2) tensor V_(3) tilde.eq (V_(1) tensor V_(2)) tensor V_(3)$
+ _幺约束_：有自然同构$F tensor V tilde.eq V tilde.eq V tensor F$
+ _交换约束_：存在自然同构$V tensor W tilde.eq W tensor V$

#definition[
  我们称$V^(tensor n) tensor (V^(*))^(tensor m)$为$(n,m)$阶张量。
]

#definition[
  $(n,m)$型张量场是指如下映射：$T(M)^(times n) times (T^(*)(M))^(times m) -> cal(F)(M)$,$M$上的$(n,m)$型张量场的全体我们记作$T_(m)^(n)(M)$
]

#remark[
  很明显，由于$T(M),T^(*)(M)$都是向量空间并且$cal(F)(M)$也是向量空间，故上述定义给出了一个张量积的定义，张量场是（不严谨的说）这些张量积的全体。
]

#definition[
  缩并运算是指如下映射$C:V^(*) times V -> F$,对于$(p,q),p,q>=1$的张量，缩并运算是将第一个张量位取出进行缩并运算，即
  $ V^(tensor p) tensor (V^(*))^(q) tilde.eq (V tensor V^(*)) tensor (V^(tensor (p-1)) tensor (V^(*))^(tensor (q-1))) -> V^(tensor (p-1)) tensor (V^(*))^(tensor (q-1)) $ 
]


== 协变导数与联络、平移与测地线

我们在分析中已经学习过了如何对一个（多元）函数（向量）求微分，然而在流形上，在$p$处的向量与在$q$处的向量并不在同一个空间中。自然也无法进行求微分运算。
这是非常可怕的一件事！想想物理中的加速度就需要求$t$时刻和$t+epsilon$时刻的速度向量的差值（微分）。

为了能够在不同的切空间之间定义微分运算，我们需要设法将$p$处的切向量平移(parallel transport)到$q$处，为了达成这个目标，我们需要联络，而联络可以由协变导数来刻画。

#definition[
  协变导数$Delta_(W):T_(n)^(m)->T_(n)^(m)$是指满足如下性质的运算：
  + 线性：$Delta_(W)(lambda A + mu B) = lambda Delta_(W)A + mu Delta_(W)B$
  + 对$W$的$cal(F)$线性：$Delta_(V+f W) = Delta_(V)+ f Delta_(W),f in cal(F)$
  + 莱布尼兹率：$Delta_(W)(A tensor B)=(Delta_(W)A)tensor B + A tensor (Delta_(W)B)$
  + 与缩并运算对易：$Delta_(W) C = C Delta_(W)$
  + $Delta_(W)f = W F$
]
考虑一个特殊的情况$Delta_(e_(k))e_(j)$,表示$e_(j)$沿着$e_(k)$方向协同变化的导数。其
结果也是向量场，故可以用向量场的基表示（虽然整个运算并不依赖基的选择，但是为了直观，我们会采用局部座标系）
$ Delta_(e_(k))e_(j) eq.def Delta_(k)e_(j) = Gamma_(j k)^(i)e_(i) $
在这里即以后，如没有特殊说明，都使用爱因斯坦求和约定。

我们用两个例子来说明。
#example[
  计算切向量场$A^(j)partial_(j)$的协变导数$Delta_(W)A$,

  解：$ Delta_(W)A &= Delta_(W^(k)partial_(k))(A^(j)partial_(j))\
                  &=W^(k)Delta_(partial_(k))(A^(j)partial_(j))\
                  &=W^(k)(Delta_(partial_(k))A^(j)partial_(j) + A^(j)Delta_(partial_(k))partial_(j))\
                  &=W^(k)(partial_(k)A^(j)partial_(j) + A^(j)Gamma_("jk")^(i)partial_(i))\
                  &=W^(k)(partial_(k)A^(i)+A^(j)Gamma_("jk")^(i))partial_(i) $
]

#example[
  求余切向量基的协变导数$Delta_(k)(dif x^(j))$

  解：$Delta_(k)(dif x^(j) partial_(i)) = Delta_(k)(dif x^(j)) partial_(i) + dif x^(j) Delta_(k)partial_(i)$
  由于等式左边进行缩并运算后是常值，故$ 0 = Delta_(k)(dif x^(j)) partial_(i) + dif x^(j)Gamma_(i k)^(l) partial_(l) $

  因此，$ -Gamma_(i k)^(j) = Delta_(k)(dif x^(j)) partial_(i) $
  即$Delta_(k)(dif x^(j)) =-Gamma_(i k)^(j) dif x^(i)$
]

定义了联络，我们就能定义平移应该是怎么样的。我们希望向量在平移时不发生改变，因此他的导数应该为0.
#definition[
  给定$M$上的一条曲线$gamma:[0,1]->M$以及$gamma(0)$处的一个切向量$V_(0) in T_(gamma(0))M$,定义$V_(0)$沿着曲线$gamma$的平移$V(t)$满足下述方程:
  $ Delta_(gamma^(prime)(t))V(t)=0 $
  其中$t in [0,1],V(0)=V_(0)$
]

在给定坐标下，根据上述的例子，我们得到
#example[
  $ 0&=Delta_(gamma^(prime)(t))V(t)\
      &=(dif gamma^(k))/(dif t) (partial_(k)V^(i)+V^(j)Gamma_(j k)^(i)) partial_(i)\
      &=((dif V^(i))/(dif t) + (dif gamma^(k))/(dif t)V^(j)Gamma_(j k)^(i))partial_(i) $

  因此，$(dif V^(i))/(dif t) + (dif gamma^(k))/(dif t)V^(j)Gamma_(j k)^(i)=0$
]

在流形上我们能够定义向量如何进行平移了，但是我们如何判断一条曲线是否足够的直？我们需要定义直线。回顾牛顿定律，不受外力的质点要么静止要么做匀速直线运动，我们用类似的想法定义直线。
#definition[
  若流形上的曲线$gamma$加速度处处为0，则称为直线，即直线$gamma$符合如下方程：
  $ Delta_(gamma^(prime)(t))gamma^(prime)(t)=0 $
]

在给定坐标的情况下，我们能类似的得到方程$ (dif^(2) gamma^(i))/(dif t^(2)) = -Gamma_(j k)^(i) (dif gamma^(j))/(dif t) (dif gamma^(k))/(dif t) $


