# 后量子对称密码的应用扩展与邻接方向

文献截止日期：2026-09-08。实际检索跨越台湾时间 2026-09-08 至 09-09 午夜。本文是总调研的专题分报告，保留 14 篇核心文献；最新文章尚未录用时仍保留并明确标注。本轮以 IACR ePrint / apaper MCP 为发现入口，以 DBLP、ePrint 官方页和出版社页面核验。**阅读主要为摘要级，不代表已逐一定理审计或复现实验。**

## 范围与重点

这里区分两类问题。DiSE、门限密钥管理和 SSE 是对称加密功能的扩展；FAEST、Picnic、Lynx、AIMer、Rainier、SPHINCS+ 是由对称原语支撑的后量子公钥签名或证明系统，属于邻接方向。后者值得纳入方向地图，但不能计作“新的对称加密模式”。同时，SSE/DiSE 的后量子实例可能依赖格、同源等非对称数学假设，不能仅因名字含 symmetric 就说全协议只有对称假设。

从本次证据看，活跃问题可以归纳为四条。

1. **分布式认证加密与密钥托管。** 从 CCS 2018 的 DiSE 框架，经 ACNS 2024 的半诚实量子安全 DPRF，进展到 2026 年的 QROM 自适应 DiSE；重点是门限安全、腐化模型及在线成本，见 E01–E03。
2. **PQC 可搜索加密。** 兼顾合取查询、动态更新、前向/后向隐私、结果可验证性与具体效率，见 E04–E05。标题中的 efficient 与 post-quantum 可能对应不同实例，必须逐一核对。
3. **面向证明系统的对称原语。** 一条路复用 AES 并优化树、承诺和 QROM 证明，另一条路为 VOLEitH/AO 场景设计低乘法复杂度原语。近期攻击提示低次数结构可能抵消性能收益，见 E06–E11。
4. **哈希签名的组合优化与状态管理。** 成熟基础之上仍有编码下界、大小/验证时间折衷、多 HSM 状态一致性问题，见 E12–E14。

这些是检索中得到的代表性热点，不能据此声称穷尽公开研究。具体选题还需要对最接近的工作做正文阅读和更新检索。

## 文献索引

| 编号 | 标题 | 正式年份或预印本年份 | 发表状态与证据 |
|---|---|---|---|
| E01 | DiSE: Distributed Symmetric-key Encryption | 2018 | 已发表 ACM CCS 2018；DBLP + ePrint |
| E02 | Efficient Quantum-Safe Distributed PRF and Applications: Playing DiSE in a Quantum World | 2024；ePrint 2025 | 已发表 ACNS 2024；DBLP + ePrint |
| E03 | EQuADiSE: Efficient Quantum-safe Adaptive Distributed Symmetric-key Encryption | 2026 | ePrint 明示 ESORICS 2026 将发表；已录用信息来自作者，待独立出版核验 |
| E04 | Efficient and Post-Quantum Conjunctive Dynamic SSE with Strong Privacy Guarantees | 2026 | 已发表 PKC 2026, Part IV: 302–334；DBLP + ePrint |
| E05 | Ring-LWR based Commitments and ZK-PoKs with Application to Verifiable Quantum-Safe Searchable Symmetric Encryption | 2025 | ePrint 自报 ACM ASIACCS 2025；本轮仅找到 DBLP ePrint 记录，会议记录待补 |
| E06 | Publicly Verifiable Zero-Knowledge and Post-Quantum Signatures from VOLE-in-the-Head | 2023 | 已发表 CRYPTO 2023；DBLP + ePrint（DBLP key 尾部22不是出版年份） |
| E07 | One Tree to Rule Them All: Optimizing GGM Trees and OWFs for Post-Quantum Signatures | 2024 | 已发表 ASIACRYPT 2024；DBLP + ePrint |
| E08 | Shorter, Tighter, FAESTer: Optimizations and Improved (QROM) Analysis for VOLE-in-the-Head Signatures | 2025；ePrint 2026 | 已发表 CRYPTO 2025；Springer 正式页 + ePrint；DBLP 搜索本轮仅定位 ePrint 记录 |
| E09 | Lynx: Symmetric Primitive for Shorter and Faster VOLE-in-the-Head Signatures | 2026 | 近期预印本；2026-05-29 首发，2026-05-31 修订 |
| E10 | Magic Pot: Cryptanalysis of Full AIM2 in the Standard and Related-/reused-Key Settings Using New Elimination Framework | 2026 | 已发表 EUROCRYPT 2026；DBLP + ePrint（重大修订） |
| E11 | One More Pair, More Information Gained: Improved Attacks on LowMC with Full S-box Layers Using Two Plaintext/Ciphertext Pairs | 2025 | 预印本；本轮未确认正式录用 |
| E12 | The SPHINCS+ Signature Framework | 2019 | 已发表 ACM CCS 2019；DBLP + ePrint |
| E13 | At the Top of the Hypercube -- Better Size-Time Tradeoffs for Hash-Based Signatures | 2025 | 已发表 CRYPTO 2025；DBLP + ePrint |
| E14 | Secure Distributed State Management for Stateful Signatures with a Practical and Universally Composable Protocol | 2025 | 近期预印本；2025-12-18 首发，本轮未确认正式录用 |

