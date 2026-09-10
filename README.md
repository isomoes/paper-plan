# paper-plan

Planning and tracking research papers

## Research projects

Two public research repositories grow out of the post-quantum symmetric cryptography survey. They are tracked here as Git submodules.

| Project | Scope | Documentation |
|---|---|---|
| [Q1 Grover Oracle Optimization](https://github.com/isomoes/q1-grover-oracle) | Optimize complete quantum key-search oracles under explicit Q1 and resource assumptions | [Research plan](https://github.com/isomoes/q1-grover-oracle/blob/main/docs/research-plan.md) · [Papers](https://github.com/isomoes/q1-grover-oracle/blob/main/docs/reference.md) |
| [Quantum Symmetric Distinguishers](https://github.com/isomoes/quantum-symmetric-distinguishers) | Search for and independently validate structural distinguishers with explicit Q1/Q2 models | [Research plan](https://github.com/isomoes/quantum-symmetric-distinguishers/blob/main/docs/research-plan.md) · [Papers](https://github.com/isomoes/quantum-symmetric-distinguishers/blob/main/docs/reference.md) |

Initialize all submodules after cloning:

```sh
git submodule update --init --recursive
```

Local checkouts are `research/q1-grover-oracle/` and `research/quantum-symmetric-distinguishers/`. Both projects begin with research plans, annotated references, BibTeX, and experiment templates. Implementations and research results are subsequent milestones.

## Research reports

- [后量子对称密码调研：研究方向、热点与论文记录](docs/research-pq-symmetric/survey.md) — 文献截止 2026-09-08，覆盖 14 类方向、64 篇论文；附发表状态核验、模型限制和选题建议。
- [统一 BibTeX](docs/research-pq-symmetric/references.bib) · [专题索引](docs/research-pq-symmetric/README.md)
- [学术汇报与审阅版 Typst](docs/research-pq-symmetric/report.typ)，沿用 `typesetting/academic/report.typ` 版式，含完整论文记录、目录与参考文献；编译后生成同目录的 `report.pdf`。
- [研究组分享幻灯片](docs/research-pq-symmetric/presentation.typ)，沿用 `typesetting/presentations/simple.typ` 的 Touying Simple 主题；中文 16:9，16 页主讲与 4 页附录，适合 15-20 分钟分享。含讲者备注与论文链接，[编译说明](docs/research-pq-symmetric/README.md#研究组分享幻灯片)。

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
