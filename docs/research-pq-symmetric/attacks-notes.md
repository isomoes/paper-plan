# 量子密码分析与资源估计：专题调研记录

调研范围：对称原语面对量子对手的结构攻击、通用密码分析、量子电路资源估计。检索截止日期：**2026-09-08**（整理工作跨至台北时间 2026-09-09）。重点检索 IACR ePrint；正式发表状态使用 IACR 页面、DBLP 官方记录/官方搜索索引及作者机构出版记录交叉核验。

## 阅读与证据等级

- **A：摘要与书目核验**：核读论文的官方摘要/出版页面，未逐条复算证明或攻击复杂度。除特别标注的 A08 外，本清单全部属于 A。
- **B：定点正文核读**：A08 额外阅读 PDF 前 4 页（按文件顺序）导论及模型限制，仍不等于全文复现。
- **正式发表（DBLP 元数据核验）**：已经看到 DBLP 正式会议/期刊记录，且与 IACR 或作者机构记录一致。
- **正式发表（IACR 元数据核验）**：ePrint 的 Publication info 明确写明会议/期刊，但本次尚未取得对应 DBLP 正式条目的完整 BibTeX。
- **预印本**：仅确认公开可访问，不把 ePrint 收录或 DBLP 的 IACR Cryptol. ePrint Arch. 条目当作录用。

本专题没有执行电路仿真、复现代码或复核证明；所有精确参数均须在开展课题前回到指定版本、模型和表格复核。

## 方向地图与判断

| 方向 | 已有研究基础 | 2024–2026 的活跃变化 | 对选题的意义 |
|---|---|---|---|
| Q2 结构攻击与周期区分器 | Simon、Grover-meet-Simon、隐藏周期 | 截断差分联系 → SMT 符号搜索 → 前缀可实现性与密钥依赖条件（A05/A09/A15） | 自动发现之外，更需要验证区分器确实可实现，明确成功密钥比例 |
| 量子线性、差分及混合攻击 | Grover、幅度放大/估计；经典最优攻击未必量子最优 | 相关态与区分器组合；几何统一框架（A08/A14） | 将“有区分优势”变成“可标记正确子密钥”，并计入数据装载 |
| Q1 离线量子攻击 | Offline Simon 在经典查询后量子计算 | 置换 PRF 的时间/数据折中（A13） | 应按具体构造验证，不能泛化为所有 PRF 被同一指数攻破 |
| 流密码量子分析 | LFSR 快速相关攻击 | 量子 Hadamard 与有限域离散对数结合（A06） | 研究状态查询接口的现实性；强 Q2 结果不等于现网流密码失守 |
| AES/轻量级的资源估计 | 完整 Grover oracle 与深度限制（A04） | 最小 T-depth、最小宽度、DW-cost、SMT 最优性（A10/A11/A16） | 从单个 S-box 指标转向完整攻击 oracle 与统一成本模型 |
| 嵌套搜索/MITM/反弹攻击通用工具 | 多层 Grover/幅度放大 | 自动化复杂度框架与常数开销优化（A07） | 适合与自动搜索框架结合；必须重算量子内存和可逆过滤成本 |
| Ascon 等新标准相关评估 | 密钥搜索与碰撞资源建模 | 电路估计（A12）和小型非线性层综合（A16） | 必须区分 Ascon 历史版本、AEAD 与 Hash，以及模式证明和具体置换分析 |

这里的“活跃”指本次精选文献在近两年存在连续进展，**不是基于全数据库论文数量或引用量的计量排名**。

### 必须统一的攻击模型

**Q1** 表示攻击者有量子计算能力，对秘密密钥原语只发经典查询；**Q2** 还允许对秘密密钥原语进行叠加查询。两者都可能允许攻击者在本地对公开算法实现量子电路。Q1 并不自动意味着“没有量子内存假设”：部分算法还需要量子可访问经典内存（QRACM），必须单列。

