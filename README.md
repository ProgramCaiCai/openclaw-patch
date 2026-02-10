# OpenClaw Personal Patches

> Production-focused patches for OpenClaw that improve long-session reliability, context safety, and day-to-day operability.

## Features / 功能增强

### 🧠 Smarter Session Compaction
Long-running agent sessions often fail in two ways: they either keep too much history and hit context limits, or compact too aggressively and lose critical conversational anchors. This patch set makes compaction significantly more practical in real workflows.

What is improved:
- Adds `keepHead` and `keepTail` to `session_compact`, enabling turn-window compaction (keep the beginning and latest turns, summarize only the middle).
- Runs compaction as a scheduled post-turn action, so it does not interfere with the active generation turn.
- Retries compaction automatically on transient provider/network failures (including common `503`-style temporary errors).
- Passes `agentId` directly to fix subagent session store lookup issues.
- Normalizes message content before compaction to prevent crashes caused by mixed/legacy content formats.

Why it matters:
- Better conversation continuity (decisions and fresh context are preserved).
- Fewer manual recoveries when providers are unstable.
- More reliable behavior for subagent-heavy or multi-session workflows.

Example:

```json
{
  "tool": "session_compact",
  "instructions": "Focus on decisions and unresolved tasks",
  "keepHead": 3,
  "keepTail": 5
}
```

### 🛡️ Context-Safe Tool Wrapper (`ctx_safe_call`)
Tool outputs can easily overflow the context window (large JSON, logs, traces). This patch introduces a context-first wrapper so agents can inspect large outputs safely without breaking the run.

What is improved:
- Adds `ctx_safe_call` (renamed from `safe_call`) as a bounded wrapper for other tools.
- Supports output controls: `maxChars`, `offset`, `limit`, and `fields` for selective extraction.
- Supports a `filter` command pipeline for practical narrowing (`jq`, `rg`, `awk`, `sed`, `head`, `tail`, etc.).
- Includes hardening from code review:
  - strict command allowlist + forbidden command list,
  - no shell operators / command substitution,
  - timeout and buffer limits,
  - optional per-tool wrapping policy (`allowWrapping`, `allowedParams`).

Why it matters:
- Prevents context-window blowups from raw tool outputs.
- Reduces noisy, low-signal payloads before they reach the model.
- Improves safety and predictability when tool chaining in automation.

Example:

```json
{
  "tool": "ctx_safe_call",
  "params": {
    "tool": "read",
    "params": { "path": "logs/app.log" },
    "filter": "rg ERROR",
    "offset": 0,
    "limit": 50,
    "maxChars": 1800
  }
}
```

### 🔧 CLI Improvements
Plugin lifecycle management should not require manual config surgery. This patch adds first-class uninstall support.

What is improved:
- Adds `openclaw plugins uninstall <id>` with `--keep-files` option.
- Removes plugin references from config (`plugins.installs`, `plugins.entries`, matching `plugins.load.paths`, and slot ownerships).
- Deletes files only when safe (managed extension directory); linked installs are preserved.

Why it matters:
- Cleaner rollback for failed experiments.
- Lower risk of stale plugin config causing startup/debug issues.
- Faster plugin iteration loops in local and CI-like environments.

## Installation / 安装

### Option A: one-command script

```bash
chmod +x install.sh
./install.sh
```

### Option B: manual apply

```bash
git clone https://github.com/openclaw/openclaw.git
cd openclaw
git checkout 33c75cb6bf2dde53131f33a1ea4995e1aa8d550e
git am /path/to/openclaw-patch/*.patch
```

## Compatibility / 兼容性
- Based on OpenClaw `v2026.2.9`
- Base commit: `33c75cb6bf2dde53131f33a1ea4995e1aa8d550e`
- Patch count: `12`

## Patch List / 补丁列表
Reference only (grouped by capability):

- Session compaction and reliability:
  - `0001-feat-compaction-add-session_compact-tool.patch`
  - `0004-fix-compaction-schedule-session_compact-after-turn.patch`
  - `0005-fix-compaction-retry-session_compact-on-transient-50.patch`
  - `0006-fix-pass-agentId-directly-to-session_compact-tool-to.patch`
  - `0007-fix-normalize-message-content-before-compaction-to-p.patch`
  - `0012-feat-session_compact-add-keepHead-keepTail-turn-wind.patch`
- Context-safe tool wrapping:
  - `0008-feat-tools-add-safe_call-wrapper-for-bounded-tool-ou.patch`
  - `0009-fix-tools-harden-safe_call-based-on-code-review-feed.patch`
  - `0010-feat-tools-add-filter-command-support-to-safe_call.patch`
  - `0011-refactor-tools-rename-safe_call-to-ctx_safe_call-for.patch`
- CLI and docs:
  - `0002-feat-cli-add-plugins-uninstall-command.patch`
  - `0003-docs-document-session_compact-and-plugins-uninstall.patch`

---

# OpenClaw 个人补丁集

> 面向生产与长期会话的 OpenClaw 补丁：提升会话压缩稳定性、工具调用上下文安全性，以及日常运维效率。

