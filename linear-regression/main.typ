#import "../template.typ": *

#show: notes.with(title:"线性模型课堂讲义")

= 第一节课：矩阵和代数
== 矩阵的迹和特征向量
#definition[
  一个矩阵$A = (a_(i j))$的迹为$tr(A) = sum_(i=1)^(n)a_(i i)$.
]
#proposition[
矩阵的迹具有如下性质，
+ $tr(A+B) = tr(A)+tr(B)$
+ $tr(A B) = tr(B A)$
]
#proof[
  1显然

  2: $ tr(A B) &= sum_(i=1)^(n) (A B)_(i i)\ &= sum_(i=1)^(n) sum_(k=1)^(n) a_(i k)b_(k i) \ &= sum_(k=1)^(n) sum_(i=1)^(n) b_(k i)a_(i k) \ &= tr(B A) \  $
]

#proposition[
  对于n阶方阵$A_(n times n)$ 配备有$ n$个特征值$lambda_(i),i=1,2,#sym.dots.h,n$ 则
  $ tr(A) = sum_(i=1)^(n) lambda_(i) quad "and" quad product_(i=1)^(n) lambda_(i) $
]

#proof[
  $f(lambda) = det(lambda I - A)$,运用富比尼原理，对行列式展开取$n-1$ 次项为
  $ product_(i=1)^(n) (lambda - a_(i,i)) = lambda^(n) - sum_(i=1)^(n) a_(i,i) lambda^(n-1) $
  由于$lambda_(i),i=1,2,#sym.dots.h,n$ 为该方程的根，因此可以将该多项式函数分解为,
  $ f(lambda) = product_(i=1)^(n) (lambda-lambda_(i))=lambda^(n)-sum_(i=1)^(n) lambda_(i) lambda^(n-1) $
  对比系数得$sum_(i=1)^(n) a_(i,i) = sum_(i=1)^(n) lambda_(i)$,即$tr(A) = sum_(i=1)^(n) lambda_(i)$ 

  对于$det$,我们进行jordan分解$A=P^(-1) J P$,故$det(A) = det(P^(-1) J P) = det(P^(-1))det(J)det(P) = det(J) = product_(i=1)^(n) lambda_(i) $
]

#remark[
  哈皮言，杀机焉用牛刀，他认为使用jordan分解在这里过于高级。
]

== 第二次课：
