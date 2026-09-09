// Research-group talk, 15-20 minutes: 16 main slides + 4 backup slides.
// Content is condensed from report.typ / report-body.typ, not a new literature search.
// Preserve the report's 2026-09-08 cutoff, paper IDs, models and evidence limits.
#import "@preview/touying:0.6.1": *
#import themes.simple: *
#import "presentation-style.typ": *

#set document(
  title: "后量子对称密码：关键进展与研究切口",
  author: "isomoes",
  description: "研究组分享；基于 report.typ；16 页主讲与 4 页附录；文献截止 2026-09-08。",
  date: datetime(year: 2026, month: 9, day: 9),
)
#show: presentation-theme

#title-slide[
  #kicker[研究组分享 / RESEARCH OVERVIEW]
  #v(25pt)
  #text(size: 44pt, weight: "bold")[后量子对称密码]
  #v(12pt)
  #text(size: 29pt, fill: accent)[关键进展与研究切口]
  #v(28pt)
  从攻击模型与安全证明，走向可检验的选题
  #v(30pt)
  #small[isomoes · 2026-09-09]
  #v(8pt)
  #text(size: 14pt, fill: muted)[基于完整调研报告 · 文献截止 2026-09-08 · 15-20 分钟]
  #speaker-note[约 30 秒。说明这是选题导向的文献地图。今天先统一模型，再讨论研究进展，最后比较三条可落地路线。结论沿用报告截点，不宣称重新核验了所有文献。]
]

= 背景与共同语言

== 先带走三个判断

#grid(columns: (1fr, 1fr, 1fr), gutter: 18pt,
  card([01　模型决定结论], [Q1 / Q2、目标接口、公开原语访问方式，都可能改变攻击与证明。], height: 190pt),
  card([02　结构与成本并重], [Grover 是基线。结构攻击、模式组合、具体电路成本需要分别分析。], height: 190pt),
  card([03　把选题做具体], [优先聚焦多用户证明、攻击自动化，或统一约束下的资源估计。], height: 190pt),
)
#v(18pt)
#takeaway[核心问题：在什么访问能力和资源预算下，什么安全性质仍然成立？]
#source[报告 §1、§3、§5。热点与优先级来自本次样本归纳，不是引用量排名或新颖性证明。]
#speaker-note[约 45 秒。不要把讨论压缩成 AES 密钥需要多长。报告也没有说量子计算机已经使 AES 失效。后续每个结论都要绑定模型、构造和评价指标。]

== 这份调研提供了怎样的研究地图？

#grid(columns: (1fr, 1fr, 1fr), gutter: 24pt,
  [#text(size: 42pt, weight: "bold", fill: accent)[14] #small[类研究方向]],
  [#text(size: 42pt, weight: "bold", fill: accent)[64] #small[篇编号研究论文]],
  [#text(size: 42pt, weight: "bold", fill: accent)[68] #small[条参考文献]],
)
#v(20pt)
#grid(columns: (1fr, 1fr), gutter: 16pt,
  card([攻击与资源], [量子搜索、周期结构、经典攻击量子化]),
  card([构造与证明], [Feistel、Sponge、PRF、MAC、AEAD]),
  card([使用方式], [多用户、预计算、密钥管理与高级功能]),
  card([相邻应用], [后量子签名、分布式/可搜索加密、HHE]),
)
#source[报告 §2、§4。64 篇研究 + 4 条官方背景资料；以摘要、元数据与部分正文核读为主，未独立复现所有证明/实验。]
#speaker-note[约 45 秒。14 类是报告原始分类，四个框是为了口头汇报重新组织的概念分组。哈希纳入对称密码研究，但哈希不是加密；签名属于相邻应用。全方向编号放在附录。]

== Q1 与 Q2：先问攻击者能访问哪个接口

#grid(columns: (1fr, 1fr), gutter: 22pt,
  card([Q1：目标接口接受经典查询], [
    量子计算 → 经典查询 → 目标接口
    #v(18pt)
    *离线阶段*仍可进行量子计算，也可量子求值公开算法。
  ], height: 206pt),
  card([Q2：目标接口允许叠加查询], [
    量子计算 → 叠加查询 → 目标接口
    #v(18pt)
    必须写明：加密、解密、标签生成或验证，哪些接口可量子访问？
  ], height: 206pt),
)
#v(16pt)
#takeaway[Q1 的“经典查询”约束目标秘密密钥接口；公开原语可以有不同的访问模型。]
#source[报告 §3；A03：#link("https://eprint.iacr.org/2019/614")[Offline Simon，ASIACRYPT 2019]。QROM / QICM / QIPM 分别理想化随机预言机、密码与置换。]
#speaker-note[约 90 秒。左侧是经典在线接口与量子离线计算的组合，不意味着所有 oracle 只能经典访问。右侧比普通网络部署通常提供的能力更强。QROM 等术语还规定公开理想原语的访问方式，不能用 Q1/Q2 两个标签代替完整游戏。]

