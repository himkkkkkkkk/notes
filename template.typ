// 本项目统一的 Typst 模板（取自 information-geo）。
//
// 用法：在每篇笔记开头写
//   #import "../template.typ": *
//   #show: notes.with(title: "标题")
//
// 之后即可直接使用 definition / theorem / proposition / remark / example / proof / tensor，
// 以及 fletcher 的 diagram / node / edge。

#import "@preview/ilm:0.1.2": ilm
#import "@preview/fletcher:0.5.8": diagram, node, edge

#let tensor = $times.o$

// 内积：$ ip(v, w) $ / $ ip(v) $ / $ ip(v, w)_(cal(H)) $ / $ ip(v, w)^2 $
#let ip(..args) = $lr(chevron.l #args.pos().join(", ") chevron.r)$

// 对角矩阵：$ diag(a, b, c) $，非对角元留空，也支持 $ diag(lambda_1, dots, lambda_n) $
#let diag(..entries) = {
  let v = entries.pos()
  let n = v.len()
  math.mat(..range(n).map(i => range(n).map(j => if i == j { v.at(i) } else { [] })))
}

// 定理环境编号：每章(= 一级标题)清零
#let thmctr = counter("thm")

// 是否处于附录（由 #appendix 置位），定理环境据此显示「定义 A.1」。
#let appx = state("appx", false)

// 定理环境：语法沿用之前的模板（#名[正文] 或 #名[标题][正文]）
#let make-env(abbr, label, color) = (..args) => {
  // 计数器自增必须在 context 之外完成，否则 context 内部的 get/update
  // 会互相干扰，导致过若干章后编号不再增长（重复为同一个数）。
  thmctr.step()
  context {
    let (title, body) = if args.pos().len() >= 2 {
      (args.pos().at(0), args.pos().at(1))
    } else {
      (none, args.pos().at(0))
    }
    let thmnum = thmctr.get().first()
    // 正文用数字（1 -> "1"），附录用字母（1 -> "A"）。
    let sec = context {
      let n = counter(heading).at(here()).at(0, default: 0)
      if appx.get() { numbering("A", n) } else { str(n) }
    }
    block(
      width: 100%,
      fill: luma(250),
      stroke: (left: 2.5pt + color),
      inset: (x: 1.2em, y: 0.7em),
      radius: 3pt,
    )[
      #text(weight: "bold", size: 0.95em, fill: color)[#label #sec.#thmnum]#h(1em)
      #if title != none { strong[#title] }
      #v(0.35em)
      #body
    ]
  }
}
#let definition = make-env("DEF", "定义", rgb("#b45309"))
#let theorem = make-env("THM", "定理", rgb("#1e3a8a"))
#let remark = make-env("REM", "备注", rgb("#475569"))
#let example = make-env("EX", "例", rgb("#0e7a3d"))
// 证明：粗体「证：」开头，右对齐方块结尾。
#let proof(body) = block(
  width: 100%,
  inset: (x: 1.2em, y: 0.7em),
)[
  #text(weight: "bold")[证：]#h(0.4em)
  #body
  #h(1fr) $square$
]
#let proposition = make-env("PP","性质",rgb("#477777"))



// 附录：放在正文最后。内部标题自动编号 A、A.1…，且与正文分开计数。
//   #appendix[
//     = 附录
//     == 一些细节
//   ]
#let appendix(body) = {
  appx.update(true)
  set heading(numbering: (..n) => numbering("A.1", ..n.pos()))
  counter(heading).update(0)
  body
}

// 文档整体设置 + ilm 封面。作为 show 规则使用：
//   #show: notes.with(title: "标题")
#let notes(body, title: "笔记", author: "himkkk") = {
  set text(font: ("New Computer Modern", "IBM Plex Sans SC"))
  show heading.where(level: 1): it => {
    thmctr.update(0)
    it
  }
  show: ilm.with(
    title: title,
    author: author,
    date: datetime.today(),
  )
  // 取消 ilm 默认的公式编号（(1)、(2)…）
  set math.equation(numbering: none)
  // 列表项里插入根式/分式/求和等较高的行内公式时，默认间距(1em)
  // 会让相邻项上下重叠，这里加大列表项间距。
  set list(spacing: 1.5em)
  set enum(spacing: 1.5em)
  body
}
