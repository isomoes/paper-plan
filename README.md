# paper-plan

Planning and tracking research papers

## Research reports

- [后量子对称密码调研：研究方向、热点与论文记录](docs/research-pq-symmetric/survey.md) — 文献截止 2026-09-08，覆盖 14 类方向、54 篇论文；附发表状态核验、模型限制和选题建议。
- [统一 BibTeX](docs/research-pq-symmetric/references.bib) · [专题索引](docs/research-pq-symmetric/README.md)
- [学术汇报与审阅版 Typst](docs/research-pq-symmetric/report.typ)，沿用 `typesetting/academic/report.typ` 版式，含完整论文记录、目录与参考文献；编译后生成同目录的 `report.pdf`。

在仓库根目录运行 `typst compile --root . docs/research-pq-symmetric/report.typ` 即可生成 PDF；需要 Typst 和中文字体，详见[排版说明](docs/research-pq-symmetric/README.md#pdf-排版与重新生成)。Git 保留报告源文件与文档，PDF、本地转换脚本和临时文件不纳入版本控制。

## Academic paper tools

[apaper-mcp](https://github.com/ai4paper/apaper-mcp) is configured for this
repository in `.codex/config.toml`. It provides search tools for arXiv, IACR,
DBLP, Google Scholar, and CNKI, plus supported PDF downloads.

Install `uv` and have Python 3.12+ available. Codex launches the package without a version pin
through `uvx`, which manages its dependencies in the shared uv cache:

```sh
uvx apaper-mcp
```

The MCP configuration is scoped to this repository and contains no absolute
checkout paths. No repo-local virtual environment is needed. Restart Codex's MCP
servers or reopen Codex after configuration changes, with this repository trusted
so its project configuration loads.

IACR downloads use Chromium from `PATH`; set `IACR_BROWSER_EXECUTABLE` in the
server's environment for a nonstandard browser path. CNKI requires institutional
access. Tool calls have a 15-minute timeout for browser-assisted downloads.
