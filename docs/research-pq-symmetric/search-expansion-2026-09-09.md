# 并行扩展检索与引用核验记录

核验日期：2026-09-09（Asia/Taipei）；沿用文献截点 2026-09-08。原有 54 篇基础上新增 10 篇，合计 64 篇研究论文及 4 条官方背景资料。本记录说明本轮实际调用、采用理由及字段核验边界；不宣称重审全部旧文献或复现论文证明。

## 实际检索渠道

独立查询通过 `functions.exec` 中的 `Promise.allSettled` 并发发出；精确标题核验依赖前一轮结果，随后分批执行。

- **DBLP MCP**：`search_dblp_papers`，查询 `post quantum symmetric`（2023–2026，15 条上限，带 BibTeX）与 `quantum collision`（8 条上限，不带 BibTeX）。两次均返回 JSON 解析失败；未取得原始 DBLP BibTeX。
- **Google Scholar MCP**：`search_google_scholar_papers`，查询 `"quantum" "symmetric" cryptography`（2024–2026，12 条上限），返回空。没有把它记为成功的引用核验来源。
- **arXiv MCP**：`search_arxiv_papers`，窄查询 `(all:"symmetric cryptography" OR all:"symmetric cryptanalysis") AND (all:quantum)` 返回空；宽查询 `quantum AES` 返回 10 条，夹杂量子计算、部署与无关主题，逐项筛选。A20 最终由在线搜索发现，并直接核 arXiv 原始页面。
- **IACR MCP**：`search_iacr_papers` 的 `quantum collision multi target` 返回 6 条；`quantum security double encryption` 返回 8 条；`"Quantum Circuits of AES"` 返回 5 条。部分结果作者字段为空；用原始稿件或出版页补核，不从缺失字段推断作者。
- **在线搜索**：并行检索 DBLP 的 quantum/symmetric、AES、collision、Feistel（2024/2025）分支，并精确回查候选标题；再访问 Springer 章页、IEEE QCE 正式名单、arXiv、Inria/高校作者页面与作者 artifact。DBLP 有些直达页面受反爬限制，成功证据来自其正式域名搜索索引和会议/作者目录；本轮没有把镜像站或普通二手转载作为最终依据。

MCP 的检索上限、排序、年份过滤和空结果均不足以证明穷尽；arXiv 宽查询还出现明显无关结果，因此不用返回条数衡量领域规模。

## 新增引用的逐条核验

下面的“核验”指书目身份、发表状态及摘要对应关系。全部作者已写入分组及统一 BibTeX；只有列出的字段有来源支持时才填写。新 BibTeX 为转录结果，`biburl` 是可重试入口，不代表本次下载成功。

