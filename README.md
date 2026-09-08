# paper-plan

Planning and tracking research papers

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
