// ============================================================
// 统计宏.typ —— 统计课程公共 prelude
// 覆盖：多元统计分析 / 抽样调查 / 实验设计 常用记号
// 用法：笔记开头加一行
//   #import "统计宏.typ": *
// ============================================================

// ---------- 统计算子（正体、带算子间距） ----------
#let E = math.op("E")         // $E[X]$
#let Var = math.op("Var")     // $Var(X)$
#let Cov = math.op("Cov")     // $Cov(X, Y)$
#let Corr = math.op("Corr")   // $Corr(X, Y)$
#let MSE = math.op("MSE")
#let SS = math.op("SS")       // 平方和 $SS_T = SS_A + SS_E$
#let MS = math.op("MS")       // 均方 $F = MS_A / MS_E$
#let tr = math.op("tr")       // 迹 $tr(Sigma)$
#let rk = math.op("rank")     // 秩
#let plim = math.op("plim")   // 概率极限 $plim_(n -> infinity) hat(theta)_n$
#let deff = math.op("deff")   // 设计效应

// ---------- 常用符号 ----------
#let Nor = math.cal("N")              // 正态分布记号 $X ~ Nor(mu, sigma^2)$
#let iid = $limits(tilde)^"i.i.d."$   // 独立同分布 $epsilon iid Nor(0, sigma^2)$
#let TT = math.upright("T")           // 转置 $bold(S)^TT$
#let dd = math.upright("d")           // 微分 $integral f(x) dd x$
#let ind = math.bb("1")               // 示性函数 $ind_A$
#let RR = math.bb("R")                // 实数集 $RR^p$
#let bv(x) = math.bold(x)             // 向量/矩阵 $bv(x), bv(Sigma)$

// ---------- 高频组合 ----------
#let xbar = $overline(bold(x))$       // 样本均值向量
#let ybar = $overline(y)$             // 样本均值
#let maha(x, mu) = $(#x - #mu)^TT Sigma^(-1) (#x - #mu)$  // Mahalanobis 距离核

// ---------- 用法示例 ----------
// $X ~ Mvn$ 这种多元正态直接写：$bold(X) ~ Nor_p(bold(mu), Sigma)$
// 条件期望：$E[X mid Y]$
// 渐近正态：$sqrt(n)(hat(theta) - theta) op("d") -> Nor(0, sigma^2)$
