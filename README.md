# 数学笔记

把原来的三个仓库合并为一个仓库，各自保留完整提交历史，放在独立子目录中。

## 目录结构

| 目录 | 内容 | 来源仓库 |
| --- | --- | --- |
| `information-geo/` | 信息几何笔记 | `himkkkkkkkk/information-geo` |
| `real-analyse/` | 实分析笔记 | `himkkkkkkkk/real-analyse` |
| `stochastic-process-homework/` | 随机过程习题 | `himkkkkkkkk/stochastic-process-homework` |

## 统一模板

`template.typ` 是**全项目通用模板**，取自 `information-geo`，内容包括：

- `ilm` 封面 / 全局版式（`notes` 函数，作为 show 规则使用）
- 定理类环境：`definition`（定义）、`theorem`（定理）、`remark`（备注）、`example`（例）
- 辅助符号：`tensor`（$\otimes$）
- 矢量图：`diagram` / `node` / `edge`（来自 `fletcher`）
- `make-env`：用来在**单篇笔记内部**临时定义额外环境，不再往全局模板里堆

三篇笔记都由模板统一渲染，各自只保留自己特有的东西：

| 笔记 | 额外定义（在文档内，不进 `template.typ`） |
| --- | --- |
| `information-geo/main.typ` | 无 |
| `real-analyse/real_analyse.typ` | `lemma`、`proposition`、`proof` |
| `stochastic-process-homework/stochastic_process.typ` | `EX`（期望记号） |

定理编号按一级标题（章）清零，编号形如 `定理 1.1`。

### 新建一篇笔记

```typst
#import "../template.typ": *

#show: notes.with(title: "标题")

// 需要额外环境时，在本文内定义，例如：
#let lemma = make-env("LEM", "引理", rgb("#0e7a3d"))

= 第一章

#definition[
  正文。也可以写成 #definition[自定义标题][正文]
]
```

### 编译

模板在仓库根目录、笔记在子目录，所以要把仓库根设为 Typst 的 root：

```bash
typst compile --root . information-geo/main.typ
typst compile --root . real-analyse/real_analyse.typ
typst compile --root . stochastic-process-homework/stochastic_process.typ
```

（直接 `cd <笔记目录> && typst compile xxx.typ` 会因为模板在 root 之外而报 access denied。）
