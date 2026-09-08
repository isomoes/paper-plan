// Typst edition of survey.md. Keep the text synchronized with the Markdown source.

// Source SHA-256: e8754142be218dd4c6424c7f19cf1bb59650254627655b4b7f031e1cc84fc5ab

#import "report-style.typ": *

#text(size: 9pt, fill: muted)[文献来源与阅读范围]

文献时间范围截止：#strong[2026-09-08]；检索与整理于 #strong[2026-09-08 至 09]（台北时区跨日）完成。主要入口：本仓库的 #strong[apaper MCP / IACR ePrint]；发表核验：#strong[DBLP、IACR 期刊页、出版社及会议页面]。本文是面向选题的文献地图，覆盖检索到的主要公开研究路线，不声称穷尽所有论文，也不构成对论文证明或代码的独立复现。

#heading(level: 1)[1\. 先回答最关心的问题] <section-1>

#strong[值得研究的远不只是“把 AES 密钥加长”。] 当前活跃问题包括：怎样在实际资源约束下估计量子攻击成本；经典查询接口是否仍会受到超越 Grover 的结构攻击；怎样证明 Feistel、Sponge、PRF、MAC 和 AEAD 在量子环境下安全；多用户和预计算如何改变安全界；以及怎样让对称原语适合后量子签名、分布式加密和同态计算。

仓库原有 note\.md 引用的 2008 年观点可以作为历史背景，但“量子影响基本均匀、只需增加密钥长度”已不足以概括今天的研究。近期论文对结构、模式、查询模型与资源模型分别给出了更细的攻击和证明。另一方面，也不应反向写成“量子计算机已经使 AES 失效”：NIST 当前 FAQ 仍允许现有应用使用 AES-128/192/256，并强调 Grover 的串行性、并行代价与硬件成本。这是工程指导；理论上要求某一量子查询安全指数是另一种评价口径。#link("https://csrc.nist.gov/Projects/post-quantum-cryptography/faqs")[NIST PQC FAQ] #cite(<NISTPQCFAQ>)

下列“热点”和优先级是对本次论文样本的归纳，#strong[不是引用量排名或已证明的新颖性结论]。

#heading(level: 1)[2\. 范围与筛选方法] <section-2>

#heading(level: 2)[2\.1 核心、相邻与排除范围]

#report-table((1.1fr, 4.7fr, 3.5fr), [调研范围与层次], ([层次], [纳入对象], [与本课题的关系],), (
  [核心],
  [分组密码、流密码、公开置换、PRF/PRP、MAC、AEAD、哈希、密钥扩展及其量子攻击/证明],
  [直接回答对称密码的后量子安全],
  [系统扩展],
  [多用户、多密钥、预计算、分布式对称加密、可搜索对称加密、长期数据与密钥管理],
  [对称加密在实际使用方式下的安全],
  [相邻应用],
  [对称原语支撑的 MPC/VOLE-in-the-Head 签名、哈希签名、HHE/transciphering],
  [有独立研究价值；签名本身不是对称加密],
  [不作为主线],
  [泛 PQC 迁移综述、纯格/码 KEM、QKD 网络、加密量子态、量子货币/不可克隆令牌],
  [所需资源、对象或问题不同，仅同含“quantum/symmetric”不足以纳入],
))

SHA/哈希不是加密算法；这里纳入是因为其构造、安全证明和量子算法与对称密码高度共用。流密码包括 LFSR 快速相关攻击的量子化、ARX 电路与 ChaCha 应用线；其中 LFSR 工作使用较强查询能力，不能直接解释为实际流密码已被攻破。

#heading(level: 2)[2\.2 时间、质量与发表状态]

#list(
  [#strong[近两年窗口]：2024-09-08 至 2026-09-08；检索也覆盖 2024 年全年，便于追踪从 ePrint 到正式发表的跨年变化。],
  [#strong[近几个月窗口]：2026-06-08 至 2026-09-08。区分首次提交与修订；旧论文近期修订不自动算作新工作。],
  [#strong[较早论文]：优先保留与主线直接相关、已有 CRYPTO / EUROCRYPT / ASIACRYPT / ToSC / TCHES / CCS 等正式记录的基础工作。密码学重要成果大量发表于会议，不能只按“期刊”筛选。],
  [#strong[近期预印本]：可以保留；必须标为“预印本/录用未核实”，安全性、最快/首个等措辞均按作者主张理解。],
  [#strong[DBLP 的 #code-field("journals/​iacr/​.​.​.​") 是 ePrint 编目]，并非期刊录用证据。正式 journal、conference 记录才用于核验对应发表信息。检索不到也不等于未录用。],
  [记录 ePrint 年份、正式发表年份与版本关系；同一工作不因拥有 ePrint 和会议版本而算两篇独立成果。],
  [分报告逐条注明核读程度。本轮以#strong[原始摘要、元数据、发表页及部分正文/官方材料核读]为主，不宣称通读所有证明或复现实验。],
)

#heading(level: 2)[2\.3 检索与复核路径]

IACR 查询按主题展开：#code-field("quantum symmetric")、#code-field("Grover AES")、#code-field("Simon quantum")、#code-field("quantum differential")、#code-field("quantum Feistel")、#code-field("quantum sponge")、#code-field("quantum MAC")、#code-field("quantum PRF")、#code-field("post-​quantum signatures symmetric")、#code-field("distributed symmetric encryption")、#code-field("post-​quantum searchable")、#code-field("Saturnin")、#code-field("quantum homomorphic symmetric cipher") 等，并以精确标题回查。实际调用与响应可在本地 #code-field("evidence/​") 留存，该目录不纳入 Git；报告保留检索方法、原始论文链接和核验结论，不依赖这些辅助日志阅读。

本次遇到两种数据源限制，已在整理中处理：

#enum(
  [MCP 年份筛选不完全可靠：#code-field("quantum") 且起止年均为 2026 返回空结果，而较宽查询存在 2026 论文；另一查询标 2024-2025 却返回更早 ePrint 编号。可能混合了更新年份或搜索解析，#strong[不据此推断某年没有研究]，最终日期以原始页面为准。],
  [DBLP MCP 部分请求断连或 JSON 解析失败；DBLP BibTeX 导出也有访问失败。因此用 DBLP 官方记录/作者列表、期刊或出版社页交叉核验；书目文件明确区分原始获取与根据已核元数据转录的 BibTeX，不能统称“全部原样导出”。],
)

覆盖边界：本轮没有系统穷举 CNKI/Google Scholar；对于可更新加密与对称属性/功能加密，补充了代表性正式工作和最新线索，未穷举所有构造与底层假设。这里的“主要方向地图”不应转述为形式化系统综述或全领域无遗漏清单。

#heading(level: 1)[3\. 阅读前必须统一的模型] <section-3>

#report-table((1.7fr, 4.2fr, 3.7fr), [模型与资源口径], ([术语], [本文含义], [阅读时要问的问题],), (
  [Q1],
  [攻击者可量子计算，但与目标秘密密钥接口的在线查询为经典；公开算法常可离线量子求值],
  [需要多少经典数据？存储是否需 QRAM？离线量子 oracle 怎样实现？],
  [Q2],
  [允许对相应目标接口做叠加查询，通常强于普通部署中的访问能力],
  [究竟哪个接口可叠加？加密、解密、标签、公开置换是否相同？],
  [QROM / QICM / QIPM],
  [对量子随机预言机、理想密码或理想置换的建模],
  [理想化证明如何实例化？正反向查询、密钥查询、域分离如何规定？],
  [多用户/多目标],
  [多个用户或密钥、共享公开原语、攻击任一目标或全部目标],
  [总查询预算还是每用户预算？是否允许跨用户预计算？],
  [查询复杂度],
  [oracle 调用次数],
  [一次调用的门数、深度、量子比特是否计算在内？],
  [实际资源成本],
  [逻辑门、T-count/T-depth、宽度、深度、存储、容错与并行成本],
  [是否只给逻辑电路？硬件时钟、纠错与成功概率是否一致？],
))

这些记号在不同论文中会有细分；尤其 Q1 并不意味着“所有 oracle 都只能经典查询”。比较结果必须沿用论文自己的接口定义。单钥、唯一目标、无额外结构的理想穷举中，Grover 给出约 $2^(k/2)$ 次搜索迭代；它不直接等于 $2^(k/2)$ 个基本门或某个现实运行时间。哈希的原像、碰撞、第二原像和多目标问题也不能统一用“安全位数减半”描述。#link("https://csrc.nist.gov/Projects/Post-Quantum-Cryptography/Post-Quantum-Cryptography-Standardization/Evaluation-Criteria/Security-%28Evaluation-Criteria%29")[NIST 安全评估口径]

#pagebreak(weak: true)

#heading(level: 1)[4\. 研究方向地图] <research-map>

#report-table((0.65fr, 3.65fr, 3.05fr, 3.05fr), [14 类研究方向地图], ([编号], [方向与近年问题], [代表线索], [选题观察],), (
  [D1],
  [Grover / AES / 轻量级原语的具体资源估计，深度-宽度权衡],
  [Minimal T-depth / Minimal Width；AES Low DW-cost],
  [活跃且易做实验，但只替换一个密码通常不足以形成强贡献],
  [D2],
  [Simon、hidden shift、offline Simon 与周期结构自动搜索],
  [Quantum Periodic Distinguisher；Geometric Approach；2026/1528],
  [自动化、可实现性约束和反例检查形成连贯研究线],
  [D3],
  [差分、线性、快速相关、MITM、rebound 等经典攻击的量子化],
  [Improved Quantum Linear Attacks and Application to CAST；LFSR 快速相关；量子 MITM],
  [应比较相同数据/内存约束下最好的经典与量子基线],
  [D4],
  [EM/FX/Feistel 等分组密码构造的量子安全],
  [Key-Alternating Feistel；Compressed Permutation Oracles],
  [证明工具与最小轮数/紧界是理论重点],
  [D5],
  [PRF/MAC/AEAD 的量子安全定义、组合与证明],
  [Generic Composition Q2 AE；Keyed Sponge modular proof],
  [加密安全与认证安全需分别处理，特别是 Q2 伪造定义],
  [D6],
  [Sponge、哈希与置换模型中的不可区分性、indifferentiability 及预计算],
  [The Sponge is Quantum Indifferentiable；Quantum Lifting],
  [2024-2025 有多篇关联工作，是本次样本中最清晰的理论热点之一],
  [D7],
  [多用户、多密钥、预计算与具体安全界],
  [Multi-Key Security in the Quantum World（2026/382）；多密钥 Tweakable Key-Alternating Feistel（2026/1312）],
  [已有多用户 Feistel 工作，选题必须进一步限定构造或安全性质],
  [D8],
  [宽分组、高安全余量与轻量级原语/模式设计],
  [Saturnin；Ascon 标准；Rijndael-256/Accordion 动向],
  [分组长度、密钥长度、标签与容量分别约束不同风险],
  [D9],
  [对称原语在后量子签名中的设计和密码分析],
  [FAEST v2；Lynx；Magic Pot / AIM2],
  [共设计与代数攻击相互推动；属于相邻应用],
  [D10],
  [哈希签名与多目标哈希安全、实现可靠性],
  [SPHINCS+ / SLH-DSA],
  [应围绕具体哈希性质、状态/故障或资源问题，而非泛泛更换哈希],
  [D11],
  [门限/分布式加密、可搜索对称加密的后量子化],
  [EQuADiSE；PQC conjunctive dynamic SSE],
  [必须同时看自适应腐化、泄漏、假设和真正 PQC 实例的效率],
  [D12],
  [HHE / transciphering、ARX/算术友好原语与实现保护],
  [PASTA；PETCHA；2026/1485],
  [客户端带宽、服务端同态成本与侧信道防护构成可测量权衡],
  [D13],
  [可更新对称加密、轮换密钥与密钥泄漏后的保护],
  [CCA Secure Updatable Encryption from Non-Mappable Group Actions（PQCrypto 2024）],
  [接口虽是对称原语，强功能可能需要公钥级假设；需核 ROM/QROM 差别],
  [D14],
  [受限 PRF、对称谓词/功能加密、对称属性加密],
  [CRYPTO 2026 的 compute-and-compare CPRF；2026/1018 预印本],
  [属高级功能扩展，不应误认为仅凭 AES/哈希就能获得全部功能],
))

完整逐篇条目见第 8 节补充目录及本文第 10-12 节专题汇编；第 7 节也保留独立专题文件入口。论文名称在各目录中附有原始链接、发表状态与模型限制。

#pagebreak(weak: true)

#heading(level: 1)[5\. 最值得优先深入的选题] <research-questions>

以下是由文献推出的#strong[候选研究问题]，不是已经证明无人研究的空白。正式立项前，应对目标构造和拟改进指标再做一轮前后向引文检索。

#report-table((1.1fr, 3.25fr, 3.4fr, 2.7fr), [候选选题、最小成果与主要风险], ([优先级], [候选问题], [最小可检验成果], [主要风险],), (
  [1：偏理论],
  [面向具体置换模式的 Q1 多用户/预计算安全分析],
  [明确游戏、攻击基线、包含用户数与查询预算的界；尽量配匹配攻击],
  [单钥提升可能已被最新通用定理覆盖],
  [1：偏密码分析],
  [对周期区分器搜索加入可实现性、密钥依赖与概率约束],
  [可复现搜索器；见证验证；报告真正可用的攻击轮数与完整成本],
  [符号路径不一定对应有效量子 oracle，2026/1528 已明确触及此点],
  [1：偏实现],
  [相同深度上限下的 AES/Ascon/ARX oracle 成本比较],
  [统一成功概率、反计算、密钥日程、明密文对数和门集；公开结果],
  [不同论文数字通常不可直接横比；逻辑门优化不等于物理可行],
  [2：偏证明],
  [新置换工具在 keyed sponge / MAC / AEAD 中的紧界或组合应用],
  [一个具体、尚未由已有框架覆盖的安全性质或更紧参数界],
  [容易重复近期 2025 系列结果；Q2 验证/伪造定义较细],
  [2：偏构造分析],
  [VOLEitH 原语的证明成本与代数安全余量联合评估],
  [对 Lynx/RAIN/AIM2 等统一约束计数与攻击评估，明确版本],
  [新设计研究不充分；签名总性能受多组件影响],
  [2：偏系统],
  [真正 PQC 的 DiSE/SSE 端到端实现和假设审计],
  [同一目标安全级别的通信、延迟、服务器/客户端开销及泄漏表],
  [格/同源等组件与证明门槛高；不能移用经典实例实验结果],
  [3：相邻应用],
  [ChaCha/PASTA 在 HHE 中的吞吐、客户端保护与同态成本],
  [对 PETCHA/PASTA 的可复现实现或有证明支撑的优化],
  [需要 FHE 背景；仅做平台移植不一定有足够新意],
))