== 从 Grover 的查询次数，到完整攻击成本

#grid(columns: (1fr, 1.65fr), gutter: 28pt,
  [
    #kicker[理想穷举基线]
    #v(15pt)
    #text(size: 43pt)[$2^(k/2)$]
    #v(10pt)
    约需的搜索迭代次数
    #v(14pt)
    #small[条件：单钥、单目标、无可利用结构；$k$ 为密钥位数。]
  ],
  [
    #card([一次 oracle 的成本], [可逆加密 + 密钥扩展 + 比较/标记 + 反计算])
    #v(12pt)
    #card([整体搜索与实现约束], [总门数、深度、量子位、存储、并行、成功概率与容错成本])
  ],
)
#v(18pt)
#takeaway[资源比较要固定同一套假设；查询次数不能直接换算成现实运行时间。]
#source[报告 §3、§10；#link("https://eprint.iacr.org/2019/1146")[A04，EUROCRYPT 2020]；#link("https://eprint.iacr.org/2024/381")[A17，ASIACRYPT 2024]。A04 的 AES 估计有 2023 年纠错修订，比较须固定版本。]
#speaker-note[约 90 秒。这里的指数不是基本门数。反计算用于清理工作寄存器，也占成本。A04 提供完整实现基线，其 AES 估计曾修订，说明公平比较必须记录版本。不要把优化 S-box 的百分比解释为密钥安全位数下降同样比例。]

= 关键进展

== 结构攻击：从周期发现，走向自动搜索与验证

#grid(columns: (1fr, 1fr, 1fr), gutter: 18pt,
  card([基础：利用周期结构], [*A01 · CRYPTO 2016*

    Simon 型 Q2 攻击揭示部分构造的结构弱点。

    *A03 · ASIACRYPT 2019*

    Offline Simon 将相关思路带到特定 Q1 场景。
  ], height: 258pt),
  card([搜索：符号化与 SMT], [*A09 · ASIACRYPT 2025*

    自动生成周期区分器，扩展到未知差分与概率周期。

    找到区分器后，仍需推导完整攻击。
  ], height: 258pt),
  card([验证：可实现性与密钥], [*A15 · 2026 预印本*

    增加前缀可实现性、差分分布表过滤及密钥依赖条件。

    最大轮数需结合成立条件解读。
  ], height: 258pt),
)
#source[报告 §10：#link("https://dblp.org/rec/conf/crypto/KaplanLLN16")[A01] · #link("https://eprint.iacr.org/2019/614")[A03] · #link("https://eprint.iacr.org/2025/681")[A09] · #link("https://eprint.iacr.org/2026/1528")[A15]。特定结构/减轮结果不能推广到所有分组密码。]
#speaker-note[约 90 秒。沿这条线看研究如何成熟：有结构性现象，再有自动搜索器，然后检查搜索器输出是否能成为真实攻击。A15 是预印本，代码和全文尚待独立复核。我们的潜在切口必须超出它已经加入的过滤条件。]

== 证明工具正在连接“理想置换”与具体模式

