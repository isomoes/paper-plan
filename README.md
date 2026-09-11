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

- [Post-quantum symmetric cryptography survey: research directions, trends, and paper records](docs/research-pq-symmetric/survey.md) — Literature through 2026-09-08, covering 14 research areas and 64 papers, with publication status checks, model limitations, and topic recommendations.
- [Consolidated BibTeX](docs/research-pq-symmetric/references.bib) · [Topic index](docs/research-pq-symmetric/README.md)
- [Typst report for academic presentations and review](docs/research-pq-symmetric/report.typ), using the `typesetting/academic/report.typ` layout, includes complete paper records, a table of contents, and references. Compiling produces `report.pdf` in the same directory.
- [Research group presentation slides](docs/research-pq-symmetric/presentation.typ), using the Touying Simple theme from `typesetting/presentations/simple.typ`: Chinese-language slides in 16:9 format, with 16 main slides and 4 appendix slides, suitable for a 15–20 minute presentation. Includes speaker notes and paper links. See the [compilation instructions](docs/research-pq-symmetric/README.md#%E7%A0%94%E7%A9%B6%E7%BB%84%E5%88%86%E4%BA%AB%E5%B9%BB%E7%81%AF%E7%89%87).

Run `typst compile --root . docs/research-pq-symmetric/report.typ` from the repository root to generate the PDF. Typst and Chinese fonts are required; see the [typesetting instructions](docs/research-pq-symmetric/README.md#pdf-%E6%8E%92%E7%89%88%E4%B8%8E%E9%87%8D%E6%96%B0%E7%94%9F%E6%88%90). Git tracks the report sources and documentation; PDFs, local conversion scripts, and temporary files are excluded from version control.

## Academic paper tools

[apaper-mcp](https://github.com/ai4paper/apaper-mcp) is configured for this
repository in `.codex/config.toml`. It provides search tools for arXiv, IACR,
DBLP, Google Scholar, and CNKI, plus supported PDF downloads.
