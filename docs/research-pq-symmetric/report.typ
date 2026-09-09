// Adapted from typesetting/academic/report.typ, commit 091aa83.
// Its centered title, abstract, callout, justified paragraphs, heading hierarchy,
// blue links, top table captions and centered page numbers are retained.
// Template license: typesetting/LICENSE (MIT).
// Copyright (c) 2023 LaTeX Typesetting Project Contributors
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#import "report-style.typ": *

#set document(
  title: "后量子语境下的对称密码：研究方向、热点与论文线索",
  author: "isomoes",
  description: "文献截止 2026-09-08；14 类研究方向、64 篇编号论文及 4 条官方背景资料。学术汇报与审阅版。",
  date: datetime(year: 2026, month: 9, day: 9),
)
#set page(
  paper: "a4",
  margin: (top: 22mm, bottom: 22mm, left: 22mm, right: 22mm),
  numbering: "1",
  number-align: center,
  header: context if counter(page).get().first() > 1 [
    #set text(font: sans, size: 8pt, fill: muted)
    #grid(columns: (1fr, auto), [后量子对称密码调研], [学术汇报与审阅版 · 2026-09-09])
    #v(2.5pt)
    #line(length: 100%, stroke: .4pt + rule)
  ],
  footer: context [
    #set text(font: sans, size: 8pt, fill: muted)
    #align(center)[#counter(page).display("1") / #counter(page).final().first()]
  ],
)
#set text(font: serif, size: 10.5pt, lang: "zh", region: "CN", fill: ink, hyphenate: true)
#set par(justify: true, leading: .65em, spacing: .7em)
#set heading(numbering: none)
#show heading: set text(font: sans, weight: "bold", hyphenate: false)
#show heading.where(level: 1): set text(size: 16pt)
#show heading.where(level: 2): set text(size: 12.5pt)
#show heading.where(level: 3): set text(size: 11pt, fill: accent)
#show heading.where(level: 1): set block(above: 1.3em, below: .8em)
#show heading.where(level: 2): set block(above: 1.15em, below: .55em)
#show heading.where(level: 3): set block(above: 1em, below: .45em)
#show link: set text(fill: accent)
#show cite: set text(fill: accent)
#show regex("[–—‑]"): it => [-]
#set list(indent: 1em, body-indent: .55em, spacing: .4em)
#set enum(indent: 1em, body-indent: .55em, spacing: .6em)
#show figure.where(kind: table): set block(breakable: true)
#show figure.where(kind: table): set figure.caption(position: top)
#show figure.caption: set text(font: sans, size: 9pt)

#align(center)[
  #text(font: sans, size: 10pt, fill: accent, weight: "bold")[学术汇报与审阅版]
  #v(12pt)
  #text(font: sans, size: 22pt, weight: "bold")[后量子语境下的对称密码]
  #v(6pt)
  #text(font: sans, size: 15pt)[研究方向、热点与论文线索]
  #v(12pt)
  #text(size: 10pt)[整理：isomoes　｜　版本：2026-09-09]
  #linebreak()
  #text(size: 9pt, fill: muted)[文献截止：2026-09-08　｜　近两年重点窗口：2024-09-08 至 2026-09-08]
]

#v(15pt)
#text(font: sans, size: 14pt, weight: "bold")[摘要]

本报告整理后量子语境下对称密码的主要研究路线，覆盖分组密码、流密码、公开置换、PRF/PRP、MAC、AEAD、哈希及其系统与应用扩展。基于截至 2026 年 9 月 8 日的本地文献调研，汇总 *14 类研究方向、64 篇编号研究论文*，并保留来源、发表状态、核读深度及模型限制。报告重点讨论量子攻击与具体资源估计、对称构造的量子安全证明、多用户与预计算，以及对称原语支撑的后量子应用。候选选题集中在多用户模式证明、攻击自动化和统一资源基准，供进一步精读与选题讨论。

#v(8pt)
#rect(width: 100%, stroke: .65pt + rule, fill: pale, inset: 11pt)[
  #text(font: sans, weight: "bold")[审阅提示]

  本文是面向选题的文献地图；主要证据来自摘要、元数据、发表页及部分正文核读。阅读结论时，请同时核对 *Q1/Q2 接口、理想模型、资源假设与版本*。候选问题与优先级属于调研判断，立项前仍需检查最新版本与引用链。
]

#v(8pt)
#text(font: sans, weight: "bold")[关键词：] 后量子对称密码；分组密码；量子密码分析；可证明安全；量子资源估计

#v(12pt)
#text(font: sans, size: 11pt, weight: "bold")[阅读安排]

先读第 1-6 节掌握研究地图与候选问题；第 8 节及第 10-12 节保留全部逐篇记录；末尾汇总参考文献。目录与论文来源均可点击。审阅意见可按“页码 + 章节或论文编号（如 P09）”定位。

#v(1fr)
#text(size: 8.5pt, fill: muted)[
  本版依据仓库调研全文及统一 BibTeX 排版，文献判断沿用原文截止日期。版式改编自 typesetting/academic/report.typ。
]

#pagebreak()
#outline(title: [目录], depth: 1, indent: auto)
#v(16pt)
#text(font: sans, size: 11pt, weight: "bold")[论文编号]

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [*A01-A23*　量子攻击与资源估计 · 23 篇],
  [*P01-P19*　安全证明与对称构造 · 19 篇],
  [*E01-E15*　应用扩展与邻接方向 · 15 篇],
  [*S1-S4、S6-S8*　补充研究 · 7 篇],
)
#v(8pt)
#text(size: 9pt, fill: muted)[S5 为官方标准与背景资料，不计入 64 篇研究论文。参考文献共 68 条；正文另保留尚未展开的追踪线索。]

#pagebreak()
#include "report-body.typ"

#pagebreak()
#heading(level: 1)[参考文献] <bibliography>
以下书目来自统一 BibTeX，共 68 条。编号对应正文各论文条目旁的引用；论文编号 A/P/E/S 则用于审阅定位。发表状态与版本差异以相应条目的核验说明为准。

#v(5pt)
#set text(size: 9.5pt, lang: "en")
#set par(leading: .65em, spacing: .75em, justify: false)
#bibliography("references.bib", style: "ieee", title: none, full: true)
