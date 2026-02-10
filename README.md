# OpenClaw Patch Bundle

## 中文

这是一组可直接应用到 OpenClaw 基线代码的功能增强与稳定性修复补丁，用于提升长会话可用性、工具调用安全性和 Telegram 路由正确性。

### 核心功能

- **`ctx_safe_call` 上下文保护调用**：为工具调用增加统一输出护栏，支持 `maxChars`/`offset`/`limit`/`fields`/`filter`，避免单次返回过大内容挤爆 LLM 上下文窗口。
- **`ctx_safe_call` 支持 provider tools**：`read`/`exec`/`process` 也可被安全包装，在不绕过既有权限策略的前提下实现受控输出，并完整透传 `AbortSignal` 提升中断与超时处理可靠性。
- **`session_compact` 保留关键对话窗口**：新增 `keepHead`/`keepTail` 参数，压缩时可固定保留开场上下文与最近交互，减少“压缩后失忆”风险。
- **压缩内容规范化**：在压缩前清理冗余格式与噪声结构，降低无效 token 消耗，让同等上下文预算承载更多有效信息。
- **Telegram ChatType 路由修复**：修正 Telegram 原生命令场景下的 `dm`→`direct` 类型映射，避免因类型不一致导致的路由偏差。

### 安装方法

```bash
chmod +x install.sh
./install.sh
```

### 基于版本

- OpenClaw base commit: `1d46ca3a95c7ff2669cc9c2a231fc460a2a3cbbb`
- Patch head commit: `d78c01d47`

---

## English

This repository provides a patch bundle that can be applied on top of the OpenClaw base code to improve long-session reliability, safe tool execution, and Telegram routing correctness.

### Core Capabilities

- **`ctx_safe_call` for context-safe tool execution**: adds bounded output controls with `maxChars`/`offset`/`limit`/`fields`/`filter` so large tool responses do not overflow the LLM context window.
- **Provider-tool coverage in `ctx_safe_call`**: extends safe wrapping to `read`/`exec`/`process` while preserving full permission-policy enforcement and `AbortSignal` propagation for robust cancellation behavior.
- **`session_compact` with preserved conversation windows**: introduces `keepHead`/`keepTail` so compaction can keep both initial intent and the most recent turns, reducing context loss after compression.
- **Compaction content normalization**: removes redundant formatting/noise before compaction to reduce token waste and increase the share of useful context.
- **Telegram ChatType routing fix**: corrects `dm`→`direct` type handling for Telegram native command routing to prevent misrouted execution paths.

### Installation

```bash
chmod +x install.sh
./install.sh
```

### Based On

- OpenClaw base commit: `1d46ca3a95c7ff2669cc9c2a231fc460a2a3cbbb`
- Patch head commit: `d78c01d47`