如果目标是围绕“对称加密”本身写高质量研究文章，建议首先缩到 #strong[D7+D5（多用户模式证明）]、#strong[D2+D3（量子攻击自动化）] 或 #strong[D1（统一约束的资源估计）] 中的一条。若偏工程，D11/D12 有应用抓手；若偏后量子签名，则应明确改题到 D9。

#pagebreak(weak: true)

#heading(level: 1)[6\. 近几个月的重点观察项] <recent-papers>

#report-table((4.05fr, 2.25fr, 3.7fr), [近期论文及版本观察], ([工作], [首次公开/近期版本], [已核状态与观察理由],), (
  [Collusion-Resistant Constrained PRFs for Compute-&-Compare Predicates from LWE，2026/1874],
  [ePrint 2026-09-02 received，09-06 approved],
  [ePrint 标 CRYPTO 2026 并给正式 DOI；ePrint 上传晚于会议，不称九月才首次提出],
  [Novel SMT Encoding for Quantum Circuit Optimization，2026/1815],
  [2026-08-27 received，08-28 approved],
  [预印本；本次收录的八月量子电路优化线索],
  [A Geometric Approach to Quantum Distinguishers，2026/1158],
  [2026-06-03 首发，06-09 修订],
  [CRYPTO 2026 相关正式版本；三个月窗口内的是修订，非首发],
  [Post-Quantum Security of Tweakable Key-Alternating Feistel Ciphers in the Multi-Key Setting，2026/1312],
  [2026-06-23 首发，2026-07-08 修订],
  [ePrint 标注 SCN 2026 版本；补充多用户构造方向],
  [Revisiting Automated Quantum Periodic Distinguisher Construction，2026/1528],
  [2026-07-25 received],
  [预印本；强调起点可实现性和依赖密钥的过滤条件],
  [From PQC to HHE，2026/1485],
  [2026-07-20 received],
  [预印本；复用 PQC 硬件平台保护 PASTA],
  [Multi-Key Security in the Quantum World，2026/382],
  [2026-06-16 修订，首次并非六月],
  [ToSC 2026；多密钥 Q1 分析，不能把修订日期当首发],
  [PETCHA，2026/112],
  [2026-06-08 修订，2026-01-23 首发],
  [PQCrypto 2026；同态求值标准 ChaCha 的效率],
  [Lynx，2026/1099],
  [2026-05；略早于严格三个月窗口],
  [预印本，保留为近半年线索；VOLEitH 专用原语],
  [Magic Pot，2026/903],
  [2026 年；详细版本见应用目录],
  [EUROCRYPT 2026 论文重大修订；连接原语设计与代数密码分析],
))

这里只列与主线最相关且已核到原始页面的观察项；“最近”不等于“优先采用”，近期预印本需要更多独立分析。

#heading(level: 1)[7\. 逐篇论文记录] <section-7>

本报告共含 #strong[54 篇编号研究论文]：攻击 A01-A16（16 篇）、证明 P01-P17（17 篇）、应用 E01-E14（14 篇），以及补充 S1-S4、S6-S8（7 篇）；S5 为标准背景，不计入研究论文数。下方保留专题文件入口，#strong[全部逐篇记录也直接汇总在本文第 10-12 节]，无需跳转即可阅读全文。未展开的额外追踪线索不计入 54 篇。

#list(
  [#link(<attack-catalog>)[量子攻击与资源估计]],
  [#link(<proof-catalog>)[安全模型、证明与对称构造]],
  [#link(<application-catalog>)[对称原语支撑的 PQC 应用及加密扩展]],
)

统一书目见 #link(<bibliography>)[references\.bib]。各专题原始书目保留以便追溯。下节补充不与上述目录重复的设计、HHE 与标准背景。

#pagebreak(weak: true)

#heading(level: 1)[8\. 补充论文与标准背景] <supplemental-papers>

#block(breakable: false)[

#heading(level: 2)[S1\. Saturnin: a suite of lightweight symmetric algorithms for post-quantum security #cite(<Canteaut2020Saturnin>)] <paper-S1>

#strong[作者]：Anne Canteaut, Sébastien Duval, Gaëtan Leurent, María Naya-Plasencia, Léo Perrin, Thomas Pornin, André Schrottenloher。#strong[正式发表]：ToSC 2020(S1), 160-207，2020-06-22；DBLP 正式 journal 记录已核。#strong[核读]：期刊摘要与元数据。

以 256 位分组、256 位密钥的 Saturnin 为基础，组合认证加密与哈希，同时考虑小型设备上的 bitslice 实现和后量子分析。适合作为“原语、模式、实现共同设计”的基础参照，而不是新算法部署推荐。其安全讨论仍依赖文中的模型和对底层原语的分析；参数数值本身不等于无条件量子安全证明。#link("https://tosc.iacr.org/index.php/ToSC/article/view/8621")[期刊原文]；#link("https://dblp.org/rec/journals/tosc/CanteautDLNPPS20")[DBLP]；#link("https://doi.org/10.13154/tosc.v2020.iS1.160-207")[DOI]。

]

#block(breakable: false)[

#heading(level: 2)[S2\. Pasta: A Case for Hybrid Homomorphic Encryption #cite(<Dobraunig2023Pasta>)] <paper-S2>

#strong[作者]：Christoph Dobraunig, Lorenzo Grassi, Lukas Helminger, Christian Rechberger, Markus Schofnegger, Roman Walch。#strong[ePrint]：2021/731。#strong[正式发表]：TCHES 2023(3), 30-73，DBLP 正式记录已核。#strong[核读]：原始摘要与发表元数据。

提出面向整数 HHE 的 PASTA，优化乘法深度和 BFV/BGV 同态求值，附开放基准框架，强调应评价真实用例而非只数一个非线性操作。属于对称加密与格基同态加密的交叉；整个系统的后量子性仍取决于对称层、HE 假设、参数和组合方式。#link("https://eprint.iacr.org/2021/731")[ePrint]；#link("https://dblp.org/rec/journals/tches/Dobraunig0HRSW23")[DBLP]；#link("https://doi.org/10.46586/tches.v2023.i3.30-73")[DOI]。

]

#block(breakable: false)[

#heading(level: 2)[S3\. PETCHA: Post-quantum Efficient Transciphering with ChaCha #cite(<Guimaraes2026Petcha>)] <paper-S3>

#strong[作者]：Antonio Guimarães, Gabriela M\. Jacob, Hilder V\. L\. Pereira。#strong[ePrint]：2026/112，2026-01-23 首次收到，2026-06-08 修订。#strong[正式发表]：PQCrypto 2026 Part II, 178-203；ePrint 与 DBLP 会议目录交叉核实。#strong[核读]：摘要、History 与发表记录。

同态计算 ChaCha 来完成 transciphering，减少弱客户端上传 FHE 密文的带宽负担。作者在相应单核实验及比较设置下报告相对扩展版 Hippogryph 更低延迟、更高吞吐；这里不把该优势外推到所有硬件或所有 FHE 参数。论文采用理论查询意义的量子安全目标，不应把摘要中对 AES-128 的措辞解释成 NIST 已宣布普通 AES-128 部署失效。#link("https://eprint.iacr.org/2026/112")[ePrint]；#link("https://dblp.org/db/conf/pqcrypto/pqcrypto2026-2.html")[DBLP 会议目录]；#link("https://link.springer.com/book/10.1007/978-3-032-22698-3")[出版社论文集]。

]

#block(breakable: false)[

#heading(level: 2)[S4\. From PQC to HHE: Reusing a Co-Design Platform for Side-Channel-Protected PASTA #cite(<Malal2026PASTA>)] <paper-S4>

#strong[作者]：Ahmet Malal, Tolun Tosun, Oğuz Yayla, Erkay Savas。#strong[ePrint]：2026/1485，2026-07-20 received。#strong[状态]：预印本，未核到正式录用。#strong[核读]：摘要与元数据。

复用 RISQrypt 的算术、Keccak 和掩码加速能力实现 PASTA，不增加密码专用 RTL。作者在 Artix-7、相应软件基线下报告约 9\.7-9\.9 倍加速，掩码乘法的 100,000 条迹线 TVLA 未发现一阶泄漏。该测试不构成所有部件或高阶攻击下的侧信道安全证明；这是“PQC 平台复用与保护实现”线索，不是新的量子攻击定理。#link("https://eprint.iacr.org/2026/1485")[ePrint]。

]

#heading(level: 2)[S5\. 作为选题约束的官方材料]

#list(
  [#strong[NIST SP 800-232，2025-08-13 最终版]：规范 Ascon-AEAD128、Ascon-Hash256、Ascon-XOF128、Ascon-CXOF128。它提供当前轻量级实验对象和参数基准；“标准化”不等于自动满足任意 Q2 安全定义或任意 128 位量子安全目标。#link("https://csrc.nist.gov/pubs/sp/800/232/final")[正式标准] #cite(<NIST2025Ascon>)],
  [#strong[Rijndael-256 与 Accordion 开发方向]：NIST 的公开材料讨论 256 位分组、可变长 tweak、大数据量及 beyond-birthday-bound 使用。AES-256 的“256”是密钥长度，不能与 Rijndael-256 的分组长度混为一谈。这些材料支持“大数据模式和宽分组”具有实际研究动机；不能据此声称这些构造已经取得量子安全证明。引用页面为开发/征求意见材料，不写作已完成标准。#link("https://csrc.nist.gov/pubs/sp/800/197/iprd")[SP 800-197 前期公告] #cite(<NIST2024Rijndael256>)；#link("https://csrc.nist.gov/pubs/sp/800/197/a/iprd")[SP 800-197A 前期公告] #cite(<NIST2025AccordionDevelopment>)],
  [#strong[Accordion 模式的需求冲突]：NCSC 在 NIST 的 2024 年研讨会报告明确讨论 key/context commitment、多用户使用界、nonce 派生成本、理想密码假设与量子证明适用性之间的取舍。这是 D5+D7 选题的实用动机材料，属于研讨会报告而非同行评审研究论文。#link("https://csrc.nist.gov/Presentations/2024/requirements-for-an-accordion-mode")[报告页]],
)

#block(breakable: false)[

#heading(level: 2)[S6\. CCA Secure Updatable Encryption from Non-Mappable Group Actions #cite(<Meers2024Updatable>)] <paper-S6>

#strong[作者]：Jonas Meers, Doreen Riepel。#strong[ePrint]：2024/499，2024-03-28 received。#strong[正式发表]：PQCrypto 2024 Part I, 137-169；DBLP 作者页/会议目录与出版社目录均已核。#strong[核读]：摘要、History、发表元数据。

研究通过更新令牌轮换密钥并更新密文的可更新加密。先构造基于弱伪随机性的 CPA 方案，再给出采用更强群作用假设、在 ROM 中证明 CCA 安全的方案。这里“基于后量子假设”与“整个证明已在 QROM 中成立”是不同判断，本次摘要核读不足以确认后者。文中也强调，具备相应前向安全和泄漏后安全的强 UE 虽是对称接口，却蕴含公钥加密能力；不能预期单纯更换 AES 密钥长度解决整个问题。#link("https://eprint.iacr.org/2024/499")[ePrint]；#link("https://dblp.org/rec/conf/pqcrypto/MeersR24")[DBLP]；#link("https://link.springer.com/book/10.1007/978-3-031-62743-9")[出版社]。

]

#block(breakable: false)[

#heading(level: 2)[S7\. Collusion-Resistant Constrained PRFs for Compute-&-Compare Predicates from LWE #cite(<Cheng2026ConstrainedPRF>)] <paper-S7>

#strong[作者]：Jiaqi Cheng, Rishab Goyal。#strong[ePrint]：2026/1874，2026-09-02 received，09-06 approved。#strong[状态]：IACR 页面标为 CRYPTO 2026 并提供正式 DOI；本次未取得 DBLP 正式记录。#strong[核读]：摘要与发表元数据。

构造基于标准 LWE 的抗合谋受限 PRF，面向 compute-and-compare 与 predicated-range 约束，并给出约束隐私、近似密钥同态性质及对称密钥 PE/FE 应用。它补充了“对称加密可支持哪些高级功能”的路线；底层是格假设，并非只依赖对称密码原语。量子攻击者的约束密钥访问能力与 LWE 参数仍需正文核读，不能由标题直接推广成 Q2 安全结论。#link("https://eprint.iacr.org/2026/1874")[ePrint]；#link("https://doi.org/10.1007/978-3-032-35367-2_17")[正式 DOI]。

]

#block(breakable: false)[

#heading(level: 2)[S8\. Symmetric Attribute-Based Encryption from Minimal Hardness Assumptions（观察项） #cite(<Longo2026SymmetricABE>)] <paper-S8>

#strong[作者]：Riccardo Longo, Enrico Sorbera。#strong[ePrint]：2026/1018，2026-05-21 received。#strong[状态]：预印本，未核到录用。#strong[核读]：摘要与元数据。

将 ciphertext-policy ABE 放入一个加密者也需要满足属性条件的对称框架，使用 PRF、抗碰撞哈希、线性秘密共享与插值。其“原生后量子安全”是作者摘要主张；应进一步核对 PRF/哈希要求的量子性质、串谋模型和与传统 ABE 的功能差别。本次保留是为了覆盖新出现的功能方向，不把它列为已经充分验证的成熟基础。#link("https://eprint.iacr.org/2026/1018")[ePrint]。

]

#heading(level: 1)[9\. 论文比较表应保留的字段] <section-9>

后续决定精读对象时，建议为每个具体结果记录：

#report-table((1.0fr, 8.5fr), [论文比较与审阅字段], ([类别], [必要字段],), (
  [来源],
  [精确标题；全部作者；ePrint ID；首次/修订日期；正式 venue/年/DOI；DBLP 类型；版本对应关系],
  [对象],
  [原语/模式/协议；完整轮数与攻击轮数；密钥/分组/标签/容量；消息长度与 nonce 条件],
  [安全],
  [Q1/Q2 及各 oracle；单/多用户；CPA/CCA/PRF/伪造等目标；理想模型与底层假设],
  [攻击],
  [数据；时间；经典/量子内存；QRAM；预计算；成功概率；是否只限相关/复用密钥],
  [实现],
  [门集；T-count/T-depth；总深度；宽度；反计算；物理资源是否估计；代码/基准版本],
  [结论],
  [正文定理还是摘要主张；是否复现；对比基线是否一致；适用边界；下一步待核问题],
))

按这套字段筛选，能够把“近期值得跟踪的想法”“已有正式发表的基础”“可以据此立项的具体差距”分开。尤其不能以未找到 DBLP、标题出现 quantum、降低量子电路成本，分别推出未录用、后量子安全或密码设计更安全。

#pagebreak(weak: true)

#heading(level: 1)[10\. 量子攻击与资源估计：完整记录] <attack-catalog>