#compare((1.1fr, 2.1fr, 2.2fr), ([层次], [代表进展], [能支持什么判断]),
  [工具], [P06 · 置换叠加 oracle #linebreak()
    P07 · Quantum Lifting], [处理可逆性、双向查询与量子查询界],
  [结构], [P08 · Sponge 量子 indifferentiability], [在理想置换模型中，为 Sponge 的组合替换提供依据],
  [模式], [P09 · Keyed Sponge 模块化 Q1 证明], [将工具用于 Ascon 模式、KMAC 与加钥 Sponge],
)
#v(18pt)
#takeaway[2026 年 P13 的压缩置换 oracle 进一步扩展证明工具；具体原语仍需独立分析。]
#source[报告 §11：#link("https://eprint.iacr.org/2024/1140")[P06 / STOC 2025] · #link("https://eprint.iacr.org/2025/738")[P07 / CRYPTO 2025] · #link("https://eprint.iacr.org/2025/731")[P08 / FOCS 2025] · #link("https://eprint.iacr.org/2025/1059")[P09 / ASIACRYPT 2025] · #link("https://eprint.iacr.org/2025/1734")[P13 / STOC 2026]。]
#speaker-note[约 90 秒。indifferentiability 的作用是给出理想对象的组合替换依据。报告将 2024-2025 的 Sponge 与置换工具视为样本中清晰的理论热点。不要再以“首次证明 Sponge 量子 indifferentiability”为题，也不能从这一结果直接推出实际 Keccak 无条件安全。]

== Ascon 案例：参数、模式证明与资源估计要分开

#grid(columns: (1fr, 1fr, 1fr), gutter: 18pt,
  card([标准参数], [*SP 800-232 · 2025*

    确定实验对象、算法名称与接口。

    需要区分最终标准和历史版本 ASCON-80pq。
  ], height: 224pt),
  card([模式层的证明], [*P09 / P10 · Q1*

    比较安全性质、nonce 条件、伪造次数与理想置换假设。

    安全指数必须连同模型限制一起阅读。
  ], height: 224pt),
  card([攻击电路的成本], [*A12 · 预印本*

    分析可逆电路及资源开销。

    逻辑门优化与模式安全证明回答不同问题。
  ], height: 224pt),
)
#v(16pt)
#takeaway[“已标准化”“有模式证明”“有资源估计”分别提供不同层面的证据。]
#source[报告 S5、A12、P09-P10；#link("https://csrc.nist.gov/pubs/sp/800/232/final")[SP 800-232] · #link("https://eprint.iacr.org/2025/1059")[P09 / 正式发表] · #link("https://eprint.iacr.org/2025/411")[P10 / 预印本] · #link("https://eprint.iacr.org/2025/260")[A12 / 预印本]。]
#speaker-note[约 75 秒。P09 覆盖模型更广，但部分 key 指数弱于 P10，不能只比较指数宣布完全优于另一篇。报告对 κ 编码含义未做全文复核，因此这里不把摘要式直接代入标准参数算安全位数。]

== 多用户与预计算：把使用方式写进安全游戏

#grid(columns: (1fr, 1.15fr), gutter: 24pt,
  [
    #card([共享公开原语 / 预计算结果], [经典数据或量子 advice，可能被多个目标复用。])
    #align(center)[#text(size: 28pt, fill: teal)[↓　↓　↓]]
    #grid(columns: (1fr, 1fr, 1fr), gutter: 10pt,
      card([用户 1], [$K_1$]), card([用户 2], [$K_2$]), card([用户 ℓ], [$K_ell$]),
    )
  ],
  [
    *P15 · ToSC 2026*：多钥 TEM / FX 的 Q1 分析。

    *P16 · 作者标注 SCN 2026*：多钥 tweakable Feistel 已有结果。

    *P17 · 预计算框架*：普通 indifferentiability 不能直接覆盖带 advice 的攻击。
  ],
)
#v(12pt)
#takeaway[明确总查询/每用户预算、攻击任一/全部目标，以及预处理成本是否计入。]
#source[报告 §3、§11：#link("https://eprint.iacr.org/2026/382")[P15] · #link("https://eprint.iacr.org/2026/1312")[P16，正式卷页未核] · #link("https://eprint.iacr.org/2024/1727")[P17，作者称 CiC 2026，正式卷目待核]。]
#speaker-note[约 90 秒。图表示建模时需要考虑的共享资源，不代表任意系统都允许这些能力。多用户安全损失依赖具体构造，不能统一乘一个用户数。P16 已覆盖一类多用户 Feistel 问题，因此这整个方向不再是空白。]