## Features / 功能增强

### 🧠 更智能的 Session Compaction
长对话里最常见的问题是：要么历史太多导致上下文窗口溢出，要么压缩过猛丢掉关键上下文。这个补丁集把压缩能力从“能用”提升到“可长期稳定使用”。

具体增强：
- `session_compact` 新增 `keepHead` / `keepTail` 参数，支持“保留开头回合 + 保留最近回合 + 仅总结中间内容”的回合窗口压缩。
- 压缩改为当前回合结束后调度执行，避免在生成中途打断当前任务。
- 对瞬态故障（包括常见 `503` 等临时不可用）自动重试，降低人工干预频率。
- 修复 subagent 场景下的 `agentId` 传递与会话存储查找问题。
- 压缩前统一消息内容格式，避免历史消息格式不一致导致过滤/压缩崩溃。

用户价值：
- 关键上下文（早期决策 + 最近状态）更容易保留。
- 模型或网络抖动时更稳，不容易因为一次瞬态错误中断流程。
- 多智能体、多会话场景下可预期性更高。

示例：

```json
{
  "tool": "session_compact",
  "instructions": "Focus on decisions and unresolved tasks",
  "keepHead": 3,
  "keepTail": 5
}
```

### 🛡️ 上下文安全工具包装器（`ctx_safe_call`）
很多工具会返回超大输出（JSON、日志、调试信息），直接喂给模型会迅速吃满上下文。该补丁提供上下文优先的调用包装层，让大输出“先裁剪、再进入模型”。

具体增强：
- 新增 `ctx_safe_call`（由 `safe_call` 重命名），用于包装其他工具调用。
- 支持 `maxChars`、`offset`、`limit`、`fields`，按字符/分页/字段精确控量。
- 支持 `filter` 过滤命令，可结合 `jq`、`rg`、`awk`、`sed`、`head`、`tail` 等快速提炼高价值信息。
- 加入代码审查后的安全加固：
  - 严格命令白名单与黑名单，
  - 禁止 shell 运算符与命令替换，
  - 限制超时与缓冲区，
  - 支持按工具配置包装策略（`allowWrapping`、`allowedParams`）。

用户价值：
- 显著降低工具输出撑爆上下文窗口的风险。
- 先过滤再推理，减少噪声，提高分析质量。
- 自动化链路中更安全、更可控。

示例：

```json
{
  "tool": "ctx_safe_call",
  "params": {
    "tool": "read",
    "params": { "path": "logs/app.log" },
    "filter": "rg ERROR",
    "offset": 0,
    "limit": 50,
    "maxChars": 1800
  }
}
```

### 🔧 CLI 增强
插件管理不应依赖手工改配置。这个补丁补齐了卸载能力，减少环境维护成本。

具体增强：
- 新增 `openclaw plugins uninstall <id>`，支持 `--keep-files`。
- 自动清理插件配置引用（`plugins.installs`、`plugins.entries`、匹配的 `plugins.load.paths`、槽位绑定）。
- 仅在安全条件下删除磁盘文件（受管扩展目录）；链接安装默认保留。

用户价值：
- 试验失败后可快速回滚。
- 避免残留配置导致的加载异常与排障成本。
- 插件迭代更快，开发体验更顺滑。

## Installation / 安装

### 方式 A：一键脚本

```bash
chmod +x install.sh
./install.sh
```

### 方式 B：手动应用

```bash
git clone https://github.com/openclaw/openclaw.git
cd openclaw
git checkout 33c75cb6bf2dde53131f33a1ea4995e1aa8d550e
git am /path/to/openclaw-patch/*.patch
```

## Compatibility / 兼容性
- 基于 OpenClaw `v2026.2.9`
- 基线 commit：`33c75cb6bf2dde53131f33a1ea4995e1aa8d550e`
- 补丁数量：`12`

## Patch List / 补丁列表
以下列表仅作索引，重点能力请参考上文功能说明：

- 会话压缩与稳定性：
  - `0001-feat-compaction-add-session_compact-tool.patch`
  - `0004-fix-compaction-schedule-session_compact-after-turn.patch`
  - `0005-fix-compaction-retry-session_compact-on-transient-50.patch`
  - `0006-fix-pass-agentId-directly-to-session_compact-tool-to.patch`
  - `0007-fix-normalize-message-content-before-compaction-to-p.patch`
  - `0012-feat-session_compact-add-keepHead-keepTail-turn-wind.patch`
- 上下文安全工具包装：
  - `0008-feat-tools-add-safe_call-wrapper-for-bounded-tool-ou.patch`
  - `0009-fix-tools-harden-safe_call-based-on-code-review-feed.patch`
  - `0010-feat-tools-add-filter-command-support-to-safe_call.patch`
  - `0011-refactor-tools-rename-safe_call-to-ctx_safe_call-for.patch`
- CLI 与文档：
  - `0002-feat-cli-add-plugins-uninstall-command.patch`
  - `0003-docs-document-session_compact-and-plugins-uninstall.patch`