调研范围：对称原语面对量子对手的结构攻击、通用密码分析、量子电路资源估计。检索截止日期：#strong[2026-09-08]（整理工作跨至台北时间 2026-09-09）。重点检索 IACR ePrint；正式发表状态使用 IACR 页面、DBLP 官方记录/官方搜索索引及作者机构出版记录交叉核验。

#heading(level: 2)[阅读与证据等级]

#list(
  [#strong[A：摘要与书目核验]：核读论文的官方摘要/出版页面，未逐条复算证明或攻击复杂度。除特别标注的 A08 外，本清单全部属于 A。],
  [#strong[B：定点正文核读]：A08 额外阅读 PDF 前 4 页（按文件顺序）导论及模型限制，仍不等于全文复现。],
  [#strong[正式发表（DBLP 元数据核验）]：已经看到 DBLP 正式会议/期刊记录，且与 IACR 或作者机构记录一致。],
  [#strong[正式发表（IACR 元数据核验）]：ePrint 的 Publication info 明确写明会议/期刊，但本次尚未取得对应 DBLP 正式条目的完整 BibTeX。],
  [#strong[预印本]：仅确认公开可访问，不把 ePrint 收录或 DBLP 的 IACR Cryptol\. ePrint Arch\. 条目当作录用。],
)

本专题没有执行电路仿真、复现代码或复核证明；所有精确参数均须在开展课题前回到指定版本、模型和表格复核。

#heading(level: 2)[方向地图与判断]

#report-table((2.1fr, 2.3fr, 3.2fr, 3.1fr), [量子攻击与资源估计的方向地图], ([方向], [已有研究基础], [2024-2026 的活跃变化], [对选题的意义],), (
  [Q2 结构攻击与周期区分器],
  [Simon、Grover-meet-Simon、隐藏周期],
  [截断差分联系 → SMT 符号搜索 → 前缀可实现性与密钥依赖条件（A05/A09/A15）],
  [自动发现之外，更需要验证区分器确实可实现，明确成功密钥比例],
  [量子线性、差分及混合攻击],
  [Grover、幅度放大/估计；经典最优攻击未必量子最优],
  [相关态与区分器组合；几何统一框架（A08/A14）],
  [将“有区分优势”变成“可标记正确子密钥”，并计入数据装载],
  [Q1 离线量子攻击],
  [Offline Simon 在经典查询后量子计算],
  [置换 PRF 的时间/数据折中（A13）],
  [应按具体构造验证，不能泛化为所有 PRF 被同一指数攻破],
  [流密码量子分析],
  [LFSR 快速相关攻击],
  [量子 Hadamard 与有限域离散对数结合（A06）],
  [研究状态查询接口的现实性；强 Q2 结果不等于现网流密码失守],
  [AES/轻量级的资源估计],
  [完整 Grover oracle 与深度限制（A04）],
  [最小 T-depth、最小宽度、DW-cost、SMT 最优性（A10/A11/A16）],
  [从单个 S-box 指标转向完整攻击 oracle 与统一成本模型],
  [嵌套搜索/MITM/反弹攻击通用工具],
  [多层 Grover/幅度放大],
  [自动化复杂度框架与常数开销优化（A07）],
  [适合与自动搜索框架结合；必须重算量子内存和可逆过滤成本],
  [Ascon 等新标准相关评估],
  [密钥搜索与碰撞资源建模],
  [电路估计（A12）和小型非线性层综合（A16）],
  [必须区分 Ascon 历史版本、AEAD 与 Hash，以及模式证明和具体置换分析],
))

这里的“活跃”指本次精选文献在近两年存在连续进展，#strong[不是基于全数据库论文数量或引用量的计量排名]。

#heading(level: 3)[必须统一的攻击模型]

#strong[Q1] 表示攻击者有量子计算能力，对秘密密钥原语只发经典查询；#strong[Q2] 还允许对秘密密钥原语进行叠加查询。两者都可能允许攻击者在本地对公开算法实现量子电路。Q1 并不自动意味着“没有量子内存假设”：部分算法还需要量子可访问经典内存（QRACM），必须单列。

查询复杂度、经典数据量、逻辑门数、T-count、T-depth、总深度、逻辑量子位、DW-cost、物理量子位及容错运行时间是不同指标。低成本量子 AES 实现意味着更便宜的攻击 oracle；它不会让 AES 本身变得更安全。也不能单凭 Grover 的平方根加速就把所有具体算法的安全强度机械减半。A02、A04、A08 提供了这些区分的直接研究依据。

#heading(level: 2)[精选论文（16 篇）]

#block(breakable: false)[

#heading(level: 3)[A01\. Q2 结构攻击的基础文献 #cite(<KaplanLLN2016Period>)] <paper-A01>

#strong[Breaking Symmetric Cryptosystems Using Quantum Period Finding]#linebreak()
Marc Kaplan; Gaëtan Leurent; Anthony Leverrier; María Naya-Plasencia\. #strong[CRYPTO 2016, Part II, pp\. 207-237]。

#list(
  [状态：正式发表，DBLP 与 Springer 正式论文集核验。],
  [来源：#link("https://dblp.org/rec/conf/crypto/KaplanLLN16")[DBLP]；#link("https://doi.org/10.1007/978-3-662-53008-5_8")[DOI]；#link("https://arxiv.org/abs/1602.05973")[作者预印本]；#link("https://www.iacr.org/archive/crypto2016/98150203/98150203.pdf")[IACR 正式 PDF]。],
  [贡献：将隐藏 XOR 周期与 Simon 算法用于对称结构、认证模式及滑动攻击，表明量子威胁并不局限于 Grover。],
  [模型/局限：#strong[Q2]。论文对 CBC-MAC、GCM 等的结果必须连同叠加查询模型陈述，不能转述为经典网络接口已遭同样攻击。],
  [阅读：A；保留理由：理解后续模式安全与周期区分器文献必读。],
)

]

#block(breakable: false)[

#heading(level: 3)[A02\. 量子差分与线性分析的基础框架 #cite(<KaplanLLN2016Differential>)] <paper-A02>

#strong[Quantum Differential and Linear Cryptanalysis]#linebreak()
Marc Kaplan; Gaëtan Leurent; Anthony Leverrier; María Naya-Plasencia\. #strong[IACR ToSC 2016(1), pp\. 71-94]。

#list(
  [状态：正式发表，DBLP 核验。不要误写为 2016(3)。],
  [来源：#link("https://dblp.org/rec/journals/tosc/KaplanLLN16")[DBLP]；#link("https://doi.org/10.13154/tosc.v2016.i1.71-94")[DOI]；#link("https://arxiv.org/abs/1510.05836")[作者预印本]。],
  [贡献：分析差分/线性攻击的量子化，说明经典最优方案未必在量子模型下最优，且不同变体不都获得统一平方根加速。],
  [模型/局限：明确比较只有量子计算与还可量子查询的情况，即 #strong[Q1/Q2 分场景]；示例是 LAC/KLEIN，不能外推为完整 AES 攻击。],
  [阅读：A；保留理由：给整个后续“重新优化经典分析”的方向奠基。],
)

]

#block(breakable: false)[

#heading(level: 3)[A03\. 经典查询下的 Offline Simon #cite(<BonnetainHNSS2019OfflineSimon>)] <paper-A03>

#strong[Quantum Attacks Without Superposition Queries: The Offline Simon's Algorithm]#linebreak()
Xavier Bonnetain; Akinori Hosoyamada; María Naya-Plasencia; Yu Sasaki; André Schrottenloher\. #strong[ASIACRYPT 2019, Part I, pp\. 552-583]。

#list(
  [状态：正式发表，DBLP 官方作者页与 ePrint 核验。],
  [来源：#link("https://eprint.iacr.org/2019/614")[ePrint 2019/614]；#link("https://dblp.org/rec/conf/asiacrypt/BonnetainHNSS19")[DBLP]。],
  [贡献：将 Simon 子程序移入离线量子计算阶段；对 Even-Mansour 给出量子时间/经典数据均为约 $2^(n/3)$、量子位 $O(n^2)$ 的示例。],
  [模型/局限：核心是 #strong[Q1]，另讨论复用叠加查询的视角；要计入经典数据获取及装载，复杂度依赖具体构造和参数，不适用于任意分组密码。],
  [阅读：A；保留理由：是“经典服务接口也要考虑结构性量子攻击”的关键依据。],
)

]

#block(breakable: false)[

#heading(level: 3)[A04\. 完整 Grover oracle 与实际资源核算 #cite(<JaquesNRV2020Grover>)] <paper-A04>

#strong[Implementing Grover Oracles for Quantum Key Search on AES and LowMC]#linebreak()
Samuel Jaques; Michael Naehrig; Martin Roetteler; Fernando Virdia\. #strong[EUROCRYPT 2020, Part II, pp\. 280-310]；预印本首次 2019-10-03。

#list(
  [状态：正式发表；DBLP、IACR、Royal Holloway 出版记录核验。],
  [来源：#link("https://eprint.iacr.org/2019/1146")[ePrint 2019/1146]；#link("https://dblp.org/rec/conf/eurocrypt/JaquesNRV20")[DBLP]；#link("https://doi.org/10.1007/978-3-030-45724-2_10")[DOI]。],
  [贡献：完整 Grover 密钥搜索 oracle 的 Q\# 实现与可复现估计；在深度上限下共同考虑门数、宽度和 DW-cost。],
  [模型/局限：#strong[Q1 可适用的本地密钥搜索]；少量经典明密文对与公开加密算法可逆实现足够。逻辑资源并非真实物理机器开销。],
  [#strong[版本警示]：官网注明 2023-06-07 修订纠正 Q\# bug 导致的 AES 资源估计错误，LowMC 未重算。比较时必须记录所用版本，不能直接拼接原版与修订版表格。],
  [阅读：A。],
)

]

#block(breakable: false)[

#heading(level: 3)[A05\. 截断差分与周期区分器的联系 #cite(<XiangWYSZZSL2024Links>)] <paper-A05>

#strong[Links between Quantum Distinguishers Based on Simon's Algorithm and Truncated Differentials]#linebreak()
Zejun Xiang; Xiaoyu Wang; Bo Yu; Bing Sun; Shasha Zhang; Xiangyong Zeng; Xuan Shen; Nian Li\. #strong[IACR ToSC 2024(2), pp\. 296-321]。

#list(
  [状态：正式发表，DBLP 官方记录与 FSE 2025 节目册核验。],
  [来源：#link("https://dblp.org/rec/journals/tosc/XiangWYSZZSL24")[DBLP]；#link("https://doi.org/10.46586/tosc.v2024.i2.296-321")[DOI]。],
  [贡献：连接 Simon 型量子区分器与截断差分，为调用现有经典自动分析工具提供理论路径。],
  [模型/局限：属于 #strong[Q2 周期区分器] 研究；后续 A09 指出此路径对未知差分构造周期和自动化仍有局限。],
  [阅读：A，贡献依据题录及 A09 官方摘要对前作的说明，#strong[未核读本篇完整摘要/正文]。应在正式立项时补读原文。],
)

]

#block(breakable: false)[

#heading(level: 3)[A06\. LFSR 流密码的快速相关攻击 #cite(<Hosoyamada2024FastCorrelation>)] <paper-A06>

#strong[Quantum Algorithms for Fast Correlation Attacks on LFSR-Based Stream Ciphers]#linebreak()
Akinori Hosoyamada\. #strong[ASIACRYPT 2024, Part VIII, pp\. 396-430]。

#list(
  [状态：正式发表；DBLP 作者页与 ePrint 核验；ePrint 2024-06-05 首发，2024-09-20 修订。],
  [来源：#link("https://eprint.iacr.org/2024/894")[ePrint 2024/894]；#link("https://dblp.org/rec/conf/asiacrypt/Hosoyamada24")[DBLP]。],
  [贡献：借助量子 Hadamard 变换及 LFSR 状态更新与有限域乘法的联系构造加速算法；分析 SNOW 2\.0、SNOW 3G、Sosemanuk。],
  [模型/局限：#strong[论文自定义的强 Q2 模型]，包含比通常现网接口强的能力；抽象安全结果不能直接解释为这些流密码在正常部署下被量子高效破解。],
  [阅读：A；保留理由：补充分组密码之外的流密码方向。],
)

]

#block(breakable: false)[

#heading(level: 3)[A07\. 通用嵌套搜索的量子化 #cite(<SchrottenloherStevens2024Nested>)] <paper-A07>

#strong[Quantum Procedures for Nested Search Problems: with Applications in Cryptanalysis]#linebreak()
André Schrottenloher; Marc Stevens\. #strong[IACR Communications in Cryptology 1(3), Article 9, 2024]。

#list(
  [状态：正式发表；DBLP 作者页、CWI 机构出版记录与 IACR DOI 核验。预印本首次年份 2022，不应误当 2024 新提出的全部成果。],
  [来源：#link("https://eprint.iacr.org/2022/761")[ePrint 2022/761]；#link("https://doi.org/10.62056/aee0fhbmo")[DOI]；#link("https://ir.cwi.nl/pub/34918")[CWI]；#link("https://dblp.org/pid/15/4413")[DBLP 作者页]。],
  [贡献：给多层选择、过滤、回溯搜索通用量子转换与复杂度公式，减少直接嵌套幅度放大的开销，并用于减轮 AES。],
  [模型/局限：是通用算法框架，#strong[Q1/Q2 由其调用的底层 oracle 决定]；过滤可逆实现、成功概率、内存访问都需计价。],
  [阅读：A；保留理由：适合与 MITM、反弹、差分搜索及自动化工具对接。],
)

]

#block(breakable: false)[

#heading(level: 3)[A08\. 相关态与区分器的混合量子线性攻击 #cite(<BashiriBHLS2025Linear>)] <paper-A08>

#strong[Improved Quantum Linear Attacks and Application to CAST]#linebreak()
Kaveh Bashiri; Xavier Bonnetain; Akinori Hosoyamada; Nathalie Lang; André Schrottenloher\. #strong[IACR ToSC 2025(2), pp\. 124-165]。

#list(
  [状态：正式发表，DBLP 与 IACR 核验；ePrint 2024-12-09 首发，2025-05-27 修订。],
  [来源：#link("https://eprint.iacr.org/2024/1992")[ePrint 2024/1992]；#link("https://eprint.iacr.org/2024/1992.pdf")[PDF]；#link("https://dblp.org/rec/journals/tosc/BashiriBHLS25")[DBLP]；#link("https://doi.org/10.46586/tosc.v2025.i2.124-165")[DOI]。],
  [贡献：用附加区分器标记相关态中的正确子密钥，再做幅度放大；融合 Simon 与线性分析并应用于 CAST。],
  [模型/局限：#strong[Q1 + 快速 QRACM，和/或 Q2]。PDF 导论明确指出消除大型 QRACM 要求仍是开放问题；部分示例额外经典预计算抵消表面优势。减轮结果不应写成全轮破解。],
  [阅读：#strong[B：摘要、书目与 PDF 前 4 页（按文件顺序）]；尚未复算表中每条攻击。],
)

]

#block(breakable: false)[

#heading(level: 3)[A09\. SMT 自动搜索量子周期区分器 #cite(<LiuWWLW2025Periodic>)] <paper-A09>

#strong[Quantum Periodic Distinguisher Construction: Symbolization Method and Automated Tool]#linebreak()
Qun Liu; Haoyang Wang; Jinliang Wang; Boyun Li; Meiqin Wang\. #strong[ASIACRYPT 2025]。

#list(
  [状态：IACR 元数据注明该会议论文的 major revision；2025-04-15 首发，2025-12-20 最新修订。],
  [来源：#link("https://eprint.iacr.org/2025/681")[ePrint 2025/681]。],
  [贡献：符号化表示与 SMT 搜索扩展到未知差分及概率周期，对 GFS、LBlock、TWINE、Skipjack-B、SKINNY 等报告新减轮区分器。],
  [模型/局限：核心 #strong[Q2]；“找到区分器”不自动得到低成本密钥恢复，仍需证明 oracle 可构造、满足周期条件并计算完整成本。],
  [阅读：A；后续：必须与 A15 的前缀实现性/密钥依赖条件并读。],
)

]

#block(breakable: false)[

#heading(level: 3)[A10\. AES/SHA3 的最小 T-depth 与最小宽度 #cite(<HuangZL2025Minimal>)] <paper-A10>

#strong[Constructing Quantum Implementations with the Minimal T-depth or Minimal Width and Their Applications]#linebreak()
Zhenyu Huang; Fuxin Zhang; Dongdai Lin\. #strong[EUROCRYPT 2025]。

#list(
  [状态：IACR 元数据注明该会议论文的 major revision；2025-02-12 首发，2025-03-04 修订。],
  [来源：#link("https://eprint.iacr.org/2025/212")[ePrint 2025/212]。],
  [贡献：通用向量布尔函数及有限域求逆的量子实现；给出 AES S-box 的 T-depth-3 电路和低宽度实现，包括单 S-box 9 量子位、成对 S-box 16 量子位、SHA3 chi 的 5 量子位例子。],
  [模型/局限：攻击 oracle 的本地电路组件，适用于 Q1 密钥搜索；#strong[不同“最小”指标对应不同电路方案]，不能说一条电路同时实现所有最优性。逻辑门集与 ancilla 限制需一致。],
  [阅读：A。],
)

]

#block(breakable: false)[

#heading(level: 3)[A11\. AES 的低 DW-cost 综合 #cite(<LiaoLuo2025DW>)] <paper-A11>

#strong[Quantum Circuit Synthesis for AES with Low DW-cost]#linebreak()
Haoyu Liao; Qingbin Luo\. #strong[ASIACRYPT 2025]。

#list(
  [状态：IACR 元数据注明该会议论文的 minor revision；2025-08-19 首发，2025-11-27 修订。],
  [来源：#link("https://eprint.iacr.org/2025/1494")[ePrint 2025/1494]。],
  [贡献：联合优化原位 S-box、密钥扩展和轮函数；摘要报告 AES-128/192/256 的 DW-cost 相对其基线降低至少 46%/45%/45%。],
  [模型/局限：适用于 #strong[Q1 本地 Grover oracle] 的成本评估；百分比是论文特定门集/基线下结果，并非密钥安全位数同比降低。修订版增加 Clifford+T 的加密和 Grover oracle 估计，应按同类指标比较。],
  [阅读：A。],
)

]

#block(breakable: false)[

#heading(level: 3)[A12\. Ascon 的量子资源评估 #cite(<OhJS2025Ascon>)] <paper-A12>

#strong[Quantum Security Evaluation of ASCON]#linebreak()
Yujin Oh; Kyungbae Jang; Hwajeong Seo\. #strong[ePrint 2025/260]，2025-02-18 收到/公开。

#list(
  [状态：ePrint 页面仅标 #strong[Preprint]；本次未核实正式录用，保留为近期跟踪项。],
  [来源：#link("https://eprint.iacr.org/2025/260")[ePrint]。],
  [贡献：量子电路与深度优化资源估计，覆盖 ASCON-AEAD、Hash 和 ASCON-80pq，讨论 Grover 密钥搜索及碰撞成本。],
  [模型/局限：本地量子计算与 Q1 密钥搜索有关；#strong[ASCON-80pq 是被分析的历史版本名称，不能与最终 Ascon 标准参数混写]。模式可证明安全、具体置换安全与逻辑电路估计是三个不同问题；本次未复核其碰撞基线。],
  [阅读：A。],
)

]

#block(breakable: false)[

#heading(level: 3)[A13\. 置换 PRF 的 Q1 时间/数据折中 #cite(<SunGXLLZ2025PRF>)] <paper-A13>

#strong[Quantum Key-Recovery Attacks on Permutation-Based Pseudorandom Functions]#linebreak()
Hong-Wei Sun; Fei Gao; Rong-Xue Xu; Dan-Dan Li; Zhen-Qiang Li; Ke-Jia Zhang\. #strong[ePrint 2025/501]，2025-03-17 首发，2025-03-20 修订。

#list(
  [状态：#strong[Preprint]，未核实正式录用。],
  [来源：#link("https://eprint.iacr.org/2025/501")[ePrint]。],
  [贡献：针对若干特定置换 PRF/相关 MAC 构造应用 Offline Simon，摘要给出约 $2^(n/3)$ 量子时间与经典查询、$O(n^2)$ 量子位的攻击型态。],
  [模型/局限：核心 #strong[Q1]，另改进若干 Q2 数据复杂度。摘要措辞很宽，本记录只认可其针对列举构造的主张；不得推广到所有置换 PRF，完整参数和适用条件需正文验证。],
  [阅读：A；优先级：低于同方向正式发表基础文献，适合跟踪。],
)

]

#block(breakable: false)[

#heading(level: 3)[A14\. 统一量子区分器的几何框架 #cite(<WuBao2026Geometric>)] <paper-A14>

#strong[A Geometric Approach to Quantum Distinguishers]#linebreak()
Zhili Wu; Zhenzhen Bao\. #strong[CRYPTO 2026]。

#list(
  [状态：IACR 元数据注明该会议论文的 major revision；2026-06-03 首发，2026-06-09 修订。本次尚未取得正式 DBLP BibTeX。],
  [来源：#link("https://eprint.iacr.org/2026/1158")[ePrint 2026/1158]。],
  [贡献：以相关矩阵和量子相关态统一 Simon/Bernstein-Vazirani/Deutsch-Jozsa 等结构区分与线性/差分概率估计；讨论信号在基态间稀释导致的低查询效率以及集中信号的方法。],
  [模型/局限：#strong[明确 Q2]；制备相关态的单次叠加查询不等于“一次查询即可恢复密钥”，测量成功率与后处理必须计入。],
  [阅读：A；价值：近期理论框架型成果，适合精读后寻找新实例。],
)

]

#block(breakable: false)[

#heading(level: 3)[A15\. 周期搜索的可实现性与密钥条件 #cite(<GuoYao2026Revisiting>)] <paper-A15>

#strong[Revisiting Automated Quantum Periodic Distinguisher Construction]#linebreak()
Jian Guo; Yiran Yao\. #strong[ePrint 2026/1528]，2026-07-25 收到，2026-07-30 公开。

#list(
  [状态：#strong[Preprint]，未核实正式录用。],
  [来源：#link("https://eprint.iacr.org/2026/1528")[ePrint]。],
  [贡献：在 A09 代数 SMT 模型上增加前缀可实现性与 DDT filtering；显式说明桶选择与目标周期的密钥相关条件，并给出部分 Grover-meet-Simon 密钥恢复候选。],
  [模型/局限：#strong[Q2/结构攻击候选]；条件依赖密钥，不能把工具输出的最大轮数自动解读为对任意密钥均成立；全文及代码尚待独立复核。],
  [阅读：A；价值：2026 年近两个月的新进展，尤其适合做验证与复现导向选题。],
)

]

#block(breakable: false)[

#heading(level: 3)[A16\. 最新 SMT 量子电路综合 #cite(<GuoZLWWZ2026SMT>)] <paper-A16>

#strong[Novel SMT Encoding for Quantum Circuit Optimization]#linebreak()
Youbo Guo; Fengrong Zhang; Lei Liao; Yongzhuang Wei; Baocang Wang; Xiaogang Zhou\. #strong[ePrint 2026/1815]，2026-08-27 收到，2026-08-28 公开。

#list(
  [状态：#strong[Preprint]，截至截止日仅约两周。],
  [来源：#link("https://eprint.iacr.org/2026/1815")[ePrint]。],
  [贡献：exact-G/at-most-G SMT 编码，覆盖 4/5-bit S-box 和小线性层；摘要声称无辅助位 NCT 门集下 Keccak S-box 有 13 门最优电路，并报告 ASCON 等适用性。],
  [模型/局限：属于 #strong[Q1 攻击 oracle 的可用本地组件]；最优性限定门集、无辅助位及目标函数。NCT 门数、Clifford+T 总深度与物理成本不能直接互换。],
  [阅读：A；价值：很新，适合监控和复现，当前不把其摘要最优性宣称当作本次已证明事实。],
)

]

#heading(level: 2)[值得展开的研究题目（本调研提出的建议）]

#enum(
  [#strong[带可验证证书的周期区分器自动搜索。] 以 A05 → A09 → A15 为线索，将符号解转为具体输入族/密钥条件、给出前缀构造证书与小参数穷举验证；再计算完整密钥恢复成本。清晰的研究问题是“工具发现的优势在多大比例密钥与什么查询接口下成立”，而不仅是多增加一轮。发表潜力依赖新理论、系统性缺陷修正或跨多种结构的改进，单次换密码实例较弱。],
  [#strong[减少相关态攻击中的 QRACM 假设。] A08 正文直接指出该问题仍开放。可研究受限/分层/流式量子数据访问、预计算折中或电路重算，并比较其相对 Grover 的净优势。挑战是数据制备可能消耗掉 Fourier 型理论加速；这一点必须成为主指标。],
  [#strong[完整攻击 oracle 的统一资源基准。] 将 A10/A11/A16 的 S-box/轮函数组件，放入同一可逆 AES/Ascon oracle，统一明密文对数、反计算、密钥扩展、门集、深度上限和成功率。产出可复现代码与 Pareto 曲线；进一步加入明确容错架构才可讨论物理运行时间。仅比较不同论文摘要中的最小量子位数，研究贡献不足。],
  [#strong[强 Q2 到受限接口的流密码安全分析。] 以 A06 为基线，逐项降低状态访问能力，判断加速剩余多少，是否可迁移至 Q1/受限 Q2。需要先精读该论文的 oracle 定义，不能预设其强模型攻击就是可迁移的。],
  [#strong[把几何区分器框架连接到密钥恢复与自动优化。] 从 A14 的信号集中条件出发，结合 A08 的可标记子密钥和 A07 的嵌套搜索，在明确成本模型下找一个新的、非人为拼凑实例。应同时比较经典最佳攻击、量子 Grover 基线以及已有量子攻击；“相对某个经典算法加速”不足以表明有密码分析优势。],
)

#heading(level: 2)[检索记录与局限]

IACR MCP 查询包括：#code-field("quantum symmetric")、#code-field("Grover AES")、#code-field("Simon quantum")、#code-field("quantum differential")、#code-field("quantum Ascon")、#code-field("offline Simon")、#code-field("quantum linear")。先用 2024-2026 显式区间，发现结果年份不一致后去掉 year\_max 并逐篇核验页面 History。原始结果可在本地 #code-field("evidence/​attacks-​mcp-​search.​json") 回查；该辅助日志不纳入 Git。

#strong[MCP 的年份筛选不可靠]：显式 2024-2026 检索中出现 2022/761；某些调用只返回至 2025，而不设 year\_max 才出现 2026。不能把返回 0 或前 20 条理解为某方向没有新论文。搜索结果还含量子公钥、QKD、作者名 Simon 等误匹配，已按摘要过滤。

#strong[DBLP BibTeX 获取受限]：五次 #code-field("search_​dblp_​papers(include_​bibtex=​true)") 调用均返回 Server disconnected。web 对 DBLP \.bib 端点也未能返回原始数据；本地网络测试 DNS 不可用。因此 #link(<bibliography>)[attacks\.bib] 是依据明确官方书目字段整理的可用 BibTeX，#strong[不是冒充 DBLP 原始导出的文件]。老论文的正式 venue 已用 DBLP 官方记录/索引及 IACR/出版社核验；近期正式文章若仅据 IACR 元数据认定则逐篇标明。省略未核实的 DOI、页码、卷号，避免猜填。

本专题是精选证据地图，不声称列全所有论文、所有密码实例或已完成系统综述。通用哈希碰撞、多碰撞/反弹、AEAD 安全证明等与其他专题交叉的方向应在总报告中合并，避免把同一论文的预印本和正式版本重复计数。

#heading(level: 1)[11\. 安全证明与对称构造：完整记录] <proof-catalog>

检索截点：2026-09-08（执行跨至 09-09）；本分册精选 17 篇，覆盖 qPRF/qPRP、Q1/Q2、EM/TEM/FX/Feistel、多钥、MAC/AEAD、sponge 与预计算。它是总调研的可复查材料，不声称穷尽每篇论文。

本轮以 apaper MCP 的 IACR 搜索发现论文，再开 ePrint 原始页面与 DBLP/出版社/作者机构库核元数据。MCP 的年份过滤存在漏查/越界，且其 DBLP 工具返回 JSON 错误、断连和 429；因此用标题与作者反查补漏。DBLP 的条目类型为 Informal 的 ePrint 记录#strong[不构成录用证据]。正式记录、ePrint 状态冲突时优先报告正式记录，并标出差异。

本分册属于文献筛选与摘要核读。多数条目未完成正文证明审计，逐篇注明深度；未将搜索摘要中“首次”“最优”无条件当成经过独立证明的结论。PDF/BibTeX 抓取遭遇 403、robots、反爬页面，具体错误保存在本地 #code-field("evidence/​proofs-​*") 辅助日志中，不纳入 Git。proofs\.bib 为按核验元数据重建的可引用记录，#strong[不是伪装的 DBLP 原始导出]；DTU 条目另有原始 BibTeX 文本来源。

#heading(level: 2)[研究地图与应先区分的模型]

#report-table((2.65fr, 5.2fr, 2.0fr), [安全证明的研究地图], ([方向], [2024-2026 的变化], [阅读入口],), (
  [Q1 原语与工作模式证明],
  [EM→TEM→低熵钥 keyed sponge、Ascon/KMAC；Feistel 3/4 轮正向界],
  [P03、P04、P09、P12],
  [多用户/多钥],
  [2026 已出现 TEM/FX 的 Q1MK 与 tweakable KAF 多钥证明],
  [P15、P16],
  [可逆随机置换证明工具],
  [从单轮特设证明走向双向 oracle、lifting、compressed permutation],
  [P05-P08、P13],
  [量子认证定义与组合],
  [plus-one 不足以保证某些组合；BU、SU、qPRF 之间需要更细区分],
  [P02、P11、P14],
  [预计算与资源约束],
  [普通 indifferentiability 无法自动处理 advice；研究走向量子时间空间折中],
  [P17],
))

Q1 通常允许攻击者量子计算，但对部署中的秘密钥接口只作经典查询；公开算法作为理想原语时依然可以被量子访问。Q2 额外允许对秘密钥接口进行叠加查询。qPRF、strong qPRP 是安全概念，QROM/量子理想置换/理想密码则是模型，不应混用。哈希原像抗性、碰撞抗性、indifferentiability、AE 保密性、MAC 不可伪造性分别对应不同目标，不能用统一“安全减半”覆盖。

#heading(level: 2)[精选论文卡片]

#block(breakable: false)[

#heading(level: 3)[P01 · How to Construct Quantum Random Functions #cite(<Zhandry2021QRF>)] <paper-P01>

#list(
  [作者：Mark Zhandry。],
  [年份与状态：正式发表；JACM 2021，早期版 FOCS 2012；DBLP 与 ACM 出版页交叉核验。],
  [入口：#link("https://eprint.iacr.org/2012/182")[ePrint 2012/182]；#link("https://dblp.org/rec/journals/jacm/Zhandry21")[DBLP]；#link("https://doi.org/10.1145/3450745")[DOI]；BibTeX 键：#code-field("Zhandry2021QRF")。],
  [主题与贡献：qPRF 定义与构造。区分量子计算但经典查询的 PRF 安全与允许叠加查询的 qPRF 安全；证明若干经典 PRF 构造在合适量子安全假设下仍安全，并给出两种模型的分离。],
  [模型/局限：不能把“抗量子、经典接口”直接当作 qPRF；这是通用构造理论，不是 AES 等具体实例的无条件安全证明。],
  [核读深度：摘要级；另核 ACM 正式出版元数据。],
)

]

#block(breakable: false)[

#heading(level: 3)[P02 · Quantum-Access-Secure Message Authentication via Blind-Unforgeability #cite(<AlagicMRS2020BU>)] <paper-P02>

#list(
  [作者：Gorjan Alagic；Christian Majenz；Alexander Russell；Fang Song。],
  [年份与状态：正式发表；EUROCRYPT 2020；DBLP 作者页、Springer 目录与 CWI 机构库核验。],
  [入口：#link("https://eprint.iacr.org/2018/1150")[ePrint 2018/1150]；#link("https://dblp.org/rec/conf/eurocrypt/AlagicMR020")[DBLP]；#link("https://doi.org/10.1007/978-3-030-45727-3_27")[DOI]；BibTeX 键：#code-field("Alagic​MRS2020BU")。],
  [主题与贡献：量子访问下 MAC 不可伪造定义。提出 blind unforgeability（BU），通过屏蔽随机消息子集刻画“未得到认证的消息”；qPRF 满足该定义，并分析 hash-and-MAC 与 Bernoulli-preserving 哈希。],
  [模型/局限：阅读旧版时尤其注意更正：不能沿用早期“BU 蕴含 plus-one”的说法。P14 的 2026 摘要明确称该关系仍未知；只能确认存在满足 plus-one 却违反 BU 的分离例。],
  [核读深度：摘要级；核正式稿第 4 节 BU 定义片段，未复核全证。],
)

]

#block(breakable: false)[

#heading(level: 3)[P03 · Post-Quantum Security of the Even-Mansour Cipher #cite(<AlagicBKM2022EM>)] <paper-P03>

#list(
  [作者：Gorjan Alagic；Chen Bai；Jonathan Katz；Christian Majenz。],
  [年份与状态：正式发表；EUROCRYPT 2022；DBLP 正式卷目录/作者记录与 ePrint 核验。],
  [入口：#link("https://eprint.iacr.org/2021/1601")[ePrint 2021/1601]；#link("https://dblp.org/rec/conf/eurocrypt/AlagicBKM22")[DBLP]；#link("https://doi.org/10.1007/978-3-031-07082-2_17")[DOI]；BibTeX 键：#code-field("Alagic​BKM2022EM")。],
  [主题与贡献：Q1 Even-Mansour 的查询下界。在秘密加密接口仅经典可查、公开置换量子可查的模型中证明 EM 安全。区分 $q_E$ 与 $q_P$，摘要给出必要量级 $q_E q_P^2 + q_P q_E^2 approx 2^n$，同时适用于单钥与双钥 EM。],
  [模型/局限：随机置换模型；不能将 Q2 中 Simon 攻击与 Q1 的上述界混用，也不宜把双参数界只压成一个“量子安全位数”。],
  [核读深度：摘要级；元数据级核验正式版。],
)

]

#block(breakable: false)[

#heading(level: 3)[P04 · Post-quantum Security of Tweakable Even-Mansour, and Applications #cite(<AlagicBKMS2024TEM>)] <paper-P04>

#list(
  [作者：Gorjan Alagic；Chen Bai；Jonathan Katz；Christian Majenz；Patrick Struck。],
  [年份与状态：正式发表；EUROCRYPT 2024；DBLP 与作者所属 DTU 机构库（含 BibTeX）核验。],
  [入口：#link("https://eprint.iacr.org/2022/1097")[ePrint 2022/1097]；#link("https://dblp.org/rec/conf/eurocrypt/AlagicBKMS24")[DBLP]；#link("https://doi.org/10.1007/978-3-031-58716-0_11")[DOI]；BibTeX 键：#code-field("Alagic​BKMS2024TEM")。],
  [主题与贡献：Q1 tweakable block cipher 与模式证明。将 EM 的 Q1 证明扩展到 tweakable EM，并用于 Chaskey、Elephant 和 Minalpher 的一个变体的模式级安全证明。],
  [模型/局限：依赖理想置换；Minalpher 的结论针对论文变体；ePrint 从 2022 首发到 2024 正式发表，不能把编号年份当作会议年份。FX 相关早期版本的证明变化见 P15。],
  [核读深度：摘要级。],
)

]

#block(breakable: false)[

#heading(level: 3)[P05 · Quantum One-Wayness of the Single-Round Sponge with Invertible Permutations #cite(<CarolanP2024Sponge>)] <paper-P05>

#list(
  [作者：Joseph Carolan；Alexander Poremba。],
  [年份与状态：正式发表；CRYPTO 2024；ePrint、Springer 正式目录及作者主页核验；DBLP 可见同题预印本与作者记录。],
  [入口：#link("https://eprint.iacr.org/2024/414")[ePrint 2024/414]；#link("https://dblp.org/pid/370/6990.html")[DBLP]；#link("https://doi.org/10.1007/978-3-031-68391-6_7")[DOI]；BibTeX 键：#code-field("Carolan​P2024Sponge")。],
  [主题与贡献：可逆置换模型的单轮 sponge 单向性。通过对称化方法证明双边零搜索问题的量子查询下界，进而证明使用可逆随机置换的单轮 sponge 的量子单向性。],
  [模型/局限：单轮结果；不能独立推成任意长度 SHA-3 的量子不可区分性或完整实际实现安全。],
  [核读深度：摘要级。],
)

]

#block(breakable: false)[

#heading(level: 3)[P06 · Permutation Superposition Oracles for Quantum Query Lower Bounds #cite(<MajenzMW2025PSO>)] <paper-P06>

#list(
  [作者：Christian Majenz；Giulio Malavolta；Michael Walter。],
  [年份与状态：正式发表；STOC 2025；DBLP 正式记录核验，ePrint 仍标 Preprint。],
  [入口：#link("https://eprint.iacr.org/2024/1140")[ePrint 2024/1140]；#link("https://dblp.org/rec/conf/stoc/MajenzMW25")[DBLP]；BibTeX 键：#code-field("Majenz​MW2025PSO")。],
  [主题与贡献：随机置换双向量子 oracle 证明工具。为同时访问置换与逆置换的量子算法建立 oracle 模拟，借助 strictly monotone factorization 对输入输出谓词成功率做界定；应用于单轮 sponge 原像抗性。],
  [模型/局限：这是理想化查询复杂度工具；具体函数、轮数、目标性质仍需单独归约，不能直接据此认定所有置换模式安全。],
  [核读深度：摘要级。],
)

]

#block(breakable: false)[

#heading(level: 3)[P07 · Quantum Lifting for Invertible Permutations and Ideal Ciphers #cite(<CojocaruHLYY2025Lifting>)] <paper-P07>

#list(
  [作者：Alexandru Cojocaru；Minki Hhan；Qipeng Liu；Takashi Yamakawa；Aaram Yun。],
  [年份与状态：正式发表；CRYPTO 2025；DBLP 正式卷目录核验，ePrint 仍标 Preprint。],
  [入口：#link("https://eprint.iacr.org/2025/738")[ePrint 2025/738]；#link("https://dblp.org/rec/conf/crypto/CojocaruHLYY25")[DBLP]；BibTeX 键：#code-field("Cojocaru​HLYY2025Lifting")。],
  [主题与贡献：将经典界提升到量子置换/理想密码模型。建立量子随机置换与理想密码模型的 lifting 定理，将量子成功概率联系到少量经典查询的算法；应用包括常数轮 sponge 的原像、单向、多碰撞抗性与 Davies-Meyer 碰撞抗性。],
  [模型/局限：并非任意经典安全证明自动量子化；需检查定理条件、查询损失和常数轮限制。],
  [核读深度：摘要级。],
)

]

#block(breakable: false)[

#heading(level: 3)[P08 · The Sponge Is Quantum Indifferentiable #cite(<AlagicCMT2025Sponge>)] <paper-P08>

#list(
  [作者：Gorjan Alagic；Joseph Carolan；Christian Majenz；Saliha Tokat。],
  [年份与状态：正式发表；FOCS 2025；DBLP 正式卷目录与作者记录核验，ePrint 仍标 Preprint。],
  [入口：#link("https://eprint.iacr.org/2025/731")[ePrint 2025/731]；#link("https://dblp.org/rec/conf/focs/AlagicCMT25")[DBLP]；BibTeX 键：#code-field("Alagic​CMT2025Sponge")。],
  [主题与贡献：sponge 的量子 indifferentiability。证明基于公开随机可逆置换的 sponge 对量子攻击者可与随机预言机组合替换，为 SHA-3 的域扩展结构提供量子理论基础；另给出更紧的原像与碰撞界。],
  [模型/局限：摘要自称总 indifferentiability 界较松，为 $O("poly"(q) dot 2^(-min(r,c)/4))$；这不是实际 Keccak 置换无条件安全证明，参数化与收紧仍有研究空间。],
  [核读深度：摘要级。],
)

]

#block(breakable: false)[

#heading(level: 3)[P09 · Post-Quantum Security of Keyed Sponge-Based Constructions Through a Modular Approach #cite(<Hosoyamada2025KeyedSponge>)] <paper-P09>

#list(
  [作者：Akinori Hosoyamada。],
  [年份与状态：正式发表；ASIACRYPT 2025；DBLP 正式目录与 ePrint 核验；ePrint 为 major revision。],
  [入口：#link("https://eprint.iacr.org/2025/1059")[ePrint 2025/1059]；#link("https://dblp.org/rec/conf/asiacrypt/Hosoyamada25")[DBLP]；BibTeX 键：#code-field("Hosoyamada2025Keyed​Sponge")。],
  [主题与贡献：Ascon/KMAC 的模块化 Q1 证明。在量子理想置换模型中，将 Ascon 模式化为低熵钥 TEM 的迭代，将 keyed sponge 化为低熵钥 EM；修改 resampling lemma，覆盖 Ascon、KMAC、inner/outer/full-keyed sponge。Ascon 还涵盖 nonce 误用保密和释放未验证明文时的真实性。],
  [模型/局限：单用户 Ascon 保证约至 $min(2^(c/3),2^(kappa/3))$ 查询；消除了 P10 的部分限制但 key 指数更弱。KMAC 界同时依赖 capacity、rate、有效 key 参数，摘要式不能直接代入标准 KMAC 的比特长度宣称安全等级。],
  [核读深度：摘要级；PDF 请求被拒，尚未正文复核 κ 编码含义。],
)

]

#block(breakable: false)[

#heading(level: 3)[P10 · Security of the Ascon Authenticated Encryption Mode in the Presence of Quantum Adversaries #cite(<LangLMT2025Ascon>)] <paper-P10>

#list(
  [作者：Nathalie Lang；Stefan Lucks；Bart Mennink；Suprita Talnikar。],
  [年份与状态：保留近期预印本；截至检索仅核到 ePrint/DBLP Informal 记录，未核到正式录用。],
  [入口：#link("https://eprint.iacr.org/2025/411")[ePrint 2025/411]；#link("https://dblp.org/rec/journals/iacr/LangLMT25")[DBLP]；BibTeX 键：#code-field("Lang​LMT2025Ascon")。],
  [主题与贡献：Ascon Q1 直接证明与参数限制。利用 semi-classical O2H lemma 和专门的 puncture set 分析 Ascon AE 模式，给出约 $min(2^(c/3),2^(k/2))$ 的安全量级，讨论 Grover key search 与状态恢复。],
  [模型/局限：block-wise adaptive，但只允许一次伪造尝试；P09 指出其还有 nonce 集合限制。不能与 P09 的更广模型只比较指数后宣布谁完全优于谁。],
  [核读深度：摘要级。],
)

]

#block(breakable: false)[

#heading(level: 3)[P11 · Generic Composition: From Classical to Quantum Security #cite(<LangLL2025Composition>)] <paper-P11>

#list(
  [作者：Nathalie Lang；Jannis Leuther；Stefan Lucks。],
  [年份与状态：保留近期预印本；ePrint 标 Preprint，2025-11-07 major revision；未核到正式录用。],
  [入口：#link("https://eprint.iacr.org/2025/387")[ePrint 2025/387]；#link("https://dblp.org/rec/journals/iacr/LangLL25")[DBLP]；BibTeX 键：#code-field("Lang​LL2025Composition")。],
  [主题与贡献：Q2 authenticated encryption 通用组合。给出反例：IND-qCPA 加密加 plus-one 不可伪造 MAC 的 Encrypt-then-MAC 组合不一定 IND-qCCA 安全；更强的 qPRF MAC 可支撑组合定理，并讨论 nonce 与关联数据版本。],
  [模型/局限：查询和回答可以叠加的强访问模型；不能将此结论机械解释为常规经典网络接口 Encrypt-then-MAC 已被实际攻破。],
  [核读深度：摘要级；须以 2025-11-07 后版本为准。],
)

]

#block(breakable: false)[

#heading(level: 3)[P12 · Post-quantum Security of Key-Alternating Feistel Ciphers #cite(<BasakEtAl2025KAF>)] <paper-P12>

#list(
  [作者：Jyotirmoy Basak；Ritam Bhaumik；Amit Kumar Chauhan；Ravindra Jejurikar；Ashwin Jha；Anandarup Roy；André Schrottenloher；Suprita Talnikar。],
  [年份与状态：正式发表；ASIACRYPT 2025；DBLP 正式目录核验；ePrint major revision。],
  [入口：#link("https://eprint.iacr.org/2025/1603")[ePrint 2025/1603]；#link("https://dblp.org/rec/conf/asiacrypt/BasakBCJJRST25")[DBLP]；BibTeX 键：#code-field("Basak​Et​Al2025KAF")。],
  [主题与贡献：Q1 Feistel 最小轮数的正向安全证明。在公开随机函数/置换可量子访问时，证明 3 轮 KAF 为 PRP、4 轮为 strong PRP；3 轮结果甚至允许各轮使用同一随机预言机。],
  [模型/局限：Q1 而非 Q2；独立轮密钥、复用 primitive 的条件和精确界需阅读正文。具体 Feistel 密码并不因此自动满足该理想模型。],
  [核读深度：摘要级。],
)

]