== 相邻应用：研究对象从原语延伸到完整系统

#grid(columns: (1fr, 1fr, 1fr), gutter: 18pt,
  card([后量子签名], [*FAEST / Lynx / Magic Pot*

    联合考虑证明成本与代数安全余量。

    新原语的性能主张需要独立密码分析。
  ], height: 231pt),
  card([分布式与可搜索加密], [*EQuADiSE / PQ-SSE*

    自适应腐化、查询泄漏、PQC 假设与实际参数。

    PQ 实例需要自己的性能实验。
  ], height: 231pt),
  card([混合同态加密 HHE], [*PASTA / PETCHA*

    对称加密降低客户端负担；服务端承担同态转换成本。

    比较带宽、延迟、吞吐与实现保护。
  ], height: 231pt),
)
#v(14pt)
#small[选应用方向时，贡献应落在具体协议、假设或瓶颈；后量子签名本身不是对称加密。]
#source[报告 §12、S2-S4：#link("https://eprint.iacr.org/2026/164")[E08] · #link("https://eprint.iacr.org/2026/1099")[E09 / 预印本] · #link("https://eprint.iacr.org/2026/903")[E10] · #link("https://eprint.iacr.org/2026/799")[E03 / 作者称录用] · #link("https://eprint.iacr.org/2026/742")[E04] · #link("https://eprint.iacr.org/2021/731")[S2] · #link("https://eprint.iacr.org/2026/112")[S3]。]
#speaker-note[约 75 秒。E04 的具体加速实验属于经典实例，不能挪给 PQ 实例。Magic Pot 中实验可行攻击有密钥复用/相关密钥条件，不应说所有 AIMer 部署都已实用攻破。HHE 的完整安全还取决于同态层假设和组合。]

== 近期观察：跟踪版本，也跟踪证据状态

#compare((.85fr, 2.5fr, 1.3fr), ([时间], [工作与观察点], [截至报告截点的状态]),
  [06-09 修订], [A14 · 几何区分器框架 #linebreak()
    统一结构区分与概率估计], [IACR 标注 CRYPTO 2026 版本],
  [06-23 首发], [P16 · 多钥 tweakable Feistel #linebreak()
    收窄“多用户证明”的选题范围], [作者标注 SCN 2026；卷页待核],
  [07-25 收到], [A15 · 周期搜索再审视 #linebreak()
    可实现性与密钥条件], [预印本],
  [08-27 收到], [A16 · SMT 量子电路优化 #linebreak()
    先复核门集与最优性条件], [预印本],
)
#source[报告 §6：#link("https://eprint.iacr.org/2026/1158")[A14] · #link("https://eprint.iacr.org/2026/1312")[P16] · #link("https://eprint.iacr.org/2026/1528")[A15] · #link("https://eprint.iacr.org/2026/1815")[A16]。日期均为 2026 年；A14 首发为 06-03，修订日不作为首发日。]
#speaker-note[约 60 秒。这里是报告截至 9 月 8 日的观察，不是后续实时更新。新不等于优先采用；预印本适合复现和检验，而已发表工作的最新修订也可能改变基线。]

= 从调研到选题

== 三条优先路线：用交付物来比较