查询复杂度、经典数据量、逻辑门数、T-count、T-depth、总深度、逻辑量子位、DW-cost、物理量子位及容错运行时间是不同指标。低成本量子 AES 实现意味着更便宜的攻击 oracle；它不会让 AES 本身变得更安全。也不能单凭 Grover 的平方根加速就把所有具体算法的安全强度机械减半。A02、A04、A08 提供了这些区分的直接研究依据。

## 精选论文（16 篇）

### A01. Q2 结构攻击的基础文献

**Breaking Symmetric Cryptosystems Using Quantum Period Finding**\
Marc Kaplan; Gaëtan Leurent; Anthony Leverrier; María Naya-Plasencia. **CRYPTO 2016, Part II, pp. 207–237**。

- 状态：正式发表，DBLP 与 Springer 正式论文集核验。
- 来源：[DBLP](https://dblp.org/rec/conf/crypto/KaplanLLN16)；[DOI](https://doi.org/10.1007/978-3-662-53008-5_8)；[作者预印本](https://arxiv.org/abs/1602.05973)；[IACR 正式 PDF](https://www.iacr.org/archive/crypto2016/98150203/98150203.pdf)。
- 贡献：将隐藏 XOR 周期与 Simon 算法用于对称结构、认证模式及滑动攻击，表明量子威胁并不局限于 Grover。
- 模型/局限：**Q2**。论文对 CBC-MAC、GCM 等的结果必须连同叠加查询模型陈述，不能转述为经典网络接口已遭同样攻击。
- 阅读：A；保留理由：理解后续模式安全与周期区分器文献必读。

### A02. 量子差分与线性分析的基础框架

**Quantum Differential and Linear Cryptanalysis**\
Marc Kaplan; Gaëtan Leurent; Anthony Leverrier; María Naya-Plasencia. **IACR ToSC 2016(1), pp. 71–94**。

- 状态：正式发表，DBLP 核验。不要误写为 2016(3)。
- 来源：[DBLP](https://dblp.org/rec/journals/tosc/KaplanLLN16)；[DOI](https://doi.org/10.13154/tosc.v2016.i1.71-94)；[作者预印本](https://arxiv.org/abs/1510.05836)。
- 贡献：分析差分/线性攻击的量子化，说明经典最优方案未必在量子模型下最优，且不同变体不都获得统一平方根加速。
- 模型/局限：明确比较只有量子计算与还可量子查询的情况，即 **Q1/Q2 分场景**；示例是 LAC/KLEIN，不能外推为完整 AES 攻击。
- 阅读：A；保留理由：给整个后续“重新优化经典分析”的方向奠基。

### A03. 经典查询下的 Offline Simon

**Quantum Attacks Without Superposition Queries: The Offline Simon's Algorithm**\
Xavier Bonnetain; Akinori Hosoyamada; María Naya-Plasencia; Yu Sasaki; André Schrottenloher. **ASIACRYPT 2019, Part I, pp. 552–583**。

- 状态：正式发表，DBLP 官方作者页与 ePrint 核验。
- 来源：[ePrint 2019/614](https://eprint.iacr.org/2019/614)；[DBLP](https://dblp.org/rec/conf/asiacrypt/BonnetainHNSS19)。
- 贡献：将 Simon 子程序移入离线量子计算阶段；对 Even–Mansour 给出量子时间/经典数据均为约 $2^{n/3}$、量子位 $O(n^2)$ 的示例。
- 模型/局限：核心是 **Q1**，另讨论复用叠加查询的视角；要计入经典数据获取及装载，复杂度依赖具体构造和参数，不适用于任意分组密码。
- 阅读：A；保留理由：是“经典服务接口也要考虑结构性量子攻击”的关键依据。

### A04. 完整 Grover oracle 与实际资源核算

**Implementing Grover Oracles for Quantum Key Search on AES and LowMC**\
Samuel Jaques; Michael Naehrig; Martin Roetteler; Fernando Virdia. **EUROCRYPT 2020, Part II, pp. 280–310**；预印本首次 2019-10-03。

- 状态：正式发表；DBLP、IACR、Royal Holloway 出版记录核验。
- 来源：[ePrint 2019/1146](https://eprint.iacr.org/2019/1146)；[DBLP](https://dblp.org/rec/conf/eurocrypt/JaquesNRV20)；[DOI](https://doi.org/10.1007/978-3-030-45724-2_10)。
- 贡献：完整 Grover 密钥搜索 oracle 的 Q# 实现与可复现估计；在深度上限下共同考虑门数、宽度和 DW-cost。
- 模型/局限：**Q1 可适用的本地密钥搜索**；少量经典明密文对与公开加密算法可逆实现足够。逻辑资源并非真实物理机器开销。
- **版本警示**：官网注明 2023-06-07 修订纠正 Q# bug 导致的 AES 资源估计错误，LowMC 未重算。比较时必须记录所用版本，不能直接拼接原版与修订版表格。
- 阅读：A。

### A05. 截断差分与周期区分器的联系

**Links between Quantum Distinguishers Based on Simon's Algorithm and Truncated Differentials**\
Zejun Xiang; Xiaoyu Wang; Bo Yu; Bing Sun; Shasha Zhang; Xiangyong Zeng; Xuan Shen; Nian Li. **IACR ToSC 2024(2), pp. 296–321**。

- 状态：正式发表，DBLP 官方记录与 FSE 2025 节目册核验。
- 来源：[DBLP](https://dblp.org/rec/journals/tosc/XiangWYSZZSL24)；[DOI](https://doi.org/10.46586/tosc.v2024.i2.296-321)。
- 贡献：连接 Simon 型量子区分器与截断差分，为调用现有经典自动分析工具提供理论路径。
- 模型/局限：属于 **Q2 周期区分器** 研究；后续 A09 指出此路径对未知差分构造周期和自动化仍有局限。
- 阅读：A，贡献依据题录及 A09 官方摘要对前作的说明，**未核读本篇完整摘要/正文**。应在正式立项时补读原文。

### A06. LFSR 流密码的快速相关攻击

**Quantum Algorithms for Fast Correlation Attacks on LFSR-Based Stream Ciphers**\
Akinori Hosoyamada. **ASIACRYPT 2024, Part VIII, pp. 396–430**。

- 状态：正式发表；DBLP 作者页与 ePrint 核验；ePrint 2024-06-05 首发，2024-09-20 修订。
- 来源：[ePrint 2024/894](https://eprint.iacr.org/2024/894)；[DBLP](https://dblp.org/rec/conf/asiacrypt/Hosoyamada24)。
- 贡献：借助量子 Hadamard 变换及 LFSR 状态更新与有限域乘法的联系构造加速算法；分析 SNOW 2.0、SNOW 3G、Sosemanuk。
- 模型/局限：**论文自定义的强 Q2 模型**，包含比通常现网接口强的能力；抽象安全结果不能直接解释为这些流密码在正常部署下被量子高效破解。
- 阅读：A；保留理由：补充分组密码之外的流密码方向。

### A07. 通用嵌套搜索的量子化

**Quantum Procedures for Nested Search Problems: with Applications in Cryptanalysis**\
André Schrottenloher; Marc Stevens. **IACR Communications in Cryptology 1(3), Article 9, 2024**。

- 状态：正式发表；DBLP 作者页、CWI 机构出版记录与 IACR DOI 核验。预印本首次年份 2022，不应误当 2024 新提出的全部成果。
- 来源：[ePrint 2022/761](https://eprint.iacr.org/2022/761)；[DOI](https://doi.org/10.62056/aee0fhbmo)；[CWI](https://ir.cwi.nl/pub/34918)；[DBLP 作者页](https://dblp.org/pid/15/4413)。
- 贡献：给多层选择、过滤、回溯搜索通用量子转换与复杂度公式，减少直接嵌套幅度放大的开销，并用于减轮 AES。
- 模型/局限：是通用算法框架，**Q1/Q2 由其调用的底层 oracle 决定**；过滤可逆实现、成功概率、内存访问都需计价。
- 阅读：A；保留理由：适合与 MITM、反弹、差分搜索及自动化工具对接。

### A08. 相关态与区分器的混合量子线性攻击

**Improved Quantum Linear Attacks and Application to CAST**\
Kaveh Bashiri; Xavier Bonnetain; Akinori Hosoyamada; Nathalie Lang; André Schrottenloher. **IACR ToSC 2025(2), pp. 124–165**。

- 状态：正式发表，DBLP 与 IACR 核验；ePrint 2024-12-09 首发，2025-05-27 修订。
- 来源：[ePrint 2024/1992](https://eprint.iacr.org/2024/1992)；[PDF](https://eprint.iacr.org/2024/1992.pdf)；[DBLP](https://dblp.org/rec/journals/tosc/BashiriBHLS25)；[DOI](https://doi.org/10.46586/tosc.v2025.i2.124-165)。
- 贡献：用附加区分器标记相关态中的正确子密钥，再做幅度放大；融合 Simon 与线性分析并应用于 CAST。
- 模型/局限：**Q1 + 快速 QRACM，和/或 Q2**。PDF 导论明确指出消除大型 QRACM 要求仍是开放问题；部分示例额外经典预计算抵消表面优势。减轮结果不应写成全轮破解。
- 阅读：**B：摘要、书目与 PDF 前 4 页（按文件顺序）**；尚未复算表中每条攻击。

### A09. SMT 自动搜索量子周期区分器

**Quantum Periodic Distinguisher Construction: Symbolization Method and Automated Tool**\
Qun Liu; Haoyang Wang; Jinliang Wang; Boyun Li; Meiqin Wang. **ASIACRYPT 2025**。

- 状态：IACR 元数据注明该会议论文的 major revision；2025-04-15 首发，2025-12-20 最新修订。
- 来源：[ePrint 2025/681](https://eprint.iacr.org/2025/681)。
- 贡献：符号化表示与 SMT 搜索扩展到未知差分及概率周期，对 GFS、LBlock、TWINE、Skipjack-B、SKINNY 等报告新减轮区分器。
- 模型/局限：核心 **Q2**；“找到区分器”不自动得到低成本密钥恢复，仍需证明 oracle 可构造、满足周期条件并计算完整成本。
- 阅读：A；后续：必须与 A15 的前缀实现性/密钥依赖条件并读。

### A10. AES/SHA3 的最小 T-depth 与最小宽度

**Constructing Quantum Implementations with the Minimal T-depth or Minimal Width and Their Applications**\
Zhenyu Huang; Fuxin Zhang; Dongdai Lin. **EUROCRYPT 2025**。

- 状态：IACR 元数据注明该会议论文的 major revision；2025-02-12 首发，2025-03-04 修订。
- 来源：[ePrint 2025/212](https://eprint.iacr.org/2025/212)。
- 贡献：通用向量布尔函数及有限域求逆的量子实现；给出 AES S-box 的 T-depth-3 电路和低宽度实现，包括单 S-box 9 量子位、成对 S-box 16 量子位、SHA3 chi 的 5 量子位例子。
- 模型/局限：攻击 oracle 的本地电路组件，适用于 Q1 密钥搜索；**不同“最小”指标对应不同电路方案**，不能说一条电路同时实现所有最优性。逻辑门集与 ancilla 限制需一致。
- 阅读：A。

### A11. AES 的低 DW-cost 综合

**Quantum Circuit Synthesis for AES with Low DW-cost**\
Haoyu Liao; Qingbin Luo. **ASIACRYPT 2025**。

- 状态：IACR 元数据注明该会议论文的 minor revision；2025-08-19 首发，2025-11-27 修订。
- 来源：[ePrint 2025/1494](https://eprint.iacr.org/2025/1494)。
- 贡献：联合优化原位 S-box、密钥扩展和轮函数；摘要报告 AES-128/192/256 的 DW-cost 相对其基线降低至少 46%/45%/45%。
- 模型/局限：适用于 **Q1 本地 Grover oracle** 的成本评估；百分比是论文特定门集/基线下结果，并非密钥安全位数同比降低。修订版增加 Clifford+T 的加密和 Grover oracle 估计，应按同类指标比较。
- 阅读：A。

### A12. Ascon 的量子资源评估

**Quantum Security Evaluation of ASCON**\
Yujin Oh; Kyungbae Jang; Hwajeong Seo. **ePrint 2025/260**，2025-02-18 收到/公开。

- 状态：ePrint 页面仅标 **Preprint**；本次未核实正式录用，保留为近期跟踪项。
- 来源：[ePrint](https://eprint.iacr.org/2025/260)。
- 贡献：量子电路与深度优化资源估计，覆盖 ASCON-AEAD、Hash 和 ASCON-80pq，讨论 Grover 密钥搜索及碰撞成本。
- 模型/局限：本地量子计算与 Q1 密钥搜索有关；**ASCON-80pq 是被分析的历史版本名称，不能与最终 Ascon 标准参数混写**。模式可证明安全、具体置换安全与逻辑电路估计是三个不同问题；本次未复核其碰撞基线。
- 阅读：A。

### A13. 置换 PRF 的 Q1 时间/数据折中

**Quantum Key-Recovery Attacks on Permutation-Based Pseudorandom Functions**\
Hong-Wei Sun; Fei Gao; Rong-Xue Xu; Dan-Dan Li; Zhen-Qiang Li; Ke-Jia Zhang. **ePrint 2025/501**，2025-03-17 首发，2025-03-20 修订。

- 状态：**Preprint**，未核实正式录用。
- 来源：[ePrint](https://eprint.iacr.org/2025/501)。
- 贡献：针对若干特定置换 PRF/相关 MAC 构造应用 Offline Simon，摘要给出约 $2^{n/3}$ 量子时间与经典查询、$O(n^2)$ 量子位的攻击型态。
- 模型/局限：核心 **Q1**，另改进若干 Q2 数据复杂度。摘要措辞很宽，本记录只认可其针对列举构造的主张；不得推广到所有置换 PRF，完整参数和适用条件需正文验证。
- 阅读：A；优先级：低于同方向正式发表基础文献，适合跟踪。

### A14. 统一量子区分器的几何框架

**A Geometric Approach to Quantum Distinguishers**\
Zhili Wu; Zhenzhen Bao. **CRYPTO 2026**。

- 状态：IACR 元数据注明该会议论文的 major revision；2026-06-03 首发，2026-06-09 修订。本次尚未取得正式 DBLP BibTeX。
- 来源：[ePrint 2026/1158](https://eprint.iacr.org/2026/1158)。
- 贡献：以相关矩阵和量子相关态统一 Simon/Bernstein–Vazirani/Deutsch–Jozsa 等结构区分与线性/差分概率估计；讨论信号在基态间稀释导致的低查询效率以及集中信号的方法。
- 模型/局限：**明确 Q2**；制备相关态的单次叠加查询不等于“一次查询即可恢复密钥”，测量成功率与后处理必须计入。
- 阅读：A；价值：近期理论框架型成果，适合精读后寻找新实例。

### A15. 周期搜索的可实现性与密钥条件

**Revisiting Automated Quantum Periodic Distinguisher Construction**\
Jian Guo; Yiran Yao. **ePrint 2026/1528**，2026-07-25 收到，2026-07-30 公开。

- 状态：**Preprint**，未核实正式录用。
- 来源：[ePrint](https://eprint.iacr.org/2026/1528)。
- 贡献：在 A09 代数 SMT 模型上增加前缀可实现性与 DDT filtering；显式说明桶选择与目标周期的密钥相关条件，并给出部分 Grover–meet–Simon 密钥恢复候选。
- 模型/局限：**Q2/结构攻击候选**；条件依赖密钥，不能把工具输出的最大轮数自动解读为对任意密钥均成立；全文及代码尚待独立复核。
- 阅读：A；价值：2026 年近两个月的新进展，尤其适合做验证与复现导向选题。

### A16. 最新 SMT 量子电路综合

**Novel SMT Encoding for Quantum Circuit Optimization**\
Youbo Guo; Fengrong Zhang; Lei Liao; Yongzhuang Wei; Baocang Wang; Xiaogang Zhou. **ePrint 2026/1815**，2026-08-27 收到，2026-08-28 公开。

- 状态：**Preprint**，截至截止日仅约两周。
- 来源：[ePrint](https://eprint.iacr.org/2026/1815)。
- 贡献：exact-G/at-most-G SMT 编码，覆盖 4/5-bit S-box 和小线性层；摘要声称无辅助位 NCT 门集下 Keccak S-box 有 13 门最优电路，并报告 ASCON 等适用性。
- 模型/局限：属于 **Q1 攻击 oracle 的可用本地组件**；最优性限定门集、无辅助位及目标函数。NCT 门数、Clifford+T 总深度与物理成本不能直接互换。
- 阅读：A；价值：很新，适合监控和复现，当前不把其摘要最优性宣称当作本次已证明事实。

## 值得展开的研究题目（本调研提出的建议）

1. **带可验证证书的周期区分器自动搜索。** 以 A05 → A09 → A15 为线索，将符号解转为具体输入族/密钥条件、给出前缀构造证书与小参数穷举验证；再计算完整密钥恢复成本。清晰的研究问题是“工具发现的优势在多大比例密钥与什么查询接口下成立”，而不仅是多增加一轮。发表潜力依赖新理论、系统性缺陷修正或跨多种结构的改进，单次换密码实例较弱。

2. **减少相关态攻击中的 QRACM 假设。** A08 正文直接指出该问题仍开放。可研究受限/分层/流式量子数据访问、预计算折中或电路重算，并比较其相对 Grover 的净优势。挑战是数据制备可能消耗掉 Fourier 型理论加速；这一点必须成为主指标。

3. **完整攻击 oracle 的统一资源基准。** 将 A10/A11/A16 的 S-box/轮函数组件，放入同一可逆 AES/Ascon oracle，统一明密文对数、反计算、密钥扩展、门集、深度上限和成功率。产出可复现代码与 Pareto 曲线；进一步加入明确容错架构才可讨论物理运行时间。仅比较不同论文摘要中的最小量子位数，研究贡献不足。

4. **强 Q2 到受限接口的流密码安全分析。** 以 A06 为基线，逐项降低状态访问能力，判断加速剩余多少，是否可迁移至 Q1/受限 Q2。需要先精读该论文的 oracle 定义，不能预设其强模型攻击就是可迁移的。

5. **把几何区分器框架连接到密钥恢复与自动优化。** 从 A14 的信号集中条件出发，结合 A08 的可标记子密钥和 A07 的嵌套搜索，在明确成本模型下找一个新的、非人为拼凑实例。应同时比较经典最佳攻击、量子 Grover 基线以及已有量子攻击；“相对某个经典算法加速”不足以表明有密码分析优势。

## 检索记录与局限

IACR MCP 查询包括：`quantum symmetric`、`Grover AES`、`Simon quantum`、`quantum differential`、`quantum Ascon`、`offline Simon`、`quantum linear`。先用 2024–2026 显式区间，发现结果年份不一致后去掉 year_max 并逐篇核验页面 History。原始结果可在本地 `evidence/attacks-mcp-search.json` 回查；该辅助日志不纳入 Git。

**MCP 的年份筛选不可靠**：显式 2024–2026 检索中出现 2022/761；某些调用只返回至 2025，而不设 year_max 才出现 2026。不能把返回 0 或前 20 条理解为某方向没有新论文。搜索结果还含量子公钥、QKD、作者名 Simon 等误匹配，已按摘要过滤。

**DBLP BibTeX 获取受限**：五次 `search_dblp_papers(include_bibtex=true)` 调用均返回 Server disconnected。web 对 DBLP .bib 端点也未能返回原始数据；本地网络测试 DNS 不可用。因此 [attacks.bib](attacks.bib) 是依据明确官方书目字段整理的可用 BibTeX，**不是冒充 DBLP 原始导出的文件**。老论文的正式 venue 已用 DBLP 官方记录/索引及 IACR/出版社核验；近期正式文章若仅据 IACR 元数据认定则逐篇标明。省略未核实的 DOI、页码、卷号，避免猜填。

本专题是精选证据地图，不声称列全所有论文、所有密码实例或已完成系统综述。通用哈希碰撞、多碰撞/反弹、AEAD 安全证明等与其他专题交叉的方向应在总报告中合并，避免把同一论文的预印本和正式版本重复计数。