#block(breakable: false)[

#heading(level: 3)[P13 · Compressed Permutation Oracles #cite(<Carolan2026CPO>)] <paper-P13>

#list(
  [作者：Joseph Carolan。],
  [年份与状态：正式发表；STOC 2026；DBLP 正式卷目录与作者主页交叉核验；ePrint 标 Preprint 过时。],
  [入口：#link("https://eprint.iacr.org/2025/1734")[ePrint 2025/1734]；#link("https://dblp.org/rec/conf/stoc/Carolan26")[DBLP]；BibTeX 键：#code-field("Carolan2026CPO")。],
  [主题与贡献：通用 compressed permutation oracle 与 strong qPRP。建立接近压缩随机函数 oracle 的随机置换表示工具；证明 7 轮 Feistel 为 strong quantum PRP；重证 sponge、Davies-Meyer 等原像/碰撞下界，并给出 cycle finding、one-more 等新下界。],
  [模型/局限：7 轮 strong qPRP 是重要边界，不等于 7 轮必为最优轮数；应区分理想随机轮函数与从计算假设实例化。后续选题须对照该新工具，避免重复证明已解决命题。],
  [核读深度：摘要级；正式出版状态核验。],
)

]

#block(breakable: false)[

#heading(level: 3)[P14 · Defining Quantum-Secure Message Authentication #cite(<JhaKLL2026SU>)] <paper-P14>

