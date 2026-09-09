# 后量子对称密码：可证明安全、模式与量子 oracle 工具

检索截点：2026-09-08（执行跨至 09-09）；本分册精选 19 篇，覆盖 qPRF/qPRP、Q1/Q2、EM/TEM/FX/Feistel、多钥、MAC/AEAD、sponge 与预计算。它是总调研的可复查材料，不声称穷尽每篇论文。

本轮以 apaper MCP 的 IACR 搜索发现论文，再开 ePrint 原始页面与 DBLP/出版社/作者机构库核元数据。MCP 的年份过滤存在漏查/越界，且其 DBLP 工具返回 JSON 错误、断连和 429；因此用标题与作者反查补漏。DBLP 的条目类型为 Informal 的 ePrint 记录**不构成录用证据**。正式记录、ePrint 状态冲突时优先报告正式记录，并标出差异。

本分册属于文献筛选与摘要核读。多数条目未完成正文证明审计，逐篇注明深度；未将搜索摘要中“首次”“最优”无条件当成经过独立证明的结论。PDF/BibTeX 抓取遭遇 403、robots、反爬页面，具体错误保存在本地 `evidence/proofs-*` 辅助日志中，不纳入 Git。proofs.bib 为按核验元数据重建的可引用记录，**不是伪装的 DBLP 原始导出**；DTU 条目另有原始 BibTeX 文本来源。

## 研究地图与应先区分的模型

| 方向 | 2024–2026 的变化 | 阅读入口 |
|---|---|---|
| Q1 原语与工作模式证明 | EM→TEM→低熵钥 keyed sponge、Ascon/KMAC；Feistel 3/4 轮正向界 | P03、P04、P09、P12、P18 |
| 多用户/多钥 | 2026 已出现 TEM/FX 的 Q1MK 与 tweakable KAF 多钥证明 | P15、P16 |
| 可逆随机置换证明工具 | 从单轮特设证明走向双向 oracle、lifting、compressed permutation | P05–P08、P13 |
| 量子认证定义与组合 | plus-one 不足以保证某些组合；BU、SU、qPRF 之间需要更细区分 | P02、P11、P14 |
| 预计算与资源约束 | 普通 indifferentiability 无法自动处理 advice；研究走向量子时间空间折中 | P17、P19 |

Q1 通常允许攻击者量子计算，但对部署中的秘密钥接口只作经典查询；公开算法作为理想原语时依然可以被量子访问。Q2 额外允许对秘密钥接口进行叠加查询。qPRF、strong qPRP 是安全概念，QROM/量子理想置换/理想密码则是模型，不应混用。哈希原像抗性、碰撞抗性、indifferentiability、AE 保密性、MAC 不可伪造性分别对应不同目标，不能用统一“安全减半”覆盖。

## 精选论文卡片

### P01 · How to Construct Quantum Random Functions

