#set text(
  size:12pt,
  font: ("Noto Serif CJK SC","FangSong","SimHei","Maple Mono NF","DejaVu Serif")
)
#set heading(numbering: "1.")
#show heading.where(level: 1):set text(weight:"bold",size:24pt)
#show heading.where(level: 2):set text(weight:"bold",size:18pt)
#show math.union: math.union.big
#show math.inter: math.inter.big

#let lemma-counter = counter("lemma")
#let theorem-counter = counter("theorem")
#let definition-counter = counter("definition")
#let proposition-counter = counter("proposition")

#let theorem(term, caption: none) = {
  // 获取当前章节编号
  let chapter-num = context counter(heading.where(level: 1)).get().first()

  theorem-counter.step(level: 1)

  // 获取当前 theorem 编号
  let theorem-num = context theorem-counter.get().first()

  // 构建完整编号
  let full-number = if chapter-num != none {
    [#chapter-num.#theorem-num]
  } else {
    [#theorem-num]
  }

  block(
    fill: rgb("#EEF3F8"),
    inset: 6pt,
    radius: 4pt,
    stroke: rgb("#F7F9FB"),
    width: 100%,
    breakable: true,
    [
      #text(weight: "bold", size: 1.1em)[Theorem #full-number] #h(1em)
      #term
    ]
  )
}

#let lemma(term, caption: none) = {
  // 获取当前章节编号
  let chapter-num = context counter(heading.where(level: 1)).get().first()

  // 在每个新章节重置 lemma 计数器
  lemma-counter.step(level: 1)

  // 获取当前 lemma 编号
  let lemma-num = context lemma-counter.get().first()

  // 构建完整编号
  let full-number = if chapter-num != none {
    [#chapter-num.#lemma-num]
  } else {
    [#lemma-num]
  }

  block(
    fill: rgb("#EEF3F8"),
    inset: 6pt,
    radius: 4pt,
    stroke: rgb("#F7F9FB"),
    width: 100%,
    breakable: true,
    [
      #text(weight: "bold", size: 1.2em)[Lemma #full-number] #h(1em)
      #term
    ]
  )
}

#let definition(term, caption: none) = {
  // 获取当前章节编号
  let chapter-num = context counter(heading.where(level: 1)).get().first()

  definition-counter.step(level: 1)

  // 获取当前 definition 编号
  let definition-num = context definition-counter.get().first()

  // 构建完整编号
  let full-number = if chapter-num != none {
    [#chapter-num.#definition-num]
  } else {
    [#definition-num]
  }

  block(
    fill: rgb("#EEF3F8"),
    inset: 6pt,
    radius: 4pt,
    stroke: rgb("#F7F9FB"),
    width: 100%,
    breakable: true,
    [
      #text(weight: "bold", size: 1.1em)[Definition #full-number] #h(1em)
      #term
    ]
  )
}

#let proposition(term, caption: none) = {
  // 获取当前章节编号
  let chapter-num = context counter(heading.where(level: 1)).get().first()

  proposition-counter.step(level: 1)

  // 获取当前 proposition 编号
  let proposition-num = context proposition-counter.get().first()

  // 构建完整编号
  let full-number = if chapter-num != none {
    [#chapter-num.#proposition-num]
  } else {
    [#proposition-num]
  }

  block(
    fill: rgb("#EEF3F8"),
    inset: 6pt,
    radius: 4pt,
    stroke: rgb("#F7F9FB"),
    width: 100%,
    breakable: true,
    [
      #text(weight: "bold", size: 1.1em)[Proposition #full-number] #h(1em)
      #term
    ]
  )
}

#let proof(term) = {
  [#text(weight: "bold",style: "italic")[Proof.] #h(1em)
  #term
  #h(1fr) $ballot$
  ]
}

#show heading.where(level: 1): it =>{
  lemma-counter.update(0)
  theorem-counter.update(0)
  definition-counter.update(0)
  it
}

#set document(
  title:"实分析笔记",
  author:"himkkk",
  date:datetime.today()
)
#set page(
  header: [
    #set text(size:10pt)
    #align(right)[#context document.title]
  ],
  numbering: "1"
)
#show title:set text(size:30pt)
#show title:set align(center)
#title(context document.title)

#align(right)[
  #pad(right:5em)[
    *#context document.author.join(",")*\
    *#context document.date.display()*
  ]
]

= 黎曼积分的局限性
+ 黎曼积分无法处理*_不可列间断点_*的情况
  - 如函数$D(x)=cases(1\,x in QQ,0\,x in.not QQ)$
