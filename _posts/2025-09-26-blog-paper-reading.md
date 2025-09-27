---
title: '论文精读-(ICLR 2025 Oral) Safety alignment should be made more than just a few tokens deep'
date: 2025-09-26
permalink: /posts/2025/09/paper-reading-2/
tags:
  - large language model
  - alignment
  - safety
---
本文研究了当前大语言模型安全对齐的浅层性问题，即其对生成分布的调整主要集中在输出的最初几个标记上。(现象)  
这种浅层对齐导致模型易受到各种攻击，包括后缀攻击、填充攻击、解码参数攻击及微调攻击(不良后果)  
因此，本文提出了两种主要的解决方案：
(1) 基于数据增强的方法，通过安全恢复示例延展对齐深度；
(2) 一种受限优化目标，用于在微调时保护初始标记的分布。
> We devise the following fine-tuning objective—inspired in part by approaches like Direct Preference Optimization (DPO)...but adapted to control the deviation from the initial generative distribution for each token position

如何在保持模型效用的同时实现深度对齐?
> We also take benign instructions from the Alpaca dataset...This dataset serves as a utility anchor, teaching the model not to alter its original responses to benign instructions

<h1> Dataset </h1>
AlpacaEval
<h1> Model </h1>
Llama-2 Base
Gemma Base
<h1> Evaluation </h1>
ASR and KL divergence
<h1> References </h1>
[1] https://zhuanlan.zhihu.com/p/10217638621