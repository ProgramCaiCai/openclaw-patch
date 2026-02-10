# OpenClaw Patch Bundle

Patch set generated from branch `fix/compact-content-normalize` and maintained for direct apply.

## This Refresh

- Added 4 new patches at the tail: `0041`-`0044`.
- New coverage: provider-tool wrapping in `ctx_safe_call`, naming alignment updates, Telegram `ChatType` routing fix, and review hardening fixes.

## Installation

### Option A: one-command script

```bash
chmod +x install.sh
./install.sh
```

### Option B: manual apply

```bash
git clone https://github.com/openclaw/openclaw.git
cd openclaw
git checkout 1d46ca3a95c7ff2669cc9c2a231fc460a2a3cbbb
git am /path/to/openclaw-patch/patches/*.patch
```

## Compatibility

- OpenClaw base commit: `1d46ca3a95c7ff2669cc9c2a231fc460a2a3cbbb`
- Patch head commit: `d78c01d47`
- Patch count: `44`

## Patch List (EN)

- `0001-fix-normalize-message-content-before-compaction-to-p.patch` - fix: normalize message content before compaction to prevent filter crash
- `0002-fix-address-review-feedback-on-content-normalization.patch` - fix: address review feedback on content normalization
- `0003-Agents-scope-sanitizeUserFacingText-rewrites-to-erro.patch` - Agents: scope sanitizeUserFacingText rewrites to errorContext
- `0004-only-check-is-check-docs-when-only-docs-changed.patch` - only check is check-docs when only docs changed
- `0005-discord-auto-create-thread-when-sending-to-Forum-Med.patch` - discord: auto-create thread when sending to Forum/Media channels (#12380)
- `0006-docs-fix-broken-links-checker-and-add-CI-docs-13041.patch` - docs: fix broken links checker and add CI docs (#13041)
- `0007-fix-cap-Discord-gateway-reconnect-at-50-attempts-to-.patch` - fix: cap Discord gateway reconnect at 50 attempts to prevent infinite loop (#12230)
- `0008-feat-add-zai-glm-4.6v-image-understanding-support-10.patch` - feat: add zai/glm-4.6v image understanding support (#10267)
- `0009-fix-suggest-clear-in-context-overflow-error-message-.patch` - fix: suggest /clear in context overflow error message (#12973)
- `0010-fix-docs-broken-links-and-improve-link-checker-13056.patch` - fix: docs broken links and improve link checker (#13056)
- `0011-Deduplicate-more.patch` - Deduplicate more
- `0012-improve-pre-commit-hook.patch` - improve pre-commit hook
- `0013-Update-contributing-deduplicate-more-functions.patch` - Update contributing, deduplicate more functions
- `0014-chore-deps-update-dependencies-remove-hono-pinning.patch` - chore(deps): update dependencies, remove hono pinning
- `0015-fix-tools-correct-Grok-response-parsing-for-xAI-Resp.patch` - fix(tools): correct Grok response parsing for xAI Responses API (#13049)
- `0016-Improve-code-analyzer-for-independent-packages-CI-on.patch` - Improve code analyzer for independent packages, CI: only run release-check on push to main
- `0017-fix-memory-default-batch-embeddings-to-off.patch` - fix(memory): default batch embeddings to off
- `0018-refactor-consolidate-fetchWithTimeout-into-shared-ut.patch` - refactor: consolidate fetchWithTimeout into shared utility
- `0019-docs-add-vulnerability-reporting-guidelines-to-CONTR.patch` - docs: add vulnerability reporting guidelines to CONTRIBUTING.md
- `0020-docs-expand-vulnerability-reporting-guidelines-in-SE.patch` - docs: expand vulnerability reporting guidelines in SECURITY.md
- `0021-fix-unify-session-maintenance-and-cron-run-pruning-1.patch` - fix: unify session maintenance and cron run pruning (#13083)
- `0022-Docker-include-A2UI-sources-for-bundle-13114.patch` - Docker: include A2UI sources for bundle (#13114)
- `0023-Chore-add-testflight-auto-response.patch` - Chore: add testflight auto-response
- `0024-fix-ui-prioritize-displayName-over-label-in-webchat-.patch` - fix(ui): prioritize displayName over label in webchat session picker (#13108)
- `0025-fix-signal-enforce-mention-gating-for-group-messages.patch` - fix(signal): enforce mention gating for group messages (#13124)
- `0026-feat-compaction-add-session_compact-tool.patch` - feat(compaction): add session_compact tool
- `0027-feat-cli-add-plugins-uninstall-command.patch` - feat(cli): add plugins uninstall command
- `0028-docs-document-session_compact-and-plugins-uninstall.patch` - docs: document session_compact and plugins uninstall
- `0029-fix-compaction-schedule-session_compact-after-turn.patch` - fix(compaction): schedule session_compact after turn
- `0030-fix-compaction-retry-session_compact-on-transient-50.patch` - fix(compaction): retry session_compact on transient 503
- `0031-fix-pass-agentId-directly-to-session_compact-tool-to.patch` - fix: pass agentId directly to session_compact tool to fix store lookup for subagent sessions
- `0032-fix-normalize-message-content-before-compaction-to-p.patch` - fix: normalize message content before compaction to prevent filter crash
- `0033-feat-tools-add-safe_call-wrapper-for-bounded-tool-ou.patch` - feat(tools): add safe_call wrapper for bounded tool output
- `0034-docs-openclaw-patch-add-safe_call-reports-and-README.patch` - docs(openclaw-patch): add safe_call reports and README notes
- `0035-docs-openclaw-patch-finalize-report-files.patch` - docs(openclaw-patch): finalize report files
- `0036-docs-openclaw-patch-update-publish-status-notes.patch` - docs(openclaw-patch): update publish status notes
- `0037-fix-tools-harden-safe_call-based-on-code-review-feed.patch` - fix(tools): harden safe_call based on code review feedback
- `0038-docs-reports-add-stable-release-notes-for-safe_call-.patch` - docs(reports): add stable release notes for safe_call hardening
- `0039-docs-reports-note-fork-branch-sync-for-stable-releas.patch` - docs(reports): note fork branch sync for stable release
- `0040-feat-session_compact-add-keepHead-keepTail-turn-wind.patch` - feat(session_compact): add keepHead/keepTail turn-window compaction
- `0041-fix-let-ctx_safe_call-wrap-provider-read-exec-proces.patch` - fix: let ctx_safe_call wrap provider read/exec/process
- `0042-refactor-agents-unify-ctx_safe_call-tool-naming.patch` - refactor(agents): unify ctx_safe_call tool naming
- `0043-fix-use-direct-ChatType-for-telegram-native-command-.patch` - fix: use direct ChatType for telegram native command routing
- `0044-fix-tools-harden-ctx_safe_call-provider-resolution-a.patch` - fix(tools): harden ctx_safe_call provider resolution and signal propagation

## 补丁说明（中文）

- 本次更新将补丁集扩展到 `44` 个，新增 `0041`-`0044`。
- 新增内容包含：`ctx_safe_call` provider tools 支持、命名统一补丁、Telegram `ChatType` 路由修复、以及 review 修复。
- 基线 commit：`1d46ca3a95c7ff2669cc9c2a231fc460a2a3cbbb`；补丁头部 commit：`d78c01d47`。

## 补丁列表（中文）

- `0001-fix-normalize-message-content-before-compaction-to-p.patch` - fix: normalize message content before compaction to prevent filter crash
- `0002-fix-address-review-feedback-on-content-normalization.patch` - fix: address review feedback on content normalization
- `0003-Agents-scope-sanitizeUserFacingText-rewrites-to-erro.patch` - Agents: scope sanitizeUserFacingText rewrites to errorContext
- `0004-only-check-is-check-docs-when-only-docs-changed.patch` - only check is check-docs when only docs changed
- `0005-discord-auto-create-thread-when-sending-to-Forum-Med.patch` - discord: auto-create thread when sending to Forum/Media channels (#12380)
- `0006-docs-fix-broken-links-checker-and-add-CI-docs-13041.patch` - docs: fix broken links checker and add CI docs (#13041)
- `0007-fix-cap-Discord-gateway-reconnect-at-50-attempts-to-.patch` - fix: cap Discord gateway reconnect at 50 attempts to prevent infinite loop (#12230)
- `0008-feat-add-zai-glm-4.6v-image-understanding-support-10.patch` - feat: add zai/glm-4.6v image understanding support (#10267)
- `0009-fix-suggest-clear-in-context-overflow-error-message-.patch` - fix: suggest /clear in context overflow error message (#12973)
- `0010-fix-docs-broken-links-and-improve-link-checker-13056.patch` - fix: docs broken links and improve link checker (#13056)
- `0011-Deduplicate-more.patch` - Deduplicate more
- `0012-improve-pre-commit-hook.patch` - improve pre-commit hook
- `0013-Update-contributing-deduplicate-more-functions.patch` - Update contributing, deduplicate more functions
- `0014-chore-deps-update-dependencies-remove-hono-pinning.patch` - chore(deps): update dependencies, remove hono pinning
- `0015-fix-tools-correct-Grok-response-parsing-for-xAI-Resp.patch` - fix(tools): correct Grok response parsing for xAI Responses API (#13049)
- `0016-Improve-code-analyzer-for-independent-packages-CI-on.patch` - Improve code analyzer for independent packages, CI: only run release-check on push to main
- `0017-fix-memory-default-batch-embeddings-to-off.patch` - fix(memory): default batch embeddings to off
- `0018-refactor-consolidate-fetchWithTimeout-into-shared-ut.patch` - refactor: consolidate fetchWithTimeout into shared utility
- `0019-docs-add-vulnerability-reporting-guidelines-to-CONTR.patch` - docs: add vulnerability reporting guidelines to CONTRIBUTING.md
- `0020-docs-expand-vulnerability-reporting-guidelines-in-SE.patch` - docs: expand vulnerability reporting guidelines in SECURITY.md
- `0021-fix-unify-session-maintenance-and-cron-run-pruning-1.patch` - fix: unify session maintenance and cron run pruning (#13083)
- `0022-Docker-include-A2UI-sources-for-bundle-13114.patch` - Docker: include A2UI sources for bundle (#13114)
- `0023-Chore-add-testflight-auto-response.patch` - Chore: add testflight auto-response
- `0024-fix-ui-prioritize-displayName-over-label-in-webchat-.patch` - fix(ui): prioritize displayName over label in webchat session picker (#13108)
- `0025-fix-signal-enforce-mention-gating-for-group-messages.patch` - fix(signal): enforce mention gating for group messages (#13124)
- `0026-feat-compaction-add-session_compact-tool.patch` - feat(compaction): add session_compact tool
- `0027-feat-cli-add-plugins-uninstall-command.patch` - feat(cli): add plugins uninstall command
- `0028-docs-document-session_compact-and-plugins-uninstall.patch` - docs: document session_compact and plugins uninstall
- `0029-fix-compaction-schedule-session_compact-after-turn.patch` - fix(compaction): schedule session_compact after turn
- `0030-fix-compaction-retry-session_compact-on-transient-50.patch` - fix(compaction): retry session_compact on transient 503
- `0031-fix-pass-agentId-directly-to-session_compact-tool-to.patch` - fix: pass agentId directly to session_compact tool to fix store lookup for subagent sessions
- `0032-fix-normalize-message-content-before-compaction-to-p.patch` - fix: normalize message content before compaction to prevent filter crash
- `0033-feat-tools-add-safe_call-wrapper-for-bounded-tool-ou.patch` - feat(tools): add safe_call wrapper for bounded tool output
- `0034-docs-openclaw-patch-add-safe_call-reports-and-README.patch` - docs(openclaw-patch): add safe_call reports and README notes
- `0035-docs-openclaw-patch-finalize-report-files.patch` - docs(openclaw-patch): finalize report files
- `0036-docs-openclaw-patch-update-publish-status-notes.patch` - docs(openclaw-patch): update publish status notes
- `0037-fix-tools-harden-safe_call-based-on-code-review-feed.patch` - fix(tools): harden safe_call based on code review feedback
- `0038-docs-reports-add-stable-release-notes-for-safe_call-.patch` - docs(reports): add stable release notes for safe_call hardening
- `0039-docs-reports-note-fork-branch-sync-for-stable-releas.patch` - docs(reports): note fork branch sync for stable release
- `0040-feat-session_compact-add-keepHead-keepTail-turn-wind.patch` - feat(session_compact): add keepHead/keepTail turn-window compaction
- `0041-fix-let-ctx_safe_call-wrap-provider-read-exec-proces.patch` - fix: let ctx_safe_call wrap provider read/exec/process
- `0042-refactor-agents-unify-ctx_safe_call-tool-naming.patch` - refactor(agents): unify ctx_safe_call tool naming
- `0043-fix-use-direct-ChatType-for-telegram-native-command-.patch` - fix: use direct ChatType for telegram native command routing
- `0044-fix-tools-harden-ctx_safe_call-provider-resolution-a.patch` - fix(tools): harden ctx_safe_call provider resolution and signal propagation
