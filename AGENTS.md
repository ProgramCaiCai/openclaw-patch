# AGENTS.md - openclaw-patch 仓库规则

## 仓库性质
纯补丁仓库，存放 OpenClaw 个人补丁。

## 铁律
- **只允许**：`*.patch`、`install.sh`、`README.md`、`AGENTS.md`
- **禁止推送 OpenClaw 源码**
- **禁止将 openclaw 分支直接 push 到本 repo**
- patch 由 `git format-patch` 生成，在独立 repo 中管理

## 更新流程
1. openclaw 仓库开发 → format-patch → 复制到本 repo → commit + push
2. push 前验证文件列表无源码文件