+ 黎曼积分无法处理*_无界_*函数
  - 令${r_1, r_2,dots}$为$(0,1)$中有理数的枚举,令$f_k (x)=cases(1/(sqrt(x-r_k))\,x>r_k,0\,x<=r_k)$,则
    $ f : [0,1]->RR,x|->f(x)=sum_(k=1)^infinity (f_k (x))/2^k $
    在任意分割内无界但其所围的面积有界
+ 黎曼可积函数的*_极限_*不一定黎曼可积
  - 考虑函数$ f_k (x)=cases(1\,x in {r_1,r_2,dots,r_k},0\, "otherwise") $
    其在$[0,1]$上积分为0,而$f_k stretch(->)^(k -> infinity) D$,而$D$不黎曼可积.

= 测度理论
== 研究的对象
在黎曼积分中，我们对于积分的集合(大部分是区间)并没有做过多的要求，这就导致了有一些区间无法进行积分
(如$QQ inter [0,1]$)。因此我们关心我们能进行积分(能定义面积,长度)的集合，对于这个集合，
我们希望它能进行基本的集合运算，这就是引入$sigma$代数的动机。
=== $sigma$代数
#definition[
  对于集合$X$,$cal(A)subset cal(P)(X)$是集合$X$的某些子集所构成的集合,如果满足性质:\
  - 空集$emptyset in cal(A)$
  - $A in cal(A)=>A^c in cal(A)$
  - $A_i in cal(A)(i in I)=>attach(union,b:i in I) A_i in cal(A)$,其中$I$为有限指标集\
  我们称$cal(A)"为"X$上的一个*代数*.如果在条件3中,允许$I$为可列指标集,则称$cal(A)$为$X$上的一个*$sigma$代数*.
]
*注记*.由于交和并在补集运算下对偶,因此*$sigma$代数*也满足$inter_(i in I)A_i in cal(A)$.
#lemma[
  任意给定指标集$J$,如果对于每个$j in J$,$cal(A)_j"都是"X"上的"sigma"代数"$,那么
  $ cal(A):=union_(j in J)cal(A)_j$也是$X$上的$sigma$代数.
]
#proof[验证定义即可]
#definition[
  假定$cal(M)subset cal(P)(X)$,令$Sigma(cal(M))={cal(A)|cal(A) supset cal(M)\,cal(A)$是$X$上的$sigma$代数$}$,则
  $ sigma(cal(M)):=inter_(cal(A) in Sigma(cal(M))) cal(A) $
  称为由$cal(M)$*生成的$sigma$代数*.
]
#definition[给定距离拓扑空间$X$,由$X$中一切开集所生成的$sigma$代数被称做$X$上的 *Borel代数*,记作$cal(B)(X)$.]
#proposition[$RR$上的Broel代数可以由${(-infinity,a)|a in QQ}$生成]
#proof[
  首先我们证明$cal(A)=({(-infinity,a)|a in RR})=cal(B)(RR)$,对于任意的$a,b in RR\,a<b$,有
  $ [a,b)=(-infinity,b)union (RR-(-infinity,a))in cal(A) $
  于是，
  $ (a,b)=union_(k>=1) [a+1/k, b)in cal(A) $
  这表明所有的开区间都在$cal(A)$中，因此$cal(B)(RR) = cal(A)$.\
  为了说明$cal(B)(RR)=sigma({(-infinity,a)|a in QQ})$,我们可以取递增的有理数列${q_k}_(k>=1)","q_k -> a$,则
  $ (-infinity,a) = union_(k>=1) (-infinity,q_k) $
  因此$cal(A)$的生成元落在$sigma({(-infinity,a)|a in QQ})$中，故$sigma({(-infinity,a)|a in QQ}) = cal(A)=cal(B)(RR)$.
]
=== 可测空间和可测映射
#definition[给定一个集合$X$以及其上面的一个$sigma$代数$cal(A)$,称$(X, cal(A))$为一个*可测空间*.]
#definition[
  若$(X,cal(A))","(Y,cal(B))$是两个可测空间，如果映射
  $ f:X->Y","x|->f(x) $
  对于每一个$B in cal(B)$, 有$f^(-1)(B) in cal(A)$,则称$f$是这两个可测空间之间的可测映射。
]
#definition[
  对于集合$X$,$(Y,cal(B))$为可测空间,$f:X->Y$.令
  $ f^*(cal(B)) := { f^(-1)(B) | B in cal(B) } $
  这是$X$上的$sigma$代数，称做$cal(B)$的拉回。
]
#proof[
  记$cal(A)=f^*(cal(B))$,则
  - $X=f^(-1)(Y) in cal(A)$
  - $"对任意的"A in cal(A)\,A^c = (f^(-1)(B))^c = f^(-1)(B^c) in cal(A)$
  - $union.big_(i in I) A_i = union.big_(i in I) f^(-1)(B_i) = f^(-1)(union.big_(i in I) B_i) in cal(A)$
  因此$f^*(cal(B))$是$X$上的$sigma$代数。
]
#theorem[
  如果$(X,cal(A))$上的函数$f\,g$是可测映射，那么$f plus.minus g,f g,$也是可测映射，当$g!=0$时，$f/g$也是可测映射。
]
#proof[
  考虑映射
  $ h:X->CC times CC,x|->(f(x),g(x)) $
  是可测映射，同时映射
  $ CC times CC->CC,(x,y)|->x plus.minus y "或"x y $
  也是可测的，所以他们的复合也可测。
]
#theorem[
  $(X,cal(A))$是可测空间，$(Y,d)$为距离空间，给定函数列${f_n}_(n>=1)$,其中$f_n:X->Y$是可测映射,如果$f_n$逐点收敛到$f$,
  即$f_n->f$,那么$f$也是可测映射。
]
#proof[
  任意取$Y$中的开集$U$,我们定义$Y$中的上升子集序列
  $ U_n={x in U|d(x,U^c) > 1/n} $
  则，
  $ U=lim_(n->infinity)U_n=union.big_(n>=1)U_n $
  此外，根据$f_i->f$,如果$x in f^(-1)(U_n)$,那么存在$m,"当"q>=m"时",x in f^(-1)_q (U_n)$,故
  $ f^(-1)(U)=union.big_(n>=1) f^(-1)(U_n)=union.big_(n>=1)union.big_m inter.big_(q>=m)f^(-1)_q (U_n) $
  由于每一个$f_q$都可测，则$f_q^(-1)(U_n) in cal(A)$，因此$f^(-1)(U) in cal(A)$，即$f$是可测的。
]
== 如何度量
我们对于我们要研究的对象(某个落在$sigma$代数中的集合)该如何度量，这是我们在延续黎曼积分的思想所遇到的困难。
=== 测度
#definition[
    如果$cal(A)$是$X$上的$sigma$代数,且映射$mu:cal(A)->[0,infinity]$满足
    - $mu(emptyset)=0$
    - $mu(union.big_(i in I) A_i)=sum_(i in I) mu(A_i)$,如果$A_i$之间不交
    那么$mu$称为$cal(A)$上的(非负)测度。
]
*例子:*\
- 对于可数集$X,cal(A)=cal(P)(X)$,对任意的$A in cal(A)$,定义$mu(A)="card"(A)$
- 对于任意地$(X,cal(A))$,选定$x_0 in X$,对于任意地$A in cal(A)$,
    定义$delta_(x_0)(A)=cases(1\,x_0 in A,0\,x_0 in.not A)$
