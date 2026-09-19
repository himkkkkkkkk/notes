#import "../template.typ": *

#show: notes.with(title: "多元统计分析课堂笔记")

= 第一节课
== 多元统计的介绍
=== 多元统计解决的问题
+ 数据可视化
+ 变量之间独立性分析
+ 假设检验
+ 保持数据信息的情况下进行数据简化（降维）或者减少数据量
+ 数据预测
+ 如何排序

=== 边际描述
考虑一个n个样本p个统计量的多元数据，用矩阵标记:
$ mat(x_(1,1),x_(1,2),#sym.dots.h,x_(1,p);
      x_(2,1),x_(2,2),#sym.dots.h,x_(2,p);
      dots.h,dots.h,dots.down,dots.h;
    x_(n,1),x_(n,2),#sym.dots.h,x_(n,p)) $

则我们有如下统计量:
#definition[
  + 均值：$ overline(x)_(k) = n^(-1)sum_(i=1)^(n) x_(i,k) $ 
  + 方差：$ s_(k,k) = n^(-1) sum_(i=1)^(n) (x_(i,k)-overline(x)_(k))^(2) $ 
  + 协方差：$ s_(j,k) = n^(-1)sum_(i=1)^(n) (x_(i,j)-overline(x)_(j))(x_(i,k)-overline(x)_(k)) $ 
  + 相关系数：$ r_(j,k) = (s_(j,k))/(sqrt(s_(j,j)) sqrt(s_(k,k))) $
]