#list(
  [作者：Ashwin Jha；Mustafa Khairallah；Jannis Leuther；Stefan Lucks。],
  [年份与状态：保留最新预印本；2026-02-16 received，2026-05-22 最近修订；未核到正式录用。],
  [入口：#link("https://eprint.iacr.org/2026/271")[ePrint 2026/271]；#link("https://dblp.org/rec/journals/iacr/JhaKLL26")[DBLP]；BibTeX 键：#code-field("Jha​KLL2026SU")。],
  [主题与贡献：MAC 安全定义更新：splitting unforgeability。提出 SU，同时捕获不能产生超过查询数认证结果的 stability 和对未访问区域的 exclusiveness；SU 在经典情形等价 EUF-CMA，在量子情形蕴含 plus-one 与 BU；给出 qPRF、有限独立函数及 quantum Carter-Wegman MAC 的充分条件。],
  [模型/局限：定义之间关系必须按最新稿审慎处理；满足 SU 的通用充分条件不等于常用具体 MAC 已获得 SU 证明。原文还讨论 collapsing/Bernoulli-preserving 哈希组合。],
  [核读深度：摘要级；PDF 请求被拒，未复核定义全文。],
)

]

#block(breakable: false)[

#heading(level: 3)[P15 · Multi-Key Security in the Quantum World: Revisiting Tweakable Even-Mansour and FX #cite(<ShibaI2026Q1MK>)] <paper-P15>

