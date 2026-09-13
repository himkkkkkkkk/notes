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

定理编号按一级标题（章）清零，编号形如 `定理 1.1`。

### 新建/迁移一篇笔记

```typst
#import "../template.typ": *

#show: notes.with(title: "标题")

= 第一章

#definition[
  正文。也可以写成 #definition[自定义标题][正文]
]
```

### 编译

因为模板在仓库根目录、笔记在子目录，需要把仓库根设为 Typst 的 root：

```bash
typst compile --root . information-geo/main.typ
```

（直接 `cd information-geo && typst compile main.typ` 会因为模板在 root 之外而报 access denied。）

## 说明

- `real-analyse/`、`stochastic-process-homework/` 暂时保留原有排版（各自的前导代码与宏），
  内容里大量使用了它们自己的 `theorem` / `EX` 等宏；如需统一到 `template.typ`，需要同步改写
  正文中的宏调用，属于内容级改动，尚未进行。
