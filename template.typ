// 本项目统一的 Typst 模板（取自 information-geo）。
//
// 用法：在每篇笔记开头写
//   #import "../template.typ": *
//   #show: notes.with(title: "标题")
//
// 之后即可直接使用 definition / theorem / remark / example / tensor，
// 以及 fletcher 的 diagram / node / edge。

#import "@preview/ilm:0.1.2": ilm
#import "@preview/fletcher:0.5.8": diagram, node, edge

#let tensor = $times.o$

// 定理环境编号：每章(= 一级标题)清零
#let thmctr = counter("thm")

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
    let sec = counter(heading).at(here()).at(0, default: 0)
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
  body
}