#list(
  [作者：Rentaro Shiba；Tetsu Iwata。],
  [年份与状态：正式发表；ToSC 2026(2)，官方出版页检索结果显示 2026-06-11；ePrint 2026-02-24 received、06-16 revised。],
  [入口：#link("https://eprint.iacr.org/2026/382")[ePrint 2026/382]；#link("https://dblp.org/rec/journals/iacr/ShibaI26")[DBLP]；#link("https://doi.org/10.46586/tosc.abksudsuurh6")[DOI]；BibTeX 键：#code-field("Shiba​I2026Q1MK")。],
  [主题与贡献：Q1MK 多钥 TEM 与 FX。将经典在线/量子离线 Q1 与 multi-key 结合。摘要证明 TEM 需 $Omega(2^(kappa/3))$ 总量级查询且不依赖目标 key 数；收紧 FX 单用户证明，并得到 $2^u$ 个独立 key 时 $Omega(2^((kappa+n-u)/3))$ 的查询下界。],
  [模型/局限：这些是特定模型与构造的必要查询量级，不是所有多用户系统的通用劣化规则；P04 ePrint 某个早期 FX 版本被重新审视，引用应精确到版本。],
  [核读深度：摘要级；ePrint History 和 ToSC 出版元数据级核验。],
)

]

#block(breakable: false)[

#heading(level: 3)[P16 · Post-Quantum Security of Tweakable Key-Alternating Feistel Ciphers in the Multi-Key Setting #cite(<ShibaI2026TKAF>)] <paper-P16>

#list(
  [作者：Rentaro Shiba；Tetsu Iwata。],
  [年份与状态：近三个月论文；2026-06-23 received，07-08 revised；ePrint 标 Published elsewhere, Minor revision, SCN 2026；本轮尚未核到正式卷页，录用/发表按作者声明记录。],
  [入口：#link("https://eprint.iacr.org/2026/1312")[ePrint 2026/1312]；#link("https://dblp.org/rec/journals/iacr/ShibaI26a")[DBLP]；BibTeX 键：#code-field("Shiba​I2026TKAF")。],
  [主题与贡献：tweakable Feistel 的 Q1 多钥证明。由 P12 扩展到用 ε-AXU hash 注入 tweak 的 TKAF 和多个经典 oracle；证明 3 轮 TPRP、4 轮 strong TPRP。摘要明确包含用户数 ℓ、半块参数 n 与 ε 导致的安全界。],
  [模型/局限：不能再把“多用户 tweakable Feistel 的 Q1 安全”整体当空白；有意义问题应转向用户数损失紧致性、hash 假设、轮密钥相关性或具体应用。摘要中 $Omega(2^(n/3)/ell^(2/3))$ 与 $Omega(epsilon^(-1/2))$ 的两个条件须按正文完整陈述，不能随意合并为一个统一指数。],
  [核读深度：摘要级；PDF 请求未成功。],
)

]

#block(breakable: false)[

#heading(level: 3)[P17 · (Quantum) Indifferentiability and Pre-Computation #cite(<CarolanPZ2024Precomp>)] <paper-P17>

#list(
  [作者：Joseph Carolan；Alexander Poremba；Mark Zhandry。],
  [年份与状态：ePrint 2024；作者 Poremba 机构主页称已发表于 IACR Communications in Cryptology 3(2), 2026；DOI 10\.62056/ak-4c3tw9。出版页面本轮不可达，正式期刊卷目待再核，Bib 保守保留预印本。],
  [入口：#link("https://eprint.iacr.org/2024/1727")[ePrint 2024/1727]；#link("https://dblp.org/rec/journals/iacr/CarolanPZ24")[DBLP]；BibTeX 键：#code-field("Carolan​PZ2024Precomp")。],
  [主题与贡献：预计算/advice、量子时间空间折中。证明普通 indifferentiability 不足以捕获带经典或量子 advice 的预计算攻击；提出包含预计算的加强定义与组合框架，对单轮 sponge inversion 给出紧的时间空间折中。],
  [模型/局限：单轮应用，需注意 rate≤capacity 等适用条件；从该结果推广多轮/变长 sponge、实际工作因子时要另证，不能直接移植 Grover 或随机预言机界。],
  [核读深度：摘要级；作者机构主页核发表声明；未复核全证。],
)

]

#heading(level: 2)[有依据的选题建议]

以下是从已检索文献推导的候选问题，不是“已验证无人做过”的新颖性声明。正式立项还需读相邻论文全文、最近版本与引用链。