## E01 · DiSE: Distributed Symmetric-key Encryption

**作者：** Shashank Agrawal；Payman Mohassel；Pratyay Mukherjee；Peter Rindal。\
**年份 / 发表状态：** 2018；已发表 ACM CCS 2018；DBLP + ePrint。\
**阅读深度：** 摘要级。\
**BibTeX key：** `Agrawal2018DiSE`。\
**来源：** [IACR ePrint 2018/727](https://eprint.iacr.org/2018/727)；[DBLP 记录](https://dblp.org/rec/conf/ccs/AgrawalMMR18)；[正式 DOI](https://doi.org/10.1145/3243734.3243774)。

把长期主密钥分散到多方，以分布式 PRF 构造门限认证加密，形式化恶意攻击下的正确性、隐私与真实性。它是 DiSE 主线的经典起点，也是存储加密和企业密钥托管问题的共同接口。

**模型与局限：** 这是通用框架而非统一的后量子证明；不同 DPRF 实例的假设、安全性和扩展性不同。不能因某一实例只用 AES，就把整篇全部实现称为抗量子。

**研究启发（调研判断）：** 值得延伸到自适应腐化、密钥刷新、门限变化与跨地域延迟下的端到端安全。

## E02 · Efficient Quantum-Safe Distributed PRF and Applications: Playing DiSE in a Quantum World

**作者：** Sayani Sinha；Sikhar Patranabis；Debdeep Mukhopadhyay。\
**年份 / 发表状态：** 2024；已发表 ACNS 2024；DBLP + ePrint。\
**阅读深度：** 摘要级。\
**BibTeX key：** `Sinha2024PQDiSE`。\
**来源：** [IACR ePrint 2025/152](https://eprint.iacr.org/2025/152)；[DBLP 记录](https://dblp.org/rec/conf/acns/SinhaPM24)；[正式 DOI](https://doi.org/10.1007/978-3-031-54773-7_3)。

基于 LWR 的分布式 PRF 支持任意门限，以内积和舍入作为主要计算，并给出 PQ-DiSE 原型。主要技术问题是多项式模数比下的正确性与量子安全分析。

**模型与局限：** 摘要中的安全结果针对门限以下半诚实腐化，不能扩张为任意恶意、自适应攻击。ePrint 是 2025-01-31 上传的重大修订，正式论文属 ACNS 2024，不应按编号统计为 2025 首发。

**研究启发（调研判断）：** 比较静态/自适应腐化、半诚实/恶意模型下的成本，是比单测 AES 吞吐量更有意义的选题。

## E03 · EQuADiSE: Efficient Quantum-safe Adaptive Distributed Symmetric-key Encryption

**作者：** Sayani Sinha；Sikhar Patranabis；Debdeep Mukhopadhyay。\
**年份 / 发表状态：** 2026；ePrint 明示 ESORICS 2026 将发表；已录用信息来自作者，待独立出版核验。\
**阅读深度：** 摘要级。\
**BibTeX key：** `Sinha2026EQuADiSE`。\
**来源：** [IACR ePrint 2026/799](https://eprint.iacr.org/2026/799)。

给出 MLWR 分布式 PRF 和 DiSE，作者证明其在 QROM 下具有自适应安全性，加解密在线开销随参与方数线性增长。论文将过去依赖离散对数群或指数开销的自适应方案作为比较对象。

**模型与局限：** 量子安全依赖 MLWR 假设和 QROM；不是无条件结论。摘要不足以确认任意网络故障、主动密钥刷新或移动攻击者是否在模型中。首次上传 2026-04-23，修订 2026-06-17。

**研究启发（调研判断）：** 当前很值得跟进的真正对称加密扩展方向：自适应门限安全与可部署密钥管理。

## E04 · Efficient and Post-Quantum Conjunctive Dynamic SSE with Strong Privacy Guarantees

**作者：** Bibhas Chandra Das；Nilanjan Datta；Avijit Dutta；Avishek Majumder；Debdeep Mukhopadhyay；Sikhar Patranabis；Subhabrata Samajder；Laltu Sardar。\
**年份 / 发表状态：** 2026；已发表 PKC 2026, Part IV: 302–334；DBLP + ePrint。\
**阅读深度：** 摘要级。\
**BibTeX key：** `Das2026ConjunctiveDSSE`。\
**来源：** [IACR ePrint 2026/742](https://eprint.iacr.org/2026/742)；[DBLP 记录](https://dblp.org/rec/conf/pkc/DasDDMMPSS26)。

形式化合取查询的后向隐私，提出 fp-GA-ODXT 框架，兼顾前向/后向隐私、客户端计算和通信。给出经典实例与基于格和超奇异椭圆曲线同源的后量子实例。

**模型与局限：** 必须区分两个实例：论文摘要明确，具体实现与实测加速属于离散对数群/RSA 的经典实例；后量子实例的结果是渐近高效。不能把经典性能图直接作为 PQ-SSE 实测性能。首次上传 2026-04-15。

**研究启发（调研判断）：** PQC 合取 DSSE 的具体参数、真实数据库实验和泄漏攻击验证，构成清晰的应用研究切口。

## E05 · Ring-LWR based Commitments and ZK-PoKs with Application to Verifiable Quantum-Safe Searchable Symmetric Encryption

**作者：** Debadrita Talapatra；Nimish Mishra；Debdeep Mukhopadhyay。\
**年份 / 发表状态：** 2025；ePrint 自报 ACM ASIACCS 2025；本轮仅找到 DBLP ePrint 记录，会议记录待补。\
**阅读深度：** 摘要级。\
**BibTeX key：** `Talapatra2025VerifiableSSE`。\
**来源：** [IACR ePrint 2025/1216](https://eprint.iacr.org/2025/1216)；[DBLP 记录](https://dblp.org/rec/journals/iacr/TalapatraMM25)。

从 RLWR 承诺和多项式线性关系的知识证明出发，为既有 LWR-SSE 加入搜索结果正确性验证。作者报告短证明和较小额外验证成本。

**模型与局限：** 这是依赖格假设的可验证 SSE，不是仅用块密码的对称原语设计。其证明关系、安全模型、实验平台及结果完整性覆盖范围仍须正文复核；摘要中的具体开销不宜外推至其他数据集。首次上传 2025-06-30，修订 2025-08-29。

**研究启发（调研判断）：** 联合考虑查询泄漏、结果完整性、证明成本和动态更新，比仅证明数据库内容加密更有研究价值。

## E06 · Publicly Verifiable Zero-Knowledge and Post-Quantum Signatures from VOLE-in-the-Head

**作者：** Carsten Baum；Lennart Braun；Cyprien Delpech de Saint Guilhem；Michael Klooß；Emmanuela Orsini；Lawrence Roy；Peter Scholl。\
**年份 / 发表状态：** 2023；已发表 CRYPTO 2023；DBLP + ePrint（DBLP key 尾部22不是出版年份）。\
**阅读深度：** 摘要级。\
**BibTeX key：** `Baum2023VOLE`。\
**来源：** [IACR ePrint 2023/996](https://eprint.iacr.org/2023/996)；[DBLP 记录](https://dblp.org/rec/conf/crypto/BaumBGKORS22)；[正式 DOI](https://doi.org/10.1007/978-3-031-38554-4_19)。

以 VOLE-in-the-Head 将指定验证者 ZK 转为公开可验证协议，并实例化基于 AES 的 FAEST 签名。它解释为何 AES/PRG/哈希优化能够影响后量子公钥签名性能。

**模型与局限：** 最终产物是数字签名和零知识证明，不是对称加密模式。安全性不能只从 AES 密钥长度推出，还依赖 OWF、承诺与 Fiat–Shamir 等组件；紧致 QROM 分析应结合 E08 阅读。

**研究启发（调研判断）：** 签名协议与底层对称计算共同设计，是这条邻接主线的核心。

## E07 · One Tree to Rule Them All: Optimizing GGM Trees and OWFs for Post-Quantum Signatures

**作者：** Carsten Baum；Ward Beullens；Shibam Mukherjee；Emmanuela Orsini；Sebastian Ramacher；Christian Rechberger；Lawrence Roy；Peter Scholl。\
**年份 / 发表状态：** 2024；已发表 ASIACRYPT 2024；DBLP + ePrint。\
**阅读深度：** 摘要级。\
**BibTeX key：** `Baum2024OneTree`。\
**来源：** [IACR ePrint 2024/490](https://eprint.iacr.org/2024/490)；[DBLP 记录](https://dblp.org/rec/conf/asiacrypt/BaumBMORRRS24)；[正式 DOI](https://doi.org/10.1007/978-981-96-0875-1_15)。

优化 all-but-one vector commitment 和 GGM 树，结合少量签名端工作量证明改善参数，研究 AES、MQ 与 RAIN 三类 OWF 对 VOLEitH 的不同影响。

**模型与局限：** FAESTER、KuMQuat、MandaRain 并不共享相同底层困难假设；MQ 路线也不应笼统归入对称原语。速度与长度比较须保持安全级别、工作量证明参数和平台一致。ePrint 于 2025-03-31 修订，会议为 2024。

**研究启发（调研判断）：** 性能瓶颈从分组密码本身扩展到树、承诺、随机性和证明见证长度。

## E08 · Shorter, Tighter, FAESTer: Optimizations and Improved (QROM) Analysis for VOLE-in-the-Head Signatures

**作者：** Carsten Baum；Ward Beullens；Lennart Braun；Cyprien Delpech de Saint Guilhem；Michael Klooß；Christian Majenz；Shibam Mukherjee；Emmanuela Orsini；Sebastian Ramacher；Christian Rechberger；Lawrence Roy；Peter Scholl。\
**年份 / 发表状态：** 2025；已发表 CRYPTO 2025；Springer 正式页 + ePrint；DBLP 搜索本轮仅定位 ePrint 记录。\
**阅读深度：** 摘要级；并检查出版社正文脚注。\
**BibTeX key：** `Baum2025FAESTer`。\
**来源：** [IACR ePrint 2026/164](https://eprint.iacr.org/2026/164)；[正式 DOI](https://doi.org/10.1007/978-3-032-01887-8_5)。

把向量承诺中部分哈希调用替换为 AES-PRG，利用 AES S-box 代数结构压缩见证，并给出 Rényi 散度技术的经典分析及相应 QROM/Fiat–Shamir 分析。

**模型与局限：** 正式发表为 2025-08-17，ePrint 全文于 2026-01-31 上传，不能当作两个独立成果。Springer 脚注明确其形式化分析并不把 AES 建模为理想密码；具体假设不能简化为“在理想 AES 下安全”。

**研究启发（调研判断）：** 把更紧的安全损失转化为更小参数，并与代码优化一起评估。

## E09 · Lynx: Symmetric Primitive for Shorter and Faster VOLE-in-the-Head Signatures

**作者：** Lin Jiao；Hongsen Yang；Hongrui Cui；Yituo He；Yonglin Hao；Xiaojie Guo；Qunxiong Zheng；Jiang Zhang；Yu Yu；Kang Yang。\
**年份 / 发表状态：** 2026；近期预印本；2026-05-29 首发，2026-05-31 修订。\
**阅读深度：** 摘要级。\
**BibTeX key：** `Jiao2026Lynx`。\
**来源：** [IACR ePrint 2026/1099](https://eprint.iacr.org/2026/1099)。

为 VOLEitH 定制多分支对称原语 Lynx，通过见证长度、方程次数、有限域乘法及 VOLE 相关性数量优化 Lynxer 签名。体现“面向具体证明系统设计原语”的新方向。

**模型与局限：** 设计者声称覆盖全部经典/量子攻击并优于若干已有方案，不构成独立安全确认。性能数字比较的是指定设置下的 Rainier、AIMer、FAESTv2，不能扩张为对所有当前签名的领先结论。

**研究启发（调研判断）：** 优先独立分析：截断函数、低次数结构、代数攻击与量子资源，以及与最新 FAEST 参数的公平比较。

## E10 · Magic Pot: Cryptanalysis of Full AIM2 in the Standard and Related-/reused-Key Settings Using New Elimination Framework

**作者：** Alex Biryukov；Pablo García Fernández；Aleksei Udovenko。\
**年份 / 发表状态：** 2026；已发表 EUROCRYPT 2026；DBLP + ePrint（重大修订）。\
**阅读深度：** 摘要级。\
**BibTeX key：** `Biryukov2026MagicPot`。\
**来源：** [IACR ePrint 2026/903](https://eprint.iacr.org/2026/903)；[DBLP 记录](https://dblp.org/rec/conf/eurocrypt/BiryukovFU26)；[正式 DOI](https://doi.org/10.1007/978-3-032-25333-0_3)。

针对 AIMer v2.1 的 AIM2，以一元多项式环上的扩展线性化和多项式矩阵零向量算法构造代数攻击。作者报告标准设置下达不到标称级别；对 RAIN 也有分析改进。

**模型与局限：** 必须区分标准设置与密钥复用/相关密钥误用：摘要中实验上可行的攻击属于后者。不能概括为“所有 AIMer 使用均已实用攻破”；RAIN 改进明确未威胁其标称安全。首次上传 2026-05-08。

**研究启发（调研判断）：** 这是新 AO 原语必须与最新攻击同步评估的直接证据；攻击本身主要是经典代数攻击，也会影响后量子方案。

## E11 · One More Pair, More Information Gained: Improved Attacks on LowMC with Full S-box Layers Using Two Plaintext/Ciphertext Pairs

**作者：** Yimeng Sun；Jiamin Cui；Shiyao Chen；Meiqin Wang；Longzheng Cui；Chao Niu。\
**年份 / 发表状态：** 2025；预印本；本轮未确认正式录用。\
**阅读深度：** 摘要级。\
**BibTeX key：** `Sun2025LowMCTwoPairs`。\
**来源：** [IACR ePrint 2025/1498](https://eprint.iacr.org/2025/1498)；[DBLP 记录](https://dblp.org/rec/journals/iacr/SunCCWCN25)。

研究两个明密文对下的 LowMC，利用密钥导出差分降低方程次数，再结合改进差分枚举，作者报告扩展到部分八轮实例。其问题来源是签名应用的低数据量场景与安全证明所需假设的差异。

**模型与局限：** 限定于论文列出的全 S-box 层配置、数据条件与轮数，不能据此宣称所有 LowMC 或 Picnic 均已攻破。首次上传 2025-08-20；经典攻击仍直接影响 PQ 签名可信度。

**研究启发（调研判断）：** “一个/两个样本、已知/选择明文、OWF/PRP”之间的模型差别，很适合做严谨的安全边界研究。

## E12 · The SPHINCS+ Signature Framework

**作者：** Daniel J. Bernstein；Andreas Hülsing；Stefan Kölbl；Ruben Niederhagen；Joost Rijneveld；Peter Schwabe。\
**年份 / 发表状态：** 2019；已发表 ACM CCS 2019；DBLP + ePrint。\
**阅读深度：** 摘要级。\
**BibTeX key：** `Bernstein2019SPHINCSPlus`。\
**来源：** [IACR ePrint 2019/1086](https://eprint.iacr.org/2019/1086)；[DBLP 记录](https://dblp.org/rec/conf/ccs/BernsteinHKNRS19)；[正式 DOI](https://doi.org/10.1145/3319535.3363229)。

提出无状态哈希签名框架，以 FORS 和可调哈希函数抽象组织安全分析与参数选择。作为哈希原语支撑 PQC 的成熟经典基线保留。

**模型与局限：** 哈希签名属于公钥签名。2019 论文中的参数和标准化轮次是历史状态，不能代替当前 SLH-DSA 标准；采用哈希原语也不意味着可忽略多目标攻击和具体安全损失。

**研究启发（调研判断）：** 后续研究集中在更好的大小/时间折衷、实现保护以及多用户具体安全。

## E13 · At the Top of the Hypercube -- Better Size-Time Tradeoffs for Hash-Based Signatures

**作者：** Dmitry Khovratovich；Mikhail A. Kudinov；Benedikt Wagner。\
**年份 / 发表状态：** 2025；已发表 CRYPTO 2025；DBLP + ePrint。\
**阅读深度：** 摘要级。\
**BibTeX key：** `Khovratovich2025Hypercube`。\
**来源：** [IACR ePrint 2025/889](https://eprint.iacr.org/2025/889)；[DBLP 记录](https://dblp.org/rec/conf/crypto/KhovratovichKW25)；[正式 DOI](https://doi.org/10.1007/978-3-032-01887-8_4)。

重新研究 Winternitz 哈希链消息编码，建立给定签名长度下验证成本的下界，再用非均匀、高维超立方体顶层编码改善验证成本。适用于基于哈希链的签名框架。

**模型与局限：** 作者报告的 20%–40% 改善针对相应签名/编码成本，不能未经系统评估等同为整个 SLH-DSA 端到端性能提升；替换标准编码会形成新方案，需独立参数与兼容性处理。首次上传 2025-05-19。

**研究启发（调研判断）：** 说明哈希签名并未因标准化而停止基础研究：组合编码和紧致下界仍有空间。

## E14 · Secure Distributed State Management for Stateful Signatures with a Practical and Universally Composable Protocol

**作者：** Johannes Blömer；Henrik Bröcher；Volker Krummel；Laurens Porzenheim。\
**年份 / 发表状态：** 2025；近期预印本；2025-12-18 首发，本轮未确认正式录用。\
**阅读深度：** 摘要级。\
**BibTeX key：** `Bloemer2025DistributedState`。\
**来源：** [IACR ePrint 2025/2278](https://eprint.iacr.org/2025/2278)。

面向 LMS/XMSS 的一次性密钥使用状态，定义 UC 理想功能并给出分布式状态管理协议，应用于多个 HSM 组成的安全域。

**模型与局限：** 核心是有状态哈希签名的状态一致性，不能直接当作数据加密密钥管理定理。UC 安全声明的具体通信、故障与腐化假设须在正文中复核；摘要不证明一切现实故障下安全。

**研究启发（调研判断）：** 恢复、备份、并发签名与多 HSM 场景下，状态管理是独立于量子搜索复杂度的部署研究问题。

## 经典背景与补充追踪

Picnic 路线的经典起点是 Melissa Chase、David Derler、Steven Goldfeder、Claudio Orlandi、Sebastian Ramacher、Christian Rechberger、Daniel Slamanig、Greg Zaverucha 的 *Post-Quantum Zero-Knowledge and Signatures from Symmetric-Key Primitives*，CCS 2017: 1825–1842，DOI [10.1145/3133956.3133997](https://doi.org/10.1145/3133956.3133997)，已用 [DBLP 正式会议记录](https://dblp.org/rec/conf/ccs/ChaseDGORRSZ17)核验。这里作为 E06/E11 的背景，不另外计入 14 篇核心文献。

进一步值得追踪的 IACR 线索包括 [2025/981：Rain/AIM 多项式分解攻击](https://eprint.iacr.org/2025/981)、[2025/2272：AIM2 高指数修补的安全分析](https://eprint.iacr.org/2025/2272)、[2025/1999：MPCitH 的新 QROM 安全证明](https://eprint.iacr.org/2025/1999)、[2024/097：all-but-one 承诺与 half-tree](https://eprint.iacr.org/2024/097)、[2025/113：VOLEitH 门限环签名](https://eprint.iacr.org/2025/113)。这些本轮只完成发现，不用作已核验核心结论，也不把其摘要安全宣称视为审计结果。

## 可落地的研究问题（调研推断，非新颖性结论）

| 方向 | 可检验的问题 | 起读文献 | 在立项前必须核查 |
|---|---|---|---|
| 自适应 PQ-DiSE | 能否加入密钥刷新或成员变更而保留具体 QROM 安全与线性在线开销？ | E01–E03 | EQuADiSE 已覆盖哪些腐化、刷新、重分享与通信模型 |
| PQ 合取 DSSE | 能否把已证明渐近高效的后量子实例做成现实参数和可复现实验？ | E04–E05 | 同源/格实例假设、参数、查询泄漏及服务器恶意行为 |
| AES/VOLEitH 联合优化 | 承诺树、见证长度和安全损失哪个决定实际大小/时间最优点？ | E06–E08 | 最新协议版本、安全类别、平台和实现保护成本 |
| 新 AO 原语独立分析 | Lynx 截断与多分支结构是否留下新的代数或低数据量攻击面？ | E09–E11 | 完整参数、方程消元复杂度、经典与量子成本不能混用 |
| 哈希链编码与部署 | 编码改进能否与完整签名参数、状态管理和并发执行共同优化？ | E12–E14 | 一次性/少次签名限制、状态回滚、失效恢复与 UC 假设 |

## 数据质量与核验记录

- apaper MCP 的 `search_iacr_papers` 配合年份上下界出现不完整结果：2026 的 Lynx/EQuADiSE/Magic Pot 等使用 2024–2026 筛选时查不到，而无年份的 Rainier 检索能找到 2026/1099 和 2026/903。因此，本报告以官方页 History 和正式会议信息为准，MCP 返回 0 不视为不存在。
- `search_dblp_papers(include_bibtex=true)` 的八组查询均返回 JSON 解析或 Server disconnected 错误；后续转用 DBLP 官方网页，成功核验 E01、E02、E04、E06、E07、E10、E12、E13 的正式会议记录。**DBLP 的 `journals/iacr/*` 只是 ePrint 索引，不证明论文经过同行评审。**
- DBLP 原始 BibTeX 链接及页面 BibTeX 视图本轮未能取得；[applications.bib](applications.bib) 是从已读取的官方元数据整理的 BibTeX，文件头明确标注来源转录，并保留可重试的 DBLP `biburl`。不把它冒充成功下载的 DBLP 原始 BIB。
- E08 的正式出版年份、页码与 DOI 由 [Springer 正式页](https://link.springer.com/chapter/10.1007/978-3-032-01887-8_5)确认；官方脚注 3 说明其分析不把 AES 视作理想密码。E03 的 ESORICS 2026 信息、E05 的 ASIACCS 2025 信息在本轮仍主要依赖 ePrint 作者填写元数据，已单列该证据强度。
- 原始 MCP 查询日志仅作为本地辅助材料保留在 `evidence/applications-mcp.json`，不纳入 Git；报告已保留查询方式、论文来源与核验结论。对于最新预印本，未找到录用证据只记“未确认”，不记“未录用”。
- 本轮未收录泛泛声称“量子安全”的边缘应用文章；例如某些神经泄漏 LowMC 文章依赖额外泄漏模型，若不先核实模型与实现的联系，不宜作为标准 LowMC 安全被破坏的证据。