#compare((1fr, 1.6fr, 1.6fr, 1.6fr), ([路线], [核心问题], [最小可检验成果], [主要风险]),
  [*理论* #linebreak()
    D7 + D5], [具体模式的 Q1 多用户/预计算安全], [清晰游戏、具体界与攻击基线], [可能已被通用定理覆盖],
  [*密码分析* #linebreak()
    D2 + D3], [自动搜索结果是否对应有效攻击], [搜索器、验证器与完整成本], [可能只是重复已有过滤条件],
  [*实现* #linebreak()
    D1], [统一约束下 oracle 成本如何比较], [可复现基准与深度/宽度权衡], [仅移植或换算法，贡献不足],
)
#v(19pt)
#takeaway[先确定一个构造、一种安全性质和一个改进指标，再检索与复现。]
#source[报告 §5、§10-§12。以下三页将报告建议展开为讨论用的项目起点，均未证明新颖性。]
#speaker-note[约 60 秒。选择取决于组内能力：量子查询证明、求解器与密码分析、或可逆电路与基准工程。这里只比较研究起点，不能因为报告列了候选问题，就说它们已经是可以投稿的新贡献。]

== 路线一：具体模式的 Q1 多用户安全

#grid(columns: (1.1fr, 1fr), gutter: 24pt,
  card([先固定安全游戏], [
    - 目标：一个置换模式及一项安全性质。
    - 接口：经典在线查询、公开原语的量子访问。
    - 预算：用户数、总查询量、预计算与存储。
  ], height: 247pt),
  card([形成可核查的结果], [
    - 画出已有定理的覆盖范围。
    - 写出包含用户数与资源预算的具体界。
    - 给出攻击基线，尽量与上界匹配。
  ], height: 247pt),
)
#v(16pt)
#takeaway[起读 P04 → P09 → P15 → P16；重点查紧致性、接口限制或尚未覆盖的性质。]
#source[报告 §5、§11：#link("https://eprint.iacr.org/2026/382")[P15] · #link("https://eprint.iacr.org/2026/1312")[P16]。预计算可延伸阅读 #link("https://eprint.iacr.org/2024/1727")[P17]，但须另核适用条件。]
#speaker-note[约 75 秒。项目第一步不是立刻证明新定理，而是把既有游戏和参数并排放好。若目标命题已被 P09/P15/P16 覆盖，就继续收窄到具体性质、用户数损失或假设。匹配攻击是目标，不是保证已有。]

== 路线二：让自动搜索输出经得起攻击验证

#grid(columns: (1fr, auto, 1fr, auto, 1fr), gutter: 12pt,
  card([候选生成], [符号模型

    SMT 约束

    区分器见证], height: 180pt),
  align(horizon)[→],
  card([有效性验证], [前缀可实现性

    密钥依赖条件

    周期与成功概率], height: 180pt),
  align(horizon)[→],
  card([攻击成本核算], [数据与存储

    oracle 与后处理

    密钥恢复代价], height: 180pt),
)
#v(20pt)
*可交付：*可复现搜索器 + 见证检查 + 拒绝原因 + 有效攻击轮数与成本。
#v(15pt)
#takeaway[先复现 A09 与 A15；新增约束、反例或验证能力必须超出现有方法。]
#source[报告 §5、§10：#link("https://eprint.iacr.org/2025/681")[A09 / ASIACRYPT 2025] · #link("https://eprint.iacr.org/2026/1528")[A15 / 预印本]；统一框架可参照 #link("https://eprint.iacr.org/2026/1158")[A14]。]
#speaker-note[约 75 秒。验证器需要能明确拒绝无效见证，不能仅确认自己的符号求解器输出。最大轮数只是一个指标；完整 oracle 是否可构造、多少密钥满足条件以及成功概率，决定结果能否成为攻击。]

== 路线三：建立统一约束的量子资源基准