- 作者：Mark Zhandry。
- 年份与状态：正式发表；JACM 2021，早期版 FOCS 2012；DBLP 与 ACM 出版页交叉核验。
- 入口：[ePrint 2012/182](https://eprint.iacr.org/2012/182)；[DBLP](https://dblp.org/rec/journals/jacm/Zhandry21)；[DOI](https://doi.org/10.1145/3450745)；BibTeX 键：`Zhandry2021QRF`。
- 主题与贡献：qPRF 定义与构造。区分量子计算但经典查询的 PRF 安全与允许叠加查询的 qPRF 安全；证明若干经典 PRF 构造在合适量子安全假设下仍安全，并给出两种模型的分离。
- 模型/局限：不能把“抗量子、经典接口”直接当作 qPRF；这是通用构造理论，不是 AES 等具体实例的无条件安全证明。
- 核读深度：摘要级；另核 ACM 正式出版元数据。

### P02 · Quantum-Access-Secure Message Authentication via Blind-Unforgeability

- 作者：Gorjan Alagic；Christian Majenz；Alexander Russell；Fang Song。
- 年份与状态：正式发表；EUROCRYPT 2020；DBLP 作者页、Springer 目录与 CWI 机构库核验。
- 入口：[ePrint 2018/1150](https://eprint.iacr.org/2018/1150)；[DBLP](https://dblp.org/rec/conf/eurocrypt/AlagicMR020)；[DOI](https://doi.org/10.1007/978-3-030-45727-3_27)；BibTeX 键：`AlagicMRS2020BU`。
- 主题与贡献：量子访问下 MAC 不可伪造定义。提出 blind unforgeability（BU），通过屏蔽随机消息子集刻画“未得到认证的消息”；qPRF 满足该定义，并分析 hash-and-MAC 与 Bernoulli-preserving 哈希。
- 模型/局限：阅读旧版时尤其注意更正：不能沿用早期“BU 蕴含 plus-one”的说法。P14 的 2026 摘要明确称该关系仍未知；只能确认存在满足 plus-one 却违反 BU 的分离例。
- 核读深度：摘要级；核正式稿第 4 节 BU 定义片段，未复核全证。

### P03 · Post-Quantum Security of the Even-Mansour Cipher

- 作者：Gorjan Alagic；Chen Bai；Jonathan Katz；Christian Majenz。
- 年份与状态：正式发表；EUROCRYPT 2022；DBLP 正式卷目录/作者记录与 ePrint 核验。
- 入口：[ePrint 2021/1601](https://eprint.iacr.org/2021/1601)；[DBLP](https://dblp.org/rec/conf/eurocrypt/AlagicBKM22)；[DOI](https://doi.org/10.1007/978-3-031-07082-2_17)；BibTeX 键：`AlagicBKM2022EM`。
- 主题与贡献：Q1 Even-Mansour 的查询下界。在秘密加密接口仅经典可查、公开置换量子可查的模型中证明 EM 安全。区分 q_E 与 q_P，摘要给出必要量级 q_E q_P² + q_P q_E² ≈ 2^n，同时适用于单钥与双钥 EM。
- 模型/局限：随机置换模型；不能将 Q2 中 Simon 攻击与 Q1 的上述界混用，也不宜把双参数界只压成一个“量子安全位数”。
- 核读深度：摘要级；元数据级核验正式版。

### P04 · Post-quantum Security of Tweakable Even-Mansour, and Applications

- 作者：Gorjan Alagic；Chen Bai；Jonathan Katz；Christian Majenz；Patrick Struck。
- 年份与状态：正式发表；EUROCRYPT 2024；DBLP 与作者所属 DTU 机构库（含 BibTeX）核验。
- 入口：[ePrint 2022/1097](https://eprint.iacr.org/2022/1097)；[DBLP](https://dblp.org/rec/conf/eurocrypt/AlagicBKMS24)；[DOI](https://doi.org/10.1007/978-3-031-58716-0_11)；BibTeX 键：`AlagicBKMS2024TEM`。
- 主题与贡献：Q1 tweakable block cipher 与模式证明。将 EM 的 Q1 证明扩展到 tweakable EM，并用于 Chaskey、Elephant 和 Minalpher 的一个变体的模式级安全证明。
- 模型/局限：依赖理想置换；Minalpher 的结论针对论文变体；ePrint 从 2022 首发到 2024 正式发表，不能把编号年份当作会议年份。FX 相关早期版本的证明变化见 P15。
- 核读深度：摘要级。

### P05 · Quantum One-Wayness of the Single-Round Sponge with Invertible Permutations

- 作者：Joseph Carolan；Alexander Poremba。
- 年份与状态：正式发表；CRYPTO 2024；ePrint、Springer 正式目录及作者主页核验；DBLP 可见同题预印本与作者记录。
- 入口：[ePrint 2024/414](https://eprint.iacr.org/2024/414)；[DBLP](https://dblp.org/pid/370/6990.html)；[DOI](https://doi.org/10.1007/978-3-031-68391-6_7)；BibTeX 键：`CarolanP2024Sponge`。
- 主题与贡献：可逆置换模型的单轮 sponge 单向性。通过对称化方法证明双边零搜索问题的量子查询下界，进而证明使用可逆随机置换的单轮 sponge 的量子单向性。
- 模型/局限：单轮结果；不能独立推成任意长度 SHA-3 的量子不可区分性或完整实际实现安全。
- 核读深度：摘要级。

### P06 · Permutation Superposition Oracles for Quantum Query Lower Bounds

- 作者：Christian Majenz；Giulio Malavolta；Michael Walter。
- 年份与状态：正式发表；STOC 2025；DBLP 正式记录核验，ePrint 仍标 Preprint。
- 入口：[ePrint 2024/1140](https://eprint.iacr.org/2024/1140)；[DBLP](https://dblp.org/rec/conf/stoc/MajenzMW25)；BibTeX 键：`MajenzMW2025PSO`。
- 主题与贡献：随机置换双向量子 oracle 证明工具。为同时访问置换与逆置换的量子算法建立 oracle 模拟，借助 strictly monotone factorization 对输入输出谓词成功率做界定；应用于单轮 sponge 原像抗性。
- 模型/局限：这是理想化查询复杂度工具；具体函数、轮数、目标性质仍需单独归约，不能直接据此认定所有置换模式安全。
- 核读深度：摘要级。

### P07 · Quantum Lifting for Invertible Permutations and Ideal Ciphers

- 作者：Alexandru Cojocaru；Minki Hhan；Qipeng Liu；Takashi Yamakawa；Aaram Yun。
- 年份与状态：正式发表；CRYPTO 2025；DBLP 正式卷目录核验，ePrint 仍标 Preprint。
- 入口：[ePrint 2025/738](https://eprint.iacr.org/2025/738)；[DBLP](https://dblp.org/rec/conf/crypto/CojocaruHLYY25)；BibTeX 键：`CojocaruHLYY2025Lifting`。
- 主题与贡献：将经典界提升到量子置换/理想密码模型。建立量子随机置换与理想密码模型的 lifting 定理，将量子成功概率联系到少量经典查询的算法；应用包括常数轮 sponge 的原像、单向、多碰撞抗性与 Davies–Meyer 碰撞抗性。
- 模型/局限：并非任意经典安全证明自动量子化；需检查定理条件、查询损失和常数轮限制。
- 核读深度：摘要级。

### P08 · The Sponge Is Quantum Indifferentiable

- 作者：Gorjan Alagic；Joseph Carolan；Christian Majenz；Saliha Tokat。
- 年份与状态：正式发表；FOCS 2025；DBLP 正式卷目录与作者记录核验，ePrint 仍标 Preprint。
- 入口：[ePrint 2025/731](https://eprint.iacr.org/2025/731)；[DBLP](https://dblp.org/rec/conf/focs/AlagicCMT25)；BibTeX 键：`AlagicCMT2025Sponge`。
- 主题与贡献：sponge 的量子 indifferentiability。证明基于公开随机可逆置换的 sponge 对量子攻击者可与随机预言机组合替换，为 SHA-3 的域扩展结构提供量子理论基础；另给出更紧的原像与碰撞界。
- 模型/局限：摘要自称总 indifferentiability 界较松，为 O(poly(q)·2^{-min(r,c)/4})；这不是实际 Keccak 置换无条件安全证明，参数化与收紧仍有研究空间。
- 核读深度：摘要级。

### P09 · Post-Quantum Security of Keyed Sponge-Based Constructions Through a Modular Approach

- 作者：Akinori Hosoyamada。
- 年份与状态：正式发表；ASIACRYPT 2025；DBLP 正式目录与 ePrint 核验；ePrint 为 major revision。
- 入口：[ePrint 2025/1059](https://eprint.iacr.org/2025/1059)；[DBLP](https://dblp.org/rec/conf/asiacrypt/Hosoyamada25)；BibTeX 键：`Hosoyamada2025KeyedSponge`。
- 主题与贡献：Ascon/KMAC 的模块化 Q1 证明。在量子理想置换模型中，将 Ascon 模式化为低熵钥 TEM 的迭代，将 keyed sponge 化为低熵钥 EM；修改 resampling lemma，覆盖 Ascon、KMAC、inner/outer/full-keyed sponge。Ascon 还涵盖 nonce 误用保密和释放未验证明文时的真实性。
- 模型/局限：单用户 Ascon 保证约至 min(2^{c/3},2^{κ/3}) 查询；消除了 P10 的部分限制但 key 指数更弱。KMAC 界同时依赖 capacity、rate、有效 key 参数，摘要式不能直接代入标准 KMAC 的比特长度宣称安全等级。
- 核读深度：摘要级；PDF 请求被拒，尚未正文复核 κ 编码含义。

### P10 · Security of the Ascon Authenticated Encryption Mode in the Presence of Quantum Adversaries

- 作者：Nathalie Lang；Stefan Lucks；Bart Mennink；Suprita Talnikar。
- 年份与状态：保留近期预印本；截至检索仅核到 ePrint/DBLP Informal 记录，未核到正式录用。
- 入口：[ePrint 2025/411](https://eprint.iacr.org/2025/411)；[DBLP](https://dblp.org/rec/journals/iacr/LangLMT25)；BibTeX 键：`LangLMT2025Ascon`。
- 主题与贡献：Ascon Q1 直接证明与参数限制。利用 semi-classical O2H lemma 和专门的 puncture set 分析 Ascon AE 模式，给出约 min(2^{c/3},2^{k/2}) 的安全量级，讨论 Grover key search 与状态恢复。
- 模型/局限：block-wise adaptive，但只允许一次伪造尝试；P09 指出其还有 nonce 集合限制。不能与 P09 的更广模型只比较指数后宣布谁完全优于谁。
- 核读深度：摘要级。

### P11 · Generic Composition: From Classical to Quantum Security

- 作者：Nathalie Lang；Jannis Leuther；Stefan Lucks。
- 年份与状态：正式发表；PQCrypto 2026, Part I, pp. 37–70，Springer 首次在线 2026-04-10。2026-09-09 补核 DBLP 正式记录；ePrint 的 2025 年是预印本年份。
- 入口：[ePrint 2025/387](https://eprint.iacr.org/2025/387)；[DBLP](https://dblp.org/rec/conf/pqcrypto/LangLL26)；[Springer](https://link.springer.com/chapter/10.1007/978-3-032-22695-2_2)；BibTeX 键：`LangLL2025Composition`（为兼容保留原键名，year 已改为 2026）。
- 主题与贡献：Q2 authenticated encryption 通用组合。给出反例：IND-qCPA 加密加 plus-one 不可伪造 MAC 的 Encrypt-then-MAC 组合不一定 IND-qCCA 安全；更强的 qPRF MAC 可支撑组合定理，并讨论 nonce 与关联数据版本。
- 模型/局限：查询和回答可以叠加的强访问模型；不能将此结论机械解释为常规经典网络接口 Encrypt-then-MAC 已被实际攻破。
- 核读深度：摘要级；本轮另核 PQCrypto 2026 正式版本摘要，后续定理引用应注明该版本。

### P12 · Post-quantum Security of Key-Alternating Feistel Ciphers

- 作者：Jyotirmoy Basak；Ritam Bhaumik；Amit Kumar Chauhan；Ravindra Jejurikar；Ashwin Jha；Anandarup Roy；André Schrottenloher；Suprita Talnikar。
- 年份与状态：正式发表；ASIACRYPT 2025；DBLP 正式目录核验；ePrint major revision。
- 入口：[ePrint 2025/1603](https://eprint.iacr.org/2025/1603)；[DBLP](https://dblp.org/rec/conf/asiacrypt/BasakBCJJRST25)；BibTeX 键：`BasakEtAl2025KAF`。
- 主题与贡献：Q1 Feistel 最小轮数的正向安全证明。在公开随机函数/置换可量子访问时，证明 3 轮 KAF 为 PRP、4 轮为 strong PRP；3 轮结果甚至允许各轮使用同一随机预言机。
- 模型/局限：Q1 而非 Q2；独立轮密钥、复用 primitive 的条件和精确界需阅读正文。具体 Feistel 密码并不因此自动满足该理想模型。
- 核读深度：摘要级。

### P13 · Compressed Permutation Oracles

- 作者：Joseph Carolan。
- 年份与状态：正式发表；STOC 2026；DBLP 正式卷目录与作者主页交叉核验；ePrint 标 Preprint 过时。
- 入口：[ePrint 2025/1734](https://eprint.iacr.org/2025/1734)；[DBLP](https://dblp.org/rec/conf/stoc/Carolan26)；BibTeX 键：`Carolan2026CPO`。
- 主题与贡献：通用 compressed permutation oracle 与 strong qPRP。建立接近压缩随机函数 oracle 的随机置换表示工具；证明 7 轮 Feistel 为 strong quantum PRP；重证 sponge、Davies–Meyer 等原像/碰撞下界，并给出 cycle finding、one-more 等新下界。
- 模型/局限：7 轮 strong qPRP 是重要边界，不等于 7 轮必为最优轮数；应区分理想随机轮函数与从计算假设实例化。后续选题须对照该新工具，避免重复证明已解决命题。
- 核读深度：摘要级；正式出版状态核验。

### P14 · Defining Quantum-Secure Message Authentication

- 作者：Ashwin Jha；Mustafa Khairallah；Jannis Leuther；Stefan Lucks。
- 年份与状态：保留最新预印本；2026-02-16 received，2026-05-22 最近修订；未核到正式录用。
- 入口：[ePrint 2026/271](https://eprint.iacr.org/2026/271)；[DBLP](https://dblp.org/rec/journals/iacr/JhaKLL26)；BibTeX 键：`JhaKLL2026SU`。
- 主题与贡献：MAC 安全定义更新：splitting unforgeability。提出 SU，同时捕获不能产生超过查询数认证结果的 stability 和对未访问区域的 exclusiveness；SU 在经典情形等价 EUF-CMA，在量子情形蕴含 plus-one 与 BU；给出 qPRF、有限独立函数及 quantum Carter–Wegman MAC 的充分条件。
- 模型/局限：定义之间关系必须按最新稿审慎处理；满足 SU 的通用充分条件不等于常用具体 MAC 已获得 SU 证明。原文还讨论 collapsing/Bernoulli-preserving 哈希组合。
- 核读深度：摘要级；PDF 请求被拒，未复核定义全文。

### P15 · Multi-Key Security in the Quantum World: Revisiting Tweakable Even-Mansour and FX

- 作者：Rentaro Shiba；Tetsu Iwata。
- 年份与状态：正式发表；ToSC 2026(2)，官方出版页检索结果显示 2026-06-11；ePrint 2026-02-24 received、06-16 revised。
- 入口：[ePrint 2026/382](https://eprint.iacr.org/2026/382)；[DBLP](https://dblp.org/rec/journals/iacr/ShibaI26)；[DOI](https://doi.org/10.46586/tosc.abksudsuurh6)；BibTeX 键：`ShibaI2026Q1MK`。
- 主题与贡献：Q1MK 多钥 TEM 与 FX。将经典在线/量子离线 Q1 与 multi-key 结合。摘要证明 TEM 需 Ω(2^{κ/3}) 总量级查询且不依赖目标 key 数；收紧 FX 单用户证明，并得到 2^u 个独立 key 时 Ω(2^{(κ+n-u)/3}) 的查询下界。
- 模型/局限：这些是特定模型与构造的必要查询量级，不是所有多用户系统的通用劣化规则；P04 ePrint 某个早期 FX 版本被重新审视，引用应精确到版本。
- 核读深度：摘要级；ePrint History 和 ToSC 出版元数据级核验。

### P16 · Post-Quantum Security of Tweakable Key-Alternating Feistel Ciphers in the Multi-Key Setting

- 作者：Rentaro Shiba；Tetsu Iwata。
- 年份与状态：近三个月论文；2026-06-23 received，07-08 revised；ePrint 标 Published elsewhere, Minor revision, SCN 2026；本轮尚未核到正式卷页，录用/发表按作者声明记录。
- 入口：[ePrint 2026/1312](https://eprint.iacr.org/2026/1312)；[DBLP](https://dblp.org/rec/journals/iacr/ShibaI26a)；BibTeX 键：`ShibaI2026TKAF`。
- 主题与贡献：tweakable Feistel 的 Q1 多钥证明。由 P12 扩展到用 ε-AXU hash 注入 tweak 的 TKAF 和多个经典 oracle；证明 3 轮 TPRP、4 轮 strong TPRP。摘要明确包含用户数 ℓ、半块参数 n 与 ε 导致的安全界。
- 模型/局限：不能再把“多用户 tweakable Feistel 的 Q1 安全”整体当空白；有意义问题应转向用户数损失紧致性、hash 假设、轮密钥相关性或具体应用。摘要中 Ω(2^{n/3}/ℓ^{2/3}) 与 Ω(ε^{-1/2}) 的两个条件须按正文完整陈述，不能随意合并为一个统一指数。
- 核读深度：摘要级；PDF 请求未成功。

### P17 · (Quantum) Indifferentiability and Pre-Computation

- 作者：Joseph Carolan；Alexander Poremba；Mark Zhandry。
- 年份与状态：ePrint 2024；作者 Poremba 机构主页称已发表于 IACR Communications in Cryptology 3(2), 2026；DOI 10.62056/ak-4c3tw9。出版页面本轮不可达，正式期刊卷目待再核，Bib 保守保留预印本。
- 入口：[ePrint 2024/1727](https://eprint.iacr.org/2024/1727)；[DBLP](https://dblp.org/rec/journals/iacr/CarolanPZ24)；BibTeX 键：`CarolanPZ2024Precomp`。
- 主题与贡献：预计算/advice、量子时间空间折中。证明普通 indifferentiability 不足以捕获带经典或量子 advice 的预计算攻击；提出包含预计算的加强定义与组合框架，对单轮 sponge inversion 给出紧的时间空间折中。
- 模型/局限：单轮应用，需注意 rate≤capacity 等适用条件；从该结果推广多轮/变长 sponge、实际工作因子时要另证，不能直接移植 Grover 或随机预言机界。
- 核读深度：摘要级；作者机构主页核发表声明；未复核全证。

### P18 · Quantum Key-Length Extension

- 作者：Joseph Jaeger；Fang Song；Stefano Tessaro。
- 年份与状态：正式发表；TCC 2021, Part I, pp. 209–239；DBLP、Springer 与作者机构库交叉核验。
- 入口：[ePrint 2021/579](https://eprint.iacr.org/2021/579)；[DBLP](https://dblp.org/rec/conf/tcc/JaegerST21)；[Springer](https://link.springer.com/chapter/10.1007/978-3-030-90459-3_8)；BibTeX 键：`JaegerST2021KeyLength`。
- 主题与贡献：在理想模型中研究 FX 和双重加密的量子密钥长度扩展，给出具体安全界；补充 D4 的构造基础。
- 模型/局限：FX 的秘密接口为经典，底层理想原语可量子查询；标准 FX 的非自适应结论与随机预言机变体的自适应结论分开。双重加密另在 fully-quantum 模型分析 strong PRP。不能将论文当年的开放问题直接写成 2026 年仍未解决。
- 核读深度：摘要及出版社元数据；未审计完整证明。

### P19 · Hybrid-Query Bounds with Partial Input Control Framework and Application to Tight M-eTCR

- 作者：Andreas Hülsing；Mikhail Kudinov；Christian Majenz。DBLP 将第二位作者展开为 Mikhail A. Kudinov，书目沿用出版社与原稿署名。
- 年份与状态：正式发表；ASIACRYPT 2025, Part VIII, pp. 256–286；DBLP、Springer 与 ePrint 交叉核验。会议年 2025 与 Springer 版权年 2026 分别记录。
- 入口：[ePrint 2025/633](https://eprint.iacr.org/2025/633)；[DBLP](https://dblp.org/rec/conf/asiacrypt/HulsingKM25)；[Springer](https://link.springer.com/chapter/10.1007/978-981-95-5125-5_9)；BibTeX 键：`HulsingKM2025HybridQuery`。
- 主题与贡献：扩展 hybrid compressed oracle 以处理输入仅部分由攻击者控制的经典查询，分析多目标 extended target collision resistance，并以匹配攻击说明查询界的紧性。
- 模型/局限：QROM 中混合经典/量子查询；hash-and-sign 的盐长与哈希性质分析不等同于某个实际哈希函数的无条件安全，也不是允许量子签名查询的普遍定理。
- 核读深度：摘要及正式出版元数据；适合与 P17 和 A20/A21 合读。

## 有依据的选题建议

以下是从已检索文献推导的候选问题，不是“已验证无人做过”的新颖性声明。正式立项还需读相邻论文全文、最近版本与引用链。

1. **Ascon/keyed sponge 的多用户 Q1 且多次伪造界**：以 P09 的低熵钥模块化框架和 P15 的 Q1MK 工具为基础，追踪用户数、总数据量、单用户数据量、量子 primitive 查询、nonce 误用及 RUP 的不同损失；先检查 P09 是否已支持所需接口。比简单提出“量子 Ascon 安全”更明确。关键障碍是多用户混合、重复内部状态与解密/失败信息的联合处理，潜在价值是更可用的安全预算。
2. **多钥 TKAF 的紧界与密钥调度限制**：P16 已覆盖独立 key、多用户、tweak；有意义的是其 ℓ 损失是否可匹配、相关轮密钥/单钥展开能否证明，或找出不能推广的反例。先抽取 P16 定理精确参数，再用 P12 作为无 tweak 基线。
3. **把置换工具用于更紧的 sponge 组合界**：P08 的 indifferentiability 界自认松，P13 出现更通用工具。可比较直接攻防界与可组合界的差距，明确目标为变长、多输出或一个具体 duplex/keyed 模式；不能再把“首次证明 sponge 量子 indifferentiability”当选题。
4. **SU 与通用 AE 组合所需最弱 MAC 假设**：P11 给出 plus-one 不足的反例，P14 给出 SU。值得检查 SU、BU 或额外结构是否足以获得目标 IND-qCCA / AEAD 定理，或者给出分离。不能未经证明推断 SU 可替代 P11 的 qPRF。
5. **预计算下多轮 sponge 的可组合时间空间界**：P17 的强模型和单轮紧界提供入口；对多轮/变长消息、经典 advice 与量子 advice 分别分析，并明确 preprocessing 成本是否计入。难度较高，适合有量子查询下界背景的团队。

优先阅读顺序：应用/模式方向 P03→P04→P09→P15→P16；证明工具方向 P05→P06/P07→P08→P13→P17；认证定义方向 P01→P02→P11→P14。

## 核验风险与未纳入项

2026-09-09 以 MCP 的 IACR 查询并行于 DBLP/出版社网页检索，新增 P18/P19，并将 P11 更新为 PQCrypto 2026 正式记录。P19 的机构库导出曾把一位作者放入 editor 字段，本报告用 Springer 与原始稿件校对全部作者；不自动导入该导出。

- ePrint 2021/192《Quantum Indifferentiability of SHA-3》在检索中出现，但本轮不纳入可靠结论链。2025 论文明确把相关证明障碍作为新突破；应先核旧稿更正、撤回/缺陷记录，不可将两个“首次”简单并列。
- “A Note on Quantum-Secure PRPs” 检索显示已有 Quantum 2025 正式版本（DOI 10.22331/q-2025-04-08-1696），是 P01 与 P13 间值得补读的计算假设构造背景。本轮没有完整核作者/正文，因此不列为已完成卡片。
- 不把量子消息加密、pseudorandom quantum states、量子认证 quantum messages、量子货币等相邻方向算成“经典对称加密抗量子攻击”。格基 OPRF、对称原语支撑 PQ 签名属于外延应用，应另分层。
- 本轮正式旧文保留 JACM / EUROCRYPT 等有明确元数据的版本；没有因 DBLP 存在 ePrint 记录而推定经过同行评审。P16、P17 的正式卷目证据尚弱于其余正式条目，已单独标注。
