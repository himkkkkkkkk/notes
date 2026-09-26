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
  由于 $dim ip(v_(1)) = k$，于是 $A$ 上还有 $n-1$ 个特征值和特征向量。
]