#grid(columns: (1fr, 1fr), gutter: 24pt,
  card([固定比较条件], [
    相同目标任务与参数层次

    成功概率、明密文对数、门集

    密钥日程、反计算与辅助量子位

    深度上限、并行与存储模型
  ], height: 238pt),
  card([报告完整权衡], [
    先复现 AES 完整 oracle 基线

    再纳入 Ascon / ARX 的可比实例

    同时报告门数、深度与宽度

    公开版本、参数、脚本与误差来源
  ], height: 238pt),
)
#v(16pt)
#takeaway[研究价值来自可比的模型与新权衡；局部电路更小，还需验证整体搜索收益。]
#source[报告 §5、A04、A10-A12、A17；#link("https://eprint.iacr.org/2019/1146")[A04] · #link("https://eprint.iacr.org/2025/212")[A10] · #link("https://eprint.iacr.org/2025/1494")[A11] · #link("https://eprint.iacr.org/2024/381")[A17]。最小 T-depth 与最小宽度可能属于不同电路。]
#speaker-note[约 75 秒。先做一组可信基线，再扩展对象。AES、Ascon 与 ARX 实例的接口和参数可能不同，因此需要明确比较的是哪个任务；不能把不同安全目标下的门数直接排名。物理成本要额外声明纠错和硬件假设。]

== 下一步讨论：先选一条路线，做一个可检查的结果

#grid(columns: (1fr, 1fr, 1fr), gutter: 18pt,
  card([理论路线], [*带来一份游戏与定理对照表*

    哪个构造、性质或参数损失仍值得改进？], height: 180pt),
  card([密码分析路线], [*带来一组可复现见证*

    哪些候选有效，哪些因模型或密钥条件被排除？], height: 180pt),
  card([实现路线], [*带来一个统一资源基线*

    在相同约束下，整体成本瓶颈在哪里？], height: 180pt),
)
#v(24pt)
#takeaway[讨论落点：我们最有把握复现哪项已有结果，又能在哪个指标上前进一步？]
#v(15pt)
#small[后续流程建议：精读与复现 → 前后向引文检索 → 确认差距 → 收敛选题。]
#source[主讲到此结束。后附模型/方向速查与精选阅读入口；完整论文记录、作者与来源见配套 report.typ / report.pdf。]
#speaker-note[约 45 秒，随后讨论。请组内围绕一条路线提出明确的复现对象，不同时铺开三条线。后续流程是汇报组织建议，没有宣称已经完成新颖性检索。主讲约 18 分钟，附录只在问答时打开。]

#show: appendix
= 附录与阅读入口

== 附录 A：比较结论时，最容易混淆的边界

#compare((1.1fr, 2.5fr, 2.4fr), ([项目], [需要保留的区别], [为什么影响结论]),
  [参数], [密钥长度 / 分组长度 / 标签长度 / 容量], [分别约束搜索、数据量、认证与 Sponge 等不同风险],
  [安全性质], [原像 / 碰撞 / PRP / strong PRP / 认证], [不同目标不能统一套用“安全位数减半”],
  [Feistel 轮数], [P12：Q1 KAF，3 轮 PRP / 4 轮 strong PRP #linebreak()
    P13：7 轮 Feistel strong qPRP], [模型、构造与访问能力不同；不能据此直接比较最小轮数],
  [证据层次], [元数据 / 摘要 / 全证 / 实验复现], [正式发表核验不等于独立验证全部结论],
)
#source[报告 §3、S5、§11：#link("https://eprint.iacr.org/2025/1603")[P12] · #link("https://eprint.iacr.org/2025/1734")[P13]。AES-256 指密钥长度；Rijndael-256 的 256 指分组长度。]
#speaker-note[备用。若有人问“哪篇的轮数更好”或“是否全都减半”，先回到目标性质与访问模型。P13 的七轮结果不是七轮最优性证明。]

== 附录 B：14 类方向的完整速查

#compare((.85fr, 3.7fr), ([分组], [报告中的方向编号与主题]),
  [攻击与资源], [D1 具体量子资源估计　·　D2 周期/结构攻击 #linebreak()
    D3 差分、线性、相关、MITM 等攻击量子化],
  [构造与证明], [D4 EM/FX/Feistel　·　D5 PRF/MAC/AEAD #linebreak()
    D6 Sponge/哈希/置换模型　·　D7 多用户/预计算],
  [设计与应用], [D8 宽分组/轻量级设计　·　D9 对称原语支撑签名 #linebreak()
    D10 哈希签名　·　D11 分布式/可搜索对称加密 #linebreak()
    D12 HHE / transciphering],
  [高级功能], [D13 可更新加密与密钥轮换 #linebreak()
    D14 受限 PRF、对称谓词/功能/属性加密],
)
#source[报告 §4。为阅读方便重新分组，D1-D14 保持报告编号；高级功能和应用可能依赖格等额外假设。]
#speaker-note[备用。用编号回到报告的方向地图与逐篇目录。相邻应用不是只依靠 AES/哈希就能得到所有高级功能；核对底层假设是精读任务的一部分。]