#definition[
    给定测度空间$(X,cal(A),mu)$,如果$mu(X)<infinity$,则称$mu$是有限的,
    如果对于任意单调上升的序列${A_i}_(i>=1),lim_(i->infinity)A_i=X$,
    都有$mu(A_i)<infinity,i>=1$,则称$mu$为$sigma$有限的
]
显然,我们在一个相对有限的代数上构造测度比在相对无限的$sigma$代数上要容易得多,
我们希望能够将测度从一个代数上扩充到$sigma$代数上,这就是_*Caratheodory定理*_
#theorem[
    给定$X$上的代数$cal(A)$,$mu$为$cal(A)$上的$sigma$有限测度,
    那么至多存在一个$sigma(cal(A))$上的测度$mu^prime$,满足$mu^prime|_(cal(A))=mu$

    如果$mu$是有限测度,则需要补充条件:

    *条件C*: #h(0.2em) 对于任意单调下降的序列
    ${A_i}_(i>=1)subset cal(A),lim_(i->infinity)A_i=emptyset$
    且$mu(A_i)<infinity,i>=1$
    都有$lim_(i->infinity)mu(A_i)=0$

    如果$mu(X)=infinity$,还需要需要补充条件:

    *条件$C_infinity$:*#h(0.3em) 存在单调上升的序列
    ${X_i}_(i>=1)subset cal(A),lim_(i->infinity)X_i=X$且
    $mu(X_i)<infinity,i>=1$,满足对于任意地$A in cal(A)$,$mu(A)=infinity$,
    都有$lim_(i->infinity)(X_i inter A)=infinity$
]
#proof[

]
