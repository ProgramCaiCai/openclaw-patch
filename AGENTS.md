# AGENTS.md - openclaw-patch

## 项目概述 / Project Overview

- 本仓库用于维护 OpenClaw 个人补丁集，面向可重复安装与分享。  
  (This repo maintains personal OpenClaw patches for reproducible install and sharing.)
- 补丁来源于 OpenClaw 上游代码，按主题拆分，便于按需应用。  
  (Patches are derived from upstream OpenClaw and split by topic for selective application.)

## Patch 规范 / Patch Rules

- 基线版本固定为 `OpenClaw v2026.2.9`；新增补丁必须基于该版本或 README 明确写明偏差。  
  (Baseline is `OpenClaw v2026.2.9`; any deviation must be documented in README.)
- 文件命名遵循 `git format-patch` 序号格式：`0001-<short-subject>.patch`。  
  (Use `git format-patch` sequence naming: `0001-<short-subject>.patch`.)
- 每个 patch 必须原子化、单一职责；禁止把无关修改混在同一 patch。  
  (Each patch must be atomic and single-purpose.)
- 多个 patch 有依赖时，必须在 `README.md` 标注应用顺序与依赖关系。  
  (If patches depend on each other, document order/dependencies in `README.md`.)

## 代码风格 / Code Style

- 补丁内容必须匹配 OpenClaw 现有 TypeScript 风格与目录约定。  
  (Patch content must follow existing OpenClaw TypeScript style and layout.)
- 提交信息使用 Conventional Commits：`type(scope): subject`。  
  (Use Conventional Commits format.)
- PR 必须纯净：只包含本次补丁相关文件与改动。  
  (PRs must be clean and scoped to patch-related changes only.)

## 质量要求 / Quality Bar

- 新功能必须包含测试（单元或集成），并与变更范围对应。  
  (New features require matching unit/integration tests.)
- 修改前后都要在目标 OpenClaw 工程中验证 `npm run build` 通过。  
  (Validate `npm run build` passes before and after applying patches.)
- 合并前执行交叉 code review（双模型 review），至少覆盖正确性与回归风险。  
  (Run cross-model review before merge, covering correctness and regression risk.)

## 安装与验证 / Install & Verify

- 使用 `./install.sh` 一键安装补丁。  
  (Install patches via `./install.sh`.)
- 安装后至少完成：补丁应用成功检查 + `npm run build` 通过。  
  (After install, verify patch apply success and passing build.)

## 文件保护 / File Protection

- `README.md` 只能由 agent 手动编辑，任何脚本（包括 `generate-patches.sh`）禁止覆盖或修改。  
  (`README.md` may only be edited by an agent; no script may overwrite or modify it.)
- `AGENTS.md`、`install.sh` 同理：脚本只能操作 `patches/` 目录。  
  (Same for `AGENTS.md` and `install.sh`: scripts may only touch `patches/`.)
- `generate-patches.sh` 是唯一的补丁生成入口，只清理并重建 `patches/` 目录。  
  (`generate-patches.sh` is the sole patch generation entry point; it only clears and rebuilds `patches/`.)
- 禁止在本仓库中包含 OpenClaw 原项目源代码。  
  (Never include original OpenClaw source code in this repo.)
- **补丁必须永远基于最新稳定版（release tag）生成**，基线随官方发布更新，不固定某个版本。  
  (**Patches must always be generated against the latest stable release tag**; the baseline moves with each official release, never pinned to a fixed version.)

## 文档规则 / Documentation Rules

- 所有文档必须中英双语（中文优先）。  
  (All docs must be bilingual, Chinese first.)
- README.md 更新时必须同步补丁列表、功能说明、安装步骤。  
  (When updating README.md, keep patch list, features, and install steps in sync.)
- 禁止罗列式堆砌文件名或 patch 列表；要有结构、可读性、一眼能懂。  
  (No raw file/patch dumps; docs must be structured and scannable.)

## 文件结构 / File Layout

- `patches/*.patch`（或仓库根目录 `*.patch`）— 补丁文件  
  (`patches/*.patch` or root `*.patch` — patch files)
- `README.md` — 项目说明（中英双语）  
  (`README.md` — bilingual project documentation)
- `install.sh` — 一键安装脚本  
  (`install.sh` — one-click install script)
- `AGENTS.md` — 本操作手册  
  (`AGENTS.md` — this operation manual)