== 附录 C：攻击与资源估计的精选阅读

#paper("https://eprint.iacr.org/2019/614", "A03", [Quantum Attacks Without Superposition Queries: The Offline Simon’s Algorithm], [ASIACRYPT 2019 · 经典在线接口与离线量子结构攻击])
#paper("https://eprint.iacr.org/2019/1146", "A04", [Implementing Grover Oracles for Quantum Key Search on AES and LowMC], [EUROCRYPT 2020 · 完整 oracle 基线；注意 2023 年 AES 估计纠错修订])
#paper("https://eprint.iacr.org/2024/381", "A17", [Quantum Circuits of AES with a Low-Depth Linear Layer and a New Structure], [ASIACRYPT 2024 · 线性层与完整电路的深度/宽度权衡])
#paper("https://eprint.iacr.org/2025/681", "A09", [Quantum Periodic Distinguisher Construction: Symbolization Method and Automated Tool], [ASIACRYPT 2025 · 周期区分器自动搜索])
#paper("https://eprint.iacr.org/2026/1528", "A15", [Revisiting Automated Quantum Periodic Distinguisher Construction], [2026 预印本 · 可实现性与密钥依赖条件；与 A09 并读])
#paper("https://eprint.iacr.org/2026/1815", "A16", [Novel SMT Encoding for Quantum Circuit Optimization], [2026 预印本 · 最优性受门集、辅助位与目标函数限制])
#source[报告 §10；标题可点击访问原始论文。论文编号用于回查完整作者、版本、核读深度与模型限制。]
#speaker-note[备用。攻击路线从 A03/A09 起步，资源路线从 A04/A17 起步。A15/A16 用于检验当前方向已经覆盖的内容，不默认其最新主张已被我们独立验证。]

== 附录 D：安全证明与多用户分析的精选阅读

#paper("https://eprint.iacr.org/2025/738", "P07", [Quantum Lifting for Invertible Permutations and Ideal Ciphers], [CRYPTO 2025 · 经典界提升到量子模型的工具；须检查适用条件])
#paper("https://eprint.iacr.org/2025/731", "P08", [The Sponge Is Quantum Indifferentiable], [FOCS 2025 · 理想置换下的 Sponge 组合替换依据])
#paper("https://eprint.iacr.org/2025/1059", "P09", [Post-Quantum Security of Keyed Sponge-Based Constructions Through a Modular Approach], [ASIACRYPT 2025 · Ascon / KMAC / keyed sponge 的模块化 Q1 分析])
#paper("https://eprint.iacr.org/2025/1734", "P13", [Compressed Permutation Oracles], [STOC 2026 · 置换证明工具与 strong qPRP 应用])
#paper("https://eprint.iacr.org/2026/382", "P15", [Multi-Key Security in the Quantum World: Revisiting Tweakable Even-Mansour and FX], [ToSC 2026 · 特定构造的 Q1 多钥查询界])
#paper("https://eprint.iacr.org/2026/1312", "P16", [Post-Quantum Security of Tweakable Key-Alternating Feistel Ciphers in the Multi-Key Setting], [作者标注 SCN 2026；报告尚未核到正式卷页 · 多用户 Feistel 的已有覆盖])
#source[报告 §11；预计算延伸：#link("https://eprint.iacr.org/2024/1727")[P17 · (Quantum) Indifferentiability and Pre-Computation]。全部 68 条书目见配套报告与 references.bib。]
#speaker-note[备用。模式路线按 P09/P15/P16 阅读，工具路线按 P07/P08/P13 阅读。引述定理前需回到完整正文，尤其核对查询预算、密钥参数与版本。]
