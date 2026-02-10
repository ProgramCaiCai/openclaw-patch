# OpenClaw Personal Patches

> 解决 OpenClaw 在长会话、多 subagent 高强度使用中的三个实际痛点：压缩太粗暴、工具输出撑爆上下文、插件装了卸不掉。

## 痛点与方案

### 会话压缩不够精细

原版压缩是全量摘要，经常把刚聊的内容也压掉，或者保留太多旧内容浪费窗口。

补丁加了 `keepHead` / `keepTail` 参数——保留开头的系统指令和最近几轮对话，只摘要中间部分。压缩改为 turn 结束后异步执行，不卡生成；503 自动重试；修了 subagent store 查找和混合内容格式的崩溃。

### 工具调用没有安全网

一次 `read` 大文件或 `exec` 长日志就能灌入几万字符，直接吃掉上下文窗口，后续对话质量断崖下降。

新增 `ctx_safe_call` 工具，包装任意工具调用做 `maxChars` 截断和分页。工具描述里内置了完整使用指南，模型不需要额外 prompt 就知道：provider tools 靠 unix 管道过滤，`fields` 只给原生 JSON 工具用。

```json
{ "tool": "ctx_safe_call",
  "params": { "tool": "exec",
    "params": { "command": "cat app.log | rg ERROR | tail -20" },
    "maxChars": 2000 }}
```

### 插件卸载靠手改配置

试装一个插件失败后，只能手动编辑 JSON 配置删引用、手动删文件，容易留残。

补丁加了 `openclaw plugins uninstall <id>`，一条命令清理配置引用和磁盘文件。`--keep-files` 可以只清配置保留文件。

## 安装

```bash
git clone https://github.com/ProgramCaiCai/openclaw-patch.git
cd openclaw-patch && chmod +x install.sh && ./install.sh
```

脚本自动检测 OpenClaw 路径、校验版本、按序应用补丁。手动应用：`cd /path/to/openclaw && git am patches/*.patch && npm run build`。

## 兼容性

基于 OpenClaw `v2026.2.9`。共 12 个补丁，按依赖顺序编号。官方新版本发布后会 rebase 更新。

---

# English

> Fixes three real pain points when running OpenClaw under heavy use: coarse compaction, uncontrolled tool output flooding context, and no plugin uninstall.

## Problems & Solutions

**Session compaction is too coarse.** Stock compaction summarizes everything or nothing. These patches add `keepHead`/`keepTail` to preserve system instructions and recent turns while summarizing only the middle. Compaction runs async after turn completion with automatic 503 retry, plus fixes for subagent store lookup and mixed-content crashes.

**Tool output can blow up context.** A single `read` or `exec` can dump tens of thousands of chars into the context window. `ctx_safe_call` wraps any tool call with `maxChars` truncation and pagination. Its description includes a built-in usage guide so the model knows: use unix pipes for provider tools, `fields` only for native JSON tools.

**No plugin uninstall.** `openclaw plugins uninstall <id>` cleans config references and files in one command. `--keep-files` to preserve files.

## Install

```bash
git clone https://github.com/ProgramCaiCai/openclaw-patch.git
cd openclaw-patch && chmod +x install.sh && ./install.sh
```

## Compatibility

Based on OpenClaw `v2026.2.9`. 12 patches in dependency order. Will rebase on new releases.

## License

MIT