| 编号 | 研究论文与来源 | 已核字段及最终处理 |
|---|---|---|
| A17 | Quantum Circuits of AES with a Low-Depth Linear Layer and a New Structure；[DBLP](https://dblp.org/rec/conf/asiacrypt/ShiF24)、[Springer](https://link.springer.com/chapter/10.1007/978-981-96-0944-4_12)、[原稿](https://eprint.iacr.org/2024/381) | 2 位作者、精确标题、ASIACRYPT VIII、358–395、DOI。会议/DBLP 年 2024；Springer 引文版权年 2025，首次在线 2024-12-12，分别说明。 |
| A18 | Classical and Quantum Generic Attacks on 6-Round Feistel Schemes；[DBLP](https://dblp.org/rec/conf/sacrypt/ChartounyCP24)、[Springer](https://link.springer.com/chapter/10.1007/978-3-031-82841-6_4)、[原稿](https://eprint.iacr.org/2024/458) | 3 位作者、标题、SAC II、85–111、DOI；会议年 2024，正式在线 2025-03-13。ePrint 的 Preprint 标签滞后，按正式记录纳入。 |
| A19 | Single-Query Quantum Hidden Shift Attacks；[DBLP](https://dblp.org/rec/journals/tosc/BonnetainS24)、[IACR](https://eprint.iacr.org/2023/1306)、[Inria](https://rex-radar.inria.fr/report/2024/caramba/index.html) | 2 位作者、标题、ToSC 2024(3)、266–297、预印本 2023/1306。未取得官方 DOI 字段，省略。 |
| A20 | A Tight Quantum Algorithm for Multiple Collision Search；[arXiv](https://arxiv.org/abs/2509.13909)、[DBLP informal](https://dblp.org/rec/journals/iacr/BonnetainLSS25)、[作者列表](https://johanna-loyer.github.io/page-personnelle/) | 4 位作者、标题、arXiv v1 日期 2025-09-17、ePrint 2025/1690 与 arXiv DOI；未确认正式发表，使用 misc，不能把 DOI 或 DBLP 编目当作录用。 |
| A21 | An Efficient Quantum Collision Search Algorithm and Implications on Symmetric Cryptography；[DBLP](https://dblp.org/rec/conf/asiacrypt/ChaillouxNS17)、[原稿](https://eprint.iacr.org/2017/847) | 3 位作者、标题、ASIACRYPT II 2017、211–240、DOI 10.1007/978-3-319-70697-9_8；摘要对应碰撞/多目标任务。 |
| A22 | A Quantum Circuit to Execute a Key-Recovery Attack Against the DES and 3DES Block Ciphers；[DBLP](https://dblp.org/rec/conf/qce/PerrielloBP24)、[IEEE 名单](https://qce.quantum.ieee.org/2024/wp-content/uploads/sites/8/2024/08/QCE24-Accepted-Technical-Papers-by-Track-QALG-QSYS-QAPP-QPHO-QNET-QTEM-QML.pdf)、[作者 artifact](https://github.com/paper-codes/2024-QCE) | 3 位作者、标题、QCE 2024、1–12；DOI 10.1109/QCE60285.2024.00011 由作者书目确认。IEEE DOI 落地页访问失败；代码只读说明，未执行。 |
| A23 | Improved Meet-in-the-Middle Nostradamus Attacks on AES-like Hashing；[DBLP](https://dblp.uni-trier.de/rec/journals/tosc/DongGLPZ24.html)、[原稿](https://eprint.iacr.org/2024/352)、[作者组](https://catf.crypto.sg/mitm) | 5 位作者、标题、ToSC 2024(1)、158–187、DOI 10.46586/tosc.v2024.i1.158-187。弃用预印本 PDF 的占位 DOI。 |
| P18 | Quantum Key-Length Extension；[DBLP](https://dblp.org/rec/conf/tcc/JaegerST21)、[Springer](https://link.springer.com/chapter/10.1007/978-3-030-90459-3_8)、[作者机构库](https://pdxscholar.library.pdx.edu/compsci_fac/287/) | 3 位作者、标题、TCC I 2021、209–239、DOI。FX 与双重加密的查询模型分别记录。 |
| P19 | Hybrid-Query Bounds with Partial Input Control Framework and Application to Tight M-eTCR；[DBLP](https://dblp.org/rec/conf/asiacrypt/HulsingKM25)、[Springer](https://link.springer.com/chapter/10.1007/978-981-95-5125-5_9)、[原稿](https://eprint.iacr.org/2025/633) | 3 位作者、标题、ASIACRYPT VIII 2025、256–286、DOI。Springer 版权年 2026 与会议年分开；机构库将作者误置 editor 的导出未直接采用。 |
| E15 | Machine-Checked Security for XMSS as in RFC 8391 and SPHINCS+；[DBLP](https://dblp.org/rec/conf/crypto/BarbosaDGHMS22)、[Springer](https://link.springer.com/chapter/10.1007/978-3-031-38554-4_14)、[原稿](https://eprint.iacr.org/2023/408) | 6 位作者、标题、CRYPTO V 2023、421–454、DOI。DBLP key 的 22 后缀和标题渲染残留不用于推定年份或算法名。 |

## 已有引用的修订

- **A09**：Quantum Periodic Distinguisher Construction: Symbolization Method and Automated Tool。用 [DBLP](https://dblp.org/rec/conf/asiacrypt/LiuWWLW25) 与 [Springer 正式章页](https://link.springer.com/chapter/10.1007/978-981-95-5125-5_8) 补核 ASIACRYPT VIII 2025、224–255、DOI；由 misc 改为 inproceedings，保留 ePrint 2025/681 版本说明。
- **P11**：Generic Composition: From Classical to Quantum Security。用 [DBLP](https://dblp.org/rec/conf/pqcrypto/LangLL26) 与 [Springer 正式章页](https://link.springer.com/chapter/10.1007/978-3-032-22695-2_2) 确认 PQCrypto I 2026、37–70、首次在线 2026-04-10；更新出版年和 DOI，保留 2025 年预印本链接及兼容性 citation key。
- 先前核验的 E05/E08 修改继续保留；其余旧条目沿用前一轮证据，本次没有将“新增十篇已核验”转述为“全部旧引文重新审计完成”。

## 筛选与未纳入结果

- IACR 返回的 KEM 多目标安全、anamorphic messaging、FO/KDM 等结果未作为本轮新增核心论文：主要对象为公钥或消息协议，需另做系统扩展专题。
- 宽 arXiv 查询中的电网/云存储混合 PQC 部署、量子采样和模型降阶文章未纳入；共同出现 AES/quantum 不能替代对称原语的具体研究贡献。
- MCP 还发现量子多重碰撞与 CNOT 综合线索，但本轮未为它们完成同等级的发表字段核验，故不新增正式引用。本文不提供未经核对的作者、DOI 或 venue 以填充数量。
- 源码 artifact、机构列表和会议目录分别用于核验实现可获得性、署名或出版身份；这些证据不代表我们已运行 artifact、检查定理或证明实验可复现。