#enum(
  [#strong[Ascon/keyed sponge 的多用户 Q1 且多次伪造界]：以 P09 的低熵钥模块化框架和 P15 的 Q1MK 工具为基础，追踪用户数、总数据量、单用户数据量、量子 primitive 查询、nonce 误用及 RUP 的不同损失；先检查 P09 是否已支持所需接口。比简单提出“量子 Ascon 安全”更明确。关键障碍是多用户混合、重复内部状态与解密/失败信息的联合处理，潜在价值是更可用的安全预算。],
  [#strong[多钥 TKAF 的紧界与密钥调度限制]：P16 已覆盖独立 key、多用户、tweak；有意义的是其 ℓ 损失是否可匹配、相关轮密钥/单钥展开能否证明，或找出不能推广的反例。先抽取 P16 定理精确参数，再用 P12 作为无 tweak 基线。],
  [#strong[把置换工具用于更紧的 sponge 组合界]：P08 的 indifferentiability 界自认松，P13 出现更通用工具。可比较直接攻防界与可组合界的差距，明确目标为变长、多输出或一个具体 duplex/keyed 模式；不能再把“首次证明 sponge 量子 indifferentiability”当选题。],
  [#strong[SU 与通用 AE 组合所需最弱 MAC 假设]：P11 给出 plus-one 不足的反例，P14 给出 SU。值得检查 SU、BU 或额外结构是否足以获得目标 IND-qCCA / AEAD 定理，或者给出分离。不能未经证明推断 SU 可替代 P11 的 qPRF。],
  [#strong[预计算下多轮 sponge 的可组合时间空间界]：P17 的强模型和单轮紧界提供入口；对多轮/变长消息、经典 advice 与量子 advice 分别分析，并明确 preprocessing 成本是否计入。难度较高，适合有量子查询下界背景的团队。],
)

优先阅读顺序：应用/模式方向 P03→P04→P09→P15→P16；证明工具方向 P05→P06/P07→P08→P13→P17；认证定义方向 P01→P02→P11→P14。

#heading(level: 2)[核验风险与未纳入项]

#list(
  [ePrint 2021/192《Quantum Indifferentiability of SHA-3》在检索中出现，但本轮不纳入可靠结论链。2025 论文明确把相关证明障碍作为新突破；应先核旧稿更正、撤回/缺陷记录，不可将两个“首次”简单并列。],
  [“A Note on Quantum-Secure PRPs” 检索显示已有 Quantum 2025 正式版本（DOI 10\.22331/q-2025-04-08-1696），是 P01 与 P13 间值得补读的计算假设构造背景。本轮没有完整核作者/正文，因此不列为已完成卡片。],
  [不把量子消息加密、pseudorandom quantum states、量子认证 quantum messages、量子货币等相邻方向算成“经典对称加密抗量子攻击”。格基 OPRF、对称原语支撑 PQ 签名属于外延应用，应另分层。],
  [本轮正式旧文保留 JACM / EUROCRYPT 等有明确元数据的版本；没有因 DBLP 存在 ePrint 记录而推定经过同行评审。P16、P17 的正式卷目证据尚弱于其余正式条目，已单独标注。],
)

#pagebreak(weak: true)

#heading(level: 1)[12\. 应用扩展与邻接方向：完整记录] <application-catalog>

文献截止日期：2026-09-08。实际检索跨越台湾时间 2026-09-08 至 09-09 午夜。本文是总调研的专题分报告，保留 14 篇核心文献；最新文章尚未录用时仍保留并明确标注。本轮以 IACR ePrint / apaper MCP 为发现入口，以 DBLP、ePrint 官方页和出版社页面核验。#strong[阅读主要为摘要级，不代表已逐一定理审计或复现实验。]

#heading(level: 2)[范围与重点]

这里区分两类问题。DiSE、门限密钥管理和 SSE 是对称加密功能的扩展；FAEST、Picnic、Lynx、AIMer、Rainier、SPHINCS+ 是由对称原语支撑的后量子公钥签名或证明系统，属于邻接方向。后者值得纳入方向地图，但不能计作“新的对称加密模式”。同时，SSE/DiSE 的后量子实例可能依赖格、同源等非对称数学假设，不能仅因名字含 symmetric 就说全协议只有对称假设。

从本次证据看，活跃问题可以归纳为四条。

#enum(
  [#strong[分布式认证加密与密钥托管。] 从 CCS 2018 的 DiSE 框架，经 ACNS 2024 的半诚实量子安全 DPRF，进展到 2026 年的 QROM 自适应 DiSE；重点是门限安全、腐化模型及在线成本，见 E01-E03。],
  [#strong[PQC 可搜索加密。] 兼顾合取查询、动态更新、前向/后向隐私、结果可验证性与具体效率，见 E04-E05。标题中的 efficient 与 post-quantum 可能对应不同实例，必须逐一核对。],
  [#strong[面向证明系统的对称原语。] 一条路复用 AES 并优化树、承诺和 QROM 证明，另一条路为 VOLEitH/AO 场景设计低乘法复杂度原语。近期攻击提示低次数结构可能抵消性能收益，见 E06-E11。],
  [#strong[哈希签名的组合优化与状态管理。] 成熟基础之上仍有编码下界、大小/验证时间折衷、多 HSM 状态一致性问题，见 E12-E14。],
)

这些是检索中得到的代表性热点，不能据此声称穷尽公开研究。具体选题还需要对最接近的工作做正文阅读和更新检索。

#heading(level: 2)[文献索引]

#report-table((0.65fr, 4.4fr, 1.25fr, 3.6fr), [应用扩展文献索引], ([编号], [标题], [正式年份或预印本年份], [发表状态与证据],), (
  [#link(<paper-E01>)[E01]],
  [DiSE: Distributed Symmetric-key Encryption],
  [2018],
  [已发表 ACM CCS 2018；DBLP + ePrint],
  [#link(<paper-E02>)[E02]],
  [Efficient Quantum-Safe Distributed PRF and Applications: Playing DiSE in a Quantum World],
  [2024；ePrint 2025],
  [已发表 ACNS 2024；DBLP + ePrint],
  [#link(<paper-E03>)[E03]],
  [EQuADiSE: Efficient Quantum-safe Adaptive Distributed Symmetric-key Encryption],
  [2026],
  [ePrint 明示 ESORICS 2026 将发表；已录用信息来自作者，待独立出版核验],
  [#link(<paper-E04>)[E04]],
  [Efficient and Post-Quantum Conjunctive Dynamic SSE with Strong Privacy Guarantees],
  [2026],
  [已发表 PKC 2026, Part IV: 302-334；DBLP + ePrint],
  [#link(<paper-E05>)[E05]],
  [Ring-LWR based Commitments and ZK-PoKs with Application to Verifiable Quantum-Safe Searchable Symmetric Encryption],
  [2025],
  [ePrint 自报 ACM ASIACCS 2025；本轮仅找到 DBLP ePrint 记录，会议记录待补],
  [#link(<paper-E06>)[E06]],
  [Publicly Verifiable Zero-Knowledge and Post-Quantum Signatures from VOLE-in-the-Head],
  [2023],
  [已发表 CRYPTO 2023；DBLP + ePrint（DBLP key 尾部22不是出版年份）],
  [#link(<paper-E07>)[E07]],
  [One Tree to Rule Them All: Optimizing GGM Trees and OWFs for Post-Quantum Signatures],
  [2024],
  [已发表 ASIACRYPT 2024；DBLP + ePrint],
  [#link(<paper-E08>)[E08]],
  [Shorter, Tighter, FAESTer: Optimizations and Improved (QROM) Analysis for VOLE-in-the-Head Signatures],
  [2025；ePrint 2026],
  [已发表 CRYPTO 2025；Springer 正式页 + ePrint；DBLP 搜索本轮仅定位 ePrint 记录],
  [#link(<paper-E09>)[E09]],
  [Lynx: Symmetric Primitive for Shorter and Faster VOLE-in-the-Head Signatures],
  [2026],
  [近期预印本；2026-05-29 首发，2026-05-31 修订],
  [#link(<paper-E10>)[E10]],
  [Magic Pot: Cryptanalysis of Full AIM2 in the Standard and Related-/reused-Key Settings Using New Elimination Framework],
  [2026],
  [已发表 EUROCRYPT 2026；DBLP + ePrint（重大修订）],
  [#link(<paper-E11>)[E11]],
  [One More Pair, More Information Gained: Improved Attacks on LowMC with Full S-box Layers Using Two Plaintext/Ciphertext Pairs],
  [2025],
  [预印本；本轮未确认正式录用],
  [#link(<paper-E12>)[E12]],
  [The SPHINCS+ Signature Framework],
  [2019],
  [已发表 ACM CCS 2019；DBLP + ePrint],
  [#link(<paper-E13>)[E13]],
  [At the Top of the Hypercube -- Better Size-Time Tradeoffs for Hash-Based Signatures],
  [2025],
  [已发表 CRYPTO 2025；DBLP + ePrint],
  [#link(<paper-E14>)[E14]],
  [Secure Distributed State Management for Stateful Signatures with a Practical and Universally Composable Protocol],
  [2025],
  [近期预印本；2025-12-18 首发，本轮未确认正式录用],
))

#block(breakable: false)[

#heading(level: 2)[E01 · DiSE: Distributed Symmetric-key Encryption #cite(<Agrawal2018DiSE>)] <paper-E01>

#strong[作者：] Shashank Agrawal；Payman Mohassel；Pratyay Mukherjee；Peter Rindal。#linebreak()
#strong[年份 / 发表状态：] 2018；已发表 ACM CCS 2018；DBLP + ePrint。#linebreak()
#strong[阅读深度：] 摘要级。#linebreak()
#strong[BibTeX key：] #code-field("Agrawal2018Di​SE")。#linebreak()
#strong[来源：] #link("https://eprint.iacr.org/2018/727")[IACR ePrint 2018/727]；#link("https://dblp.org/rec/conf/ccs/AgrawalMMR18")[DBLP 记录]；#link("https://doi.org/10.1145/3243734.3243774")[正式 DOI]。

把长期主密钥分散到多方，以分布式 PRF 构造门限认证加密，形式化恶意攻击下的正确性、隐私与真实性。它是 DiSE 主线的经典起点，也是存储加密和企业密钥托管问题的共同接口。

#strong[模型与局限：] 这是通用框架而非统一的后量子证明；不同 DPRF 实例的假设、安全性和扩展性不同。不能因某一实例只用 AES，就把整篇全部实现称为抗量子。

#strong[研究启发（调研判断）：] 值得延伸到自适应腐化、密钥刷新、门限变化与跨地域延迟下的端到端安全。

]

#block(breakable: false)[

#heading(level: 2)[E02 · Efficient Quantum-Safe Distributed PRF and Applications: Playing DiSE in a Quantum World #cite(<Sinha2024PQDiSE>)] <paper-E02>

#strong[作者：] Sayani Sinha；Sikhar Patranabis；Debdeep Mukhopadhyay。#linebreak()
#strong[年份 / 发表状态：] 2024；已发表 ACNS 2024；DBLP + ePrint。#linebreak()
#strong[阅读深度：] 摘要级。#linebreak()
#strong[BibTeX key：] #code-field("Sinha2024PQDi​SE")。#linebreak()
#strong[来源：] #link("https://eprint.iacr.org/2025/152")[IACR ePrint 2025/152]；#link("https://dblp.org/rec/conf/acns/SinhaPM24")[DBLP 记录]；#link("https://doi.org/10.1007/978-3-031-54773-7_3")[正式 DOI]。

基于 LWR 的分布式 PRF 支持任意门限，以内积和舍入作为主要计算，并给出 PQ-DiSE 原型。主要技术问题是多项式模数比下的正确性与量子安全分析。

#strong[模型与局限：] 摘要中的安全结果针对门限以下半诚实腐化，不能扩张为任意恶意、自适应攻击。ePrint 是 2025-01-31 上传的重大修订，正式论文属 ACNS 2024，不应按编号统计为 2025 首发。

#strong[研究启发（调研判断）：] 比较静态/自适应腐化、半诚实/恶意模型下的成本，是比单测 AES 吞吐量更有意义的选题。

]

#block(breakable: false)[

#heading(level: 2)[E03 · EQuADiSE: Efficient Quantum-safe Adaptive Distributed Symmetric-key Encryption #cite(<Sinha2026EQuADiSE>)] <paper-E03>

#strong[作者：] Sayani Sinha；Sikhar Patranabis；Debdeep Mukhopadhyay。#linebreak()
#strong[年份 / 发表状态：] 2026；ePrint 明示 ESORICS 2026 将发表；已录用信息来自作者，待独立出版核验。#linebreak()
#strong[阅读深度：] 摘要级。#linebreak()
#strong[BibTeX key：] #code-field("Sinha2026EQu​ADi​SE")。#linebreak()
#strong[来源：] #link("https://eprint.iacr.org/2026/799")[IACR ePrint 2026/799]。

给出 MLWR 分布式 PRF 和 DiSE，作者证明其在 QROM 下具有自适应安全性，加解密在线开销随参与方数线性增长。论文将过去依赖离散对数群或指数开销的自适应方案作为比较对象。

#strong[模型与局限：] 量子安全依赖 MLWR 假设和 QROM；不是无条件结论。摘要不足以确认任意网络故障、主动密钥刷新或移动攻击者是否在模型中。首次上传 2026-04-23，修订 2026-06-17。

#strong[研究启发（调研判断）：] 当前很值得跟进的真正对称加密扩展方向：自适应门限安全与可部署密钥管理。

]

#block(breakable: false)[

#heading(level: 2)[E04 · Efficient and Post-Quantum Conjunctive Dynamic SSE with Strong Privacy Guarantees #cite(<Das2026ConjunctiveDSSE>)] <paper-E04>

#strong[作者：] Bibhas Chandra Das；Nilanjan Datta；Avijit Dutta；Avishek Majumder；Debdeep Mukhopadhyay；Sikhar Patranabis；Subhabrata Samajder；Laltu Sardar。#linebreak()
#strong[年份 / 发表状态：] 2026；已发表 PKC 2026, Part IV: 302-334；DBLP + ePrint。#linebreak()
#strong[阅读深度：] 摘要级。#linebreak()
#strong[BibTeX key：] #code-field("Das2026Conjunctive​DSSE")。#linebreak()
#strong[来源：] #link("https://eprint.iacr.org/2026/742")[IACR ePrint 2026/742]；#link("https://dblp.org/rec/conf/pkc/DasDDMMPSS26")[DBLP 记录]。

形式化合取查询的后向隐私，提出 fp-GA-ODXT 框架，兼顾前向/后向隐私、客户端计算和通信。给出经典实例与基于格和超奇异椭圆曲线同源的后量子实例。

#strong[模型与局限：] 必须区分两个实例：论文摘要明确，具体实现与实测加速属于离散对数群/RSA 的经典实例；后量子实例的结果是渐近高效。不能把经典性能图直接作为 PQ-SSE 实测性能。首次上传 2026-04-15。

#strong[研究启发（调研判断）：] PQC 合取 DSSE 的具体参数、真实数据库实验和泄漏攻击验证，构成清晰的应用研究切口。

]

#block(breakable: false)[

#heading(level: 2)[E05 · Ring-LWR based Commitments and ZK-PoKs with Application to Verifiable Quantum-Safe Searchable Symmetric Encryption #cite(<Talapatra2025VerifiableSSE>)] <paper-E05>

#strong[作者：] Debadrita Talapatra；Nimish Mishra；Debdeep Mukhopadhyay。#linebreak()
#strong[年份 / 发表状态：] 2025；ePrint 自报 ACM ASIACCS 2025；本轮仅找到 DBLP ePrint 记录，会议记录待补。#linebreak()
#strong[阅读深度：] 摘要级。#linebreak()
#strong[BibTeX key：] #code-field("Talapatra2025Verifiable​SSE")。#linebreak()
#strong[来源：] #link("https://eprint.iacr.org/2025/1216")[IACR ePrint 2025/1216]；#link("https://dblp.org/rec/journals/iacr/TalapatraMM25")[DBLP 记录]。

从 RLWR 承诺和多项式线性关系的知识证明出发，为既有 LWR-SSE 加入搜索结果正确性验证。作者报告短证明和较小额外验证成本。

#strong[模型与局限：] 这是依赖格假设的可验证 SSE，不是仅用块密码的对称原语设计。其证明关系、安全模型、实验平台及结果完整性覆盖范围仍须正文复核；摘要中的具体开销不宜外推至其他数据集。首次上传 2025-06-30，修订 2025-08-29。

#strong[研究启发（调研判断）：] 联合考虑查询泄漏、结果完整性、证明成本和动态更新，比仅证明数据库内容加密更有研究价值。

]

#block(breakable: false)[

#heading(level: 2)[E06 · Publicly Verifiable Zero-Knowledge and Post-Quantum Signatures from VOLE-in-the-Head #cite(<Baum2023VOLE>)] <paper-E06>

#strong[作者：] Carsten Baum；Lennart Braun；Cyprien Delpech de Saint Guilhem；Michael Klooß；Emmanuela Orsini；Lawrence Roy；Peter Scholl。#linebreak()
#strong[年份 / 发表状态：] 2023；已发表 CRYPTO 2023；DBLP + ePrint（DBLP key 尾部22不是出版年份）。#linebreak()
#strong[阅读深度：] 摘要级。#linebreak()
#strong[BibTeX key：] #code-field("Baum2023VOLE")。#linebreak()
#strong[来源：] #link("https://eprint.iacr.org/2023/996")[IACR ePrint 2023/996]；#link("https://dblp.org/rec/conf/crypto/BaumBGKORS22")[DBLP 记录]；#link("https://doi.org/10.1007/978-3-031-38554-4_19")[正式 DOI]。

以 VOLE-in-the-Head 将指定验证者 ZK 转为公开可验证协议，并实例化基于 AES 的 FAEST 签名。它解释为何 AES/PRG/哈希优化能够影响后量子公钥签名性能。

#strong[模型与局限：] 最终产物是数字签名和零知识证明，不是对称加密模式。安全性不能只从 AES 密钥长度推出，还依赖 OWF、承诺与 Fiat-Shamir 等组件；紧致 QROM 分析应结合 E08 阅读。

#strong[研究启发（调研判断）：] 签名协议与底层对称计算共同设计，是这条邻接主线的核心。

]

#block(breakable: false)[

#heading(level: 2)[E07 · One Tree to Rule Them All: Optimizing GGM Trees and OWFs for Post-Quantum Signatures #cite(<Baum2024OneTree>)] <paper-E07>

#strong[作者：] Carsten Baum；Ward Beullens；Shibam Mukherjee；Emmanuela Orsini；Sebastian Ramacher；Christian Rechberger；Lawrence Roy；Peter Scholl。#linebreak()
#strong[年份 / 发表状态：] 2024；已发表 ASIACRYPT 2024；DBLP + ePrint。#linebreak()
#strong[阅读深度：] 摘要级。#linebreak()
#strong[BibTeX key：] #code-field("Baum2024One​Tree")。#linebreak()
#strong[来源：] #link("https://eprint.iacr.org/2024/490")[IACR ePrint 2024/490]；#link("https://dblp.org/rec/conf/asiacrypt/BaumBMORRRS24")[DBLP 记录]；#link("https://doi.org/10.1007/978-981-96-0875-1_15")[正式 DOI]。

优化 all-but-one vector commitment 和 GGM 树，结合少量签名端工作量证明改善参数，研究 AES、MQ 与 RAIN 三类 OWF 对 VOLEitH 的不同影响。

#strong[模型与局限：] FAESTER、KuMQuat、MandaRain 并不共享相同底层困难假设；MQ 路线也不应笼统归入对称原语。速度与长度比较须保持安全级别、工作量证明参数和平台一致。ePrint 于 2025-03-31 修订，会议为 2024。

#strong[研究启发（调研判断）：] 性能瓶颈从分组密码本身扩展到树、承诺、随机性和证明见证长度。

]

#block(breakable: false)[

#heading(level: 2)[E08 · Shorter, Tighter, FAESTer: Optimizations and Improved (QROM) Analysis for VOLE-in-the-Head Signatures #cite(<Baum2025FAESTer>)] <paper-E08>

#strong[作者：] Carsten Baum；Ward Beullens；Lennart Braun；Cyprien Delpech de Saint Guilhem；Michael Klooß；Christian Majenz；Shibam Mukherjee；Emmanuela Orsini；Sebastian Ramacher；Christian Rechberger；Lawrence Roy；Peter Scholl。#linebreak()
#strong[年份 / 发表状态：] 2025；已发表 CRYPTO 2025；Springer 正式页 + ePrint；DBLP 搜索本轮仅定位 ePrint 记录。#linebreak()
#strong[阅读深度：] 摘要级；并检查出版社正文脚注。#linebreak()
#strong[BibTeX key：] #code-field("Baum2025FAESTer")。#linebreak()
#strong[来源：] #link("https://eprint.iacr.org/2026/164")[IACR ePrint 2026/164]；#link("https://doi.org/10.1007/978-3-032-01887-8_5")[正式 DOI]。

把向量承诺中部分哈希调用替换为 AES-PRG，利用 AES S-box 代数结构压缩见证，并给出 Rényi 散度技术的经典分析及相应 QROM/Fiat-Shamir 分析。

#strong[模型与局限：] 正式发表为 2025-08-17，ePrint 全文于 2026-01-31 上传，不能当作两个独立成果。Springer 脚注明确其形式化分析并不把 AES 建模为理想密码；具体假设不能简化为“在理想 AES 下安全”。

#strong[研究启发（调研判断）：] 把更紧的安全损失转化为更小参数，并与代码优化一起评估。

]

#block(breakable: false)[

#heading(level: 2)[E09 · Lynx: Symmetric Primitive for Shorter and Faster VOLE-in-the-Head Signatures #cite(<Jiao2026Lynx>)] <paper-E09>

#strong[作者：] Lin Jiao；Hongsen Yang；Hongrui Cui；Yituo He；Yonglin Hao；Xiaojie Guo；Qunxiong Zheng；Jiang Zhang；Yu Yu；Kang Yang。#linebreak()
#strong[年份 / 发表状态：] 2026；近期预印本；2026-05-29 首发，2026-05-31 修订。#linebreak()
#strong[阅读深度：] 摘要级。#linebreak()
#strong[BibTeX key：] #code-field("Jiao2026Lynx")。#linebreak()
#strong[来源：] #link("https://eprint.iacr.org/2026/1099")[IACR ePrint 2026/1099]。

为 VOLEitH 定制多分支对称原语 Lynx，通过见证长度、方程次数、有限域乘法及 VOLE 相关性数量优化 Lynxer 签名。体现“面向具体证明系统设计原语”的新方向。

#strong[模型与局限：] 设计者声称覆盖全部经典/量子攻击并优于若干已有方案，不构成独立安全确认。性能数字比较的是指定设置下的 Rainier、AIMer、FAESTv2，不能扩张为对所有当前签名的领先结论。

#strong[研究启发（调研判断）：] 优先独立分析：截断函数、低次数结构、代数攻击与量子资源，以及与最新 FAEST 参数的公平比较。

]

#block(breakable: false)[

#heading(level: 2)[E10 · Magic Pot: Cryptanalysis of Full AIM2 in the Standard and Related-/reused-Key Settings Using New Elimination Framework #cite(<Biryukov2026MagicPot>)] <paper-E10>

#strong[作者：] Alex Biryukov；Pablo García Fernández；Aleksei Udovenko。#linebreak()
#strong[年份 / 发表状态：] 2026；已发表 EUROCRYPT 2026；DBLP + ePrint（重大修订）。#linebreak()
#strong[阅读深度：] 摘要级。#linebreak()
#strong[BibTeX key：] #code-field("Biryukov2026Magic​Pot")。#linebreak()
#strong[来源：] #link("https://eprint.iacr.org/2026/903")[IACR ePrint 2026/903]；#link("https://dblp.org/rec/conf/eurocrypt/BiryukovFU26")[DBLP 记录]；#link("https://doi.org/10.1007/978-3-032-25333-0_3")[正式 DOI]。

针对 AIMer v2\.1 的 AIM2，以一元多项式环上的扩展线性化和多项式矩阵零向量算法构造代数攻击。作者报告标准设置下达不到标称级别；对 RAIN 也有分析改进。

#strong[模型与局限：] 必须区分标准设置与密钥复用/相关密钥误用：摘要中实验上可行的攻击属于后者。不能概括为“所有 AIMer 使用均已实用攻破”；RAIN 改进明确未威胁其标称安全。首次上传 2026-05-08。

#strong[研究启发（调研判断）：] 这是新 AO 原语必须与最新攻击同步评估的直接证据；攻击本身主要是经典代数攻击，也会影响后量子方案。

]

#block(breakable: false)[

#heading(level: 2)[E11 · One More Pair, More Information Gained: Improved Attacks on LowMC with Full S-box Layers Using Two Plaintext/Ciphertext Pairs #cite(<Sun2025LowMCTwoPairs>)] <paper-E11>

#strong[作者：] Yimeng Sun；Jiamin Cui；Shiyao Chen；Meiqin Wang；Longzheng Cui；Chao Niu。#linebreak()
#strong[年份 / 发表状态：] 2025；预印本；本轮未确认正式录用。#linebreak()
#strong[阅读深度：] 摘要级。#linebreak()
#strong[BibTeX key：] #code-field("Sun2025Low​MCTwo​Pairs")。#linebreak()
#strong[来源：] #link("https://eprint.iacr.org/2025/1498")[IACR ePrint 2025/1498]；#link("https://dblp.org/rec/journals/iacr/SunCCWCN25")[DBLP 记录]。

研究两个明密文对下的 LowMC，利用密钥导出差分降低方程次数，再结合改进差分枚举，作者报告扩展到部分八轮实例。其问题来源是签名应用的低数据量场景与安全证明所需假设的差异。

#strong[模型与局限：] 限定于论文列出的全 S-box 层配置、数据条件与轮数，不能据此宣称所有 LowMC 或 Picnic 均已攻破。首次上传 2025-08-20；经典攻击仍直接影响 PQ 签名可信度。

#strong[研究启发（调研判断）：] “一个/两个样本、已知/选择明文、OWF/PRP”之间的模型差别，很适合做严谨的安全边界研究。

]

#block(breakable: false)[

#heading(level: 2)[E12 · The SPHINCS+ Signature Framework #cite(<Bernstein2019SPHINCSPlus>)] <paper-E12>

#strong[作者：] Daniel J\. Bernstein；Andreas Hülsing；Stefan Kölbl；Ruben Niederhagen；Joost Rijneveld；Peter Schwabe。#linebreak()
#strong[年份 / 发表状态：] 2019；已发表 ACM CCS 2019；DBLP + ePrint。#linebreak()
#strong[阅读深度：] 摘要级。#linebreak()
#strong[BibTeX key：] #code-field("Bernstein2019SPHINCSPlus")。#linebreak()
#strong[来源：] #link("https://eprint.iacr.org/2019/1086")[IACR ePrint 2019/1086]；#link("https://dblp.org/rec/conf/ccs/BernsteinHKNRS19")[DBLP 记录]；#link("https://doi.org/10.1145/3319535.3363229")[正式 DOI]。

提出无状态哈希签名框架，以 FORS 和可调哈希函数抽象组织安全分析与参数选择。作为哈希原语支撑 PQC 的成熟经典基线保留。

#strong[模型与局限：] 哈希签名属于公钥签名。2019 论文中的参数和标准化轮次是历史状态，不能代替当前 SLH-DSA 标准；采用哈希原语也不意味着可忽略多目标攻击和具体安全损失。

#strong[研究启发（调研判断）：] 后续研究集中在更好的大小/时间折衷、实现保护以及多用户具体安全。

]

#block(breakable: false)[

#heading(level: 2)[E13 · At the Top of the Hypercube -- Better Size-Time Tradeoffs for Hash-Based Signatures #cite(<Khovratovich2025Hypercube>)] <paper-E13>

#strong[作者：] Dmitry Khovratovich；Mikhail A\. Kudinov；Benedikt Wagner。#linebreak()
#strong[年份 / 发表状态：] 2025；已发表 CRYPTO 2025；DBLP + ePrint。#linebreak()
#strong[阅读深度：] 摘要级。#linebreak()
#strong[BibTeX key：] #code-field("Khovratovich2025Hypercube")。#linebreak()
#strong[来源：] #link("https://eprint.iacr.org/2025/889")[IACR ePrint 2025/889]；#link("https://dblp.org/rec/conf/crypto/KhovratovichKW25")[DBLP 记录]；#link("https://doi.org/10.1007/978-3-032-01887-8_4")[正式 DOI]。

重新研究 Winternitz 哈希链消息编码，建立给定签名长度下验证成本的下界，再用非均匀、高维超立方体顶层编码改善验证成本。适用于基于哈希链的签名框架。

#strong[模型与局限：] 作者报告的 20%-40% 改善针对相应签名/编码成本，不能未经系统评估等同为整个 SLH-DSA 端到端性能提升；替换标准编码会形成新方案，需独立参数与兼容性处理。首次上传 2025-05-19。

#strong[研究启发（调研判断）：] 说明哈希签名并未因标准化而停止基础研究：组合编码和紧致下界仍有空间。

]

#block(breakable: false)[

#heading(level: 2)[E14 · Secure Distributed State Management for Stateful Signatures with a Practical and Universally Composable Protocol #cite(<Bloemer2025DistributedState>)] <paper-E14>

#strong[作者：] Johannes Blömer；Henrik Bröcher；Volker Krummel；Laurens Porzenheim。#linebreak()
#strong[年份 / 发表状态：] 2025；近期预印本；2025-12-18 首发，本轮未确认正式录用。#linebreak()
#strong[阅读深度：] 摘要级。#linebreak()
#strong[BibTeX key：] #code-field("Bloemer2025Distributed​State")。#linebreak()
#strong[来源：] #link("https://eprint.iacr.org/2025/2278")[IACR ePrint 2025/2278]。

面向 LMS/XMSS 的一次性密钥使用状态，定义 UC 理想功能并给出分布式状态管理协议，应用于多个 HSM 组成的安全域。

#strong[模型与局限：] 核心是有状态哈希签名的状态一致性，不能直接当作数据加密密钥管理定理。UC 安全声明的具体通信、故障与腐化假设须在正文中复核；摘要不证明一切现实故障下安全。

#strong[研究启发（调研判断）：] 恢复、备份、并发签名与多 HSM 场景下，状态管理是独立于量子搜索复杂度的部署研究问题。

]

#heading(level: 2)[经典背景与补充追踪]

Picnic 路线的经典起点是 Melissa Chase、David Derler、Steven Goldfeder、Claudio Orlandi、Sebastian Ramacher、Christian Rechberger、Daniel Slamanig、Greg Zaverucha 的 #emph[Post-Quantum Zero-Knowledge and Signatures from Symmetric-Key Primitives]，CCS 2017: 1825-1842，DOI #link("https://doi.org/10.1145/3133956.3133997")[10\.1145/3133956\.3133997]，已用 #link("https://dblp.org/rec/conf/ccs/ChaseDGORRSZ17")[DBLP 正式会议记录]核验。这里作为 E06/E11 的背景，不另外计入 14 篇核心文献。

进一步值得追踪的 IACR 线索包括 #link("https://eprint.iacr.org/2025/981")[2025/981：Rain/AIM 多项式分解攻击]、#link("https://eprint.iacr.org/2025/2272")[2025/2272：AIM2 高指数修补的安全分析]、#link("https://eprint.iacr.org/2025/1999")[2025/1999：MPCitH 的新 QROM 安全证明]、#link("https://eprint.iacr.org/2024/097")[2024/097：all-but-one 承诺与 half-tree]、#link("https://eprint.iacr.org/2025/113")[2025/113：VOLEitH 门限环签名]。这些本轮只完成发现，不用作已核验核心结论，也不把其摘要安全宣称视为审计结果。

#heading(level: 2)[可落地的研究问题（调研推断，非新颖性结论）]

#report-table((1.9fr, 3.8fr, 1.2fr, 3.6fr), [应用扩展中的可检验研究问题], ([方向], [可检验的问题], [起读文献], [在立项前必须核查],), (
  [自适应 PQ-DiSE],
  [能否加入密钥刷新或成员变更而保留具体 QROM 安全与线性在线开销？],
  [E01-E03],
  [EQuADiSE 已覆盖哪些腐化、刷新、重分享与通信模型],
  [PQ 合取 DSSE],
  [能否把已证明渐近高效的后量子实例做成现实参数和可复现实验？],
  [E04-E05],
  [同源/格实例假设、参数、查询泄漏及服务器恶意行为],
  [AES/VOLEitH 联合优化],
  [承诺树、见证长度和安全损失哪个决定实际大小/时间最优点？],
  [E06-E08],
  [最新协议版本、安全类别、平台和实现保护成本],
  [新 AO 原语独立分析],
  [Lynx 截断与多分支结构是否留下新的代数或低数据量攻击面？],
  [E09-E11],
  [完整参数、方程消元复杂度、经典与量子成本不能混用],
  [哈希链编码与部署],
  [编码改进能否与完整签名参数、状态管理和并发执行共同优化？],
  [E12-E14],
  [一次性/少次签名限制、状态回滚、失效恢复与 UC 假设],
))

#heading(level: 2)[数据质量与核验记录]

#list(
  [apaper MCP 的 #code-field("search_​iacr_​papers") 配合年份上下界出现不完整结果：2026 的 Lynx/EQuADiSE/Magic Pot 等使用 2024-2026 筛选时查不到，而无年份的 Rainier 检索能找到 2026/1099 和 2026/903。因此，本报告以官方页 History 和正式会议信息为准，MCP 返回 0 不视为不存在。],
  [#code-field("search_​dblp_​papers(include_​bibtex=​true)") 的八组查询均返回 JSON 解析或 Server disconnected 错误；后续转用 DBLP 官方网页，成功核验 E01、E02、E04、E06、E07、E10、E12、E13 的正式会议记录。#strong[DBLP 的 #code-field("journals/​iacr/​*") 只是 ePrint 索引，不证明论文经过同行评审。]],
  [DBLP 原始 BibTeX 链接及页面 BibTeX 视图本轮未能取得；#link(<bibliography>)[applications\.bib] 是从已读取的官方元数据整理的 BibTeX，文件头明确标注来源转录，并保留可重试的 DBLP #code-field("biburl")。不把它冒充成功下载的 DBLP 原始 BIB。],
  [E08 的正式出版年份、页码与 DOI 由 #link("https://link.springer.com/chapter/10.1007/978-3-032-01887-8_5")[Springer 正式页]确认；官方脚注 3 说明其分析不把 AES 视作理想密码。E03 的 ESORICS 2026 信息、E05 的 ASIACCS 2025 信息在本轮仍主要依赖 ePrint 作者填写元数据，已单列该证据强度。],
  [原始 MCP 查询日志仅作为本地辅助材料保留在 #code-field("evidence/​applications-​mcp.​json")，不纳入 Git；报告已保留查询方式、论文来源与核验结论。对于最新预印本，未找到录用证据只记“未确认”，不记“未录用”。],
  [本轮未收录泛泛声称“量子安全”的边缘应用文章；例如某些神经泄漏 LowMC 文章依赖额外泄漏模型，若不先核实模型与实现的联系，不宜作为标准 LowMC 安全被破坏的证据。],
)
