# 后量子对称密码调研

文献截点：2026-09-08；整理完成：2026-09-09。

- **[完整调研报告](survey.md)**：14 类研究方向、64 篇编号研究论文、近期观察与选题建议，所有逐篇记录已汇总到一个文档。
- **[学术汇报与审阅版 Typst](report.typ)**：编译后在同目录生成 `report.pdf`。版式为 A4，保留完整调研内容，含可点击目录、64 篇论文书签、11 张表格与 68 条参考文献；文献截点仍为 2026-09-08。
- **[统一 BibTeX](references.bib)**：64 篇论文及 4 条官方背景资料。根据核验的官方元数据转录；DBLP 原始导出失败处已明确说明。
- **[并行扩展检索与核验记录](search-expansion-2026-09-09.md)**：MCP/在线搜索的实际结果、新增 10 篇逐条证据与 2 条原有引用修订；也已收入总报告第 13 节。
- 专题源文件：[量子攻击与资源估计](attacks-notes.md)、[安全证明与构造](proofs-notes.md)、[应用扩展](applications-notes.md)。
- 分组书目：[attacks.bib](attacks.bib)、[proofs.bib](proofs.bib)、[applications.bib](applications.bib)、[supplement.bib](supplement.bib)。
- 原始检索日志可在本地 `evidence/` 目录留存，已由 Git 忽略；正式报告与 BibTeX 保留引用来源和核验结论。

报告区分正式发表、作者自报录用与预印本，注明 Q1/Q2、理想模型、资源假设、版本变化和核读深度。它是主要研究路线的选题地图，不声称穷尽所有论文，也不把摘要核读当作证明或实验复现。

## PDF 排版与重新生成

版式改编自子仓库的 [`academic/report.typ`](../../typesetting/academic/report.typ)（模板版本 `091aa83`），保留居中标题、摘要、提示框、两端对齐、蓝色引用、表格上方标题和居中页码，并为长篇综述加入页眉、目录、跨页表头与论文条目整体分页。使用编号参考文献便于定位，正文仍保留 A/P/E/S 论文编号。子仓库模板无需修改。

- [`report.typ`](report.typ)：报告入口，含封面、目录、样式设置与参考文献。
- [`report-style.typ`](report-style.typ)：字体、颜色、表格及行内代码样式。
- [`report-body.typ`](report-body.typ)：从 `survey.md` 转换的排版正文，作为独立编译所需的源文件纳入 Git；修改调研内容后应同步更新该文件。

本版使用 Typst 0.15.1、思源宋体（`Source Han Serif`）、思源黑体（`Source Han Sans`）、Libertinus Serif、Liberation Sans 和 Source Code Pro。PDF 已嵌入字体，接收者无需安装字体；重新编译时需要这些字体才能保持相同版面。

在仓库根目录直接使用 Typst 编译，无需额外脚本：

```sh
typst compile --root . docs/research-pq-symmetric/report.typ
```

输出为 `docs/research-pq-symmetric/report.pdf`，与 `report.typ` 同目录。PDF 用于本地分享和审阅，已由 `.gitignore` 排除。

Markdown 与 BibTeX 是内容来源；转换只增加摘要导读、目录、引用编号与排版，不更新文献判断。专题文件和书目链接在 PDF 中转为相应章节或参考文献的内部跳转，原始论文的外部链接全部保留。审阅反馈可按“PDF 页码 + 章节/论文编号”记录。

## Git 提交范围

| 纳入 Git | 仅本地保留，不提交 |
|---|---|
| 调研 Markdown、BibTeX、三个 `report*.typ` 源文件 | 编译得到的 `report.pdf` 等 PDF 文件 |
| README 与 `.gitignore` | 本地转换脚本 `scripts/build_research_report.py`、Python 缓存 |
| `typesetting` 子仓库指针 | `tmp/pdfs/` 渲染检查产物、`evidence/` 原始检索日志、`local-pdf/` 下载文件 |

提交的 Typst 源文件与书目已足够编译报告；本地转换脚本只用于辅助同步 Markdown，不是仓库的构建依赖。
