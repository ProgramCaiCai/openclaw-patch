# openclaw-patch

Custom personal patch set for OpenClaw.

- Base release tag: `v2026.2.9`
- Base release commit: `33c75cb6bf2dde53131f33a1ea4995e1aa8d550e`
- Patch count: `12`

## Commit list (`patches/clean`)

1. `6f410ceff` feat(compaction): add session_compact tool
2. `42c8c2888` feat(cli): add plugins uninstall command
3. `0e00335a9` docs: document session_compact and plugins uninstall
4. `b425c8390` fix(compaction): schedule session_compact after turn
5. `24845743e` fix(compaction): retry session_compact on transient 503
6. `f822d995f` fix: pass agentId directly to session_compact tool to fix store lookup for subagent sessions
7. `c23ba281c` fix: normalize message content before compaction to prevent filter crash
8. `9513e9c01` feat(tools): add safe_call wrapper for bounded tool output
9. `50266fd5a` fix(tools): harden safe_call based on code review feedback
10. `5dbbf4512` feat(tools): add filter command support to safe_call
11. `87941f989` refactor(tools): rename safe_call to ctx_safe_call for context-safety clarity
12. `ec9598c1e` feat(session_compact): add keepHead/keepTail turn-window compaction

## Patch list (12)

1. `0001-feat-compaction-add-session_compact-tool.patch`
2. `0002-feat-cli-add-plugins-uninstall-command.patch`
3. `0003-docs-document-session_compact-and-plugins-uninstall.patch`
4. `0004-fix-compaction-schedule-session_compact-after-turn.patch`
5. `0005-fix-compaction-retry-session_compact-on-transient-50.patch`
6. `0006-fix-pass-agentId-directly-to-session_compact-tool-to.patch`
7. `0007-fix-normalize-message-content-before-compaction-to-p.patch`
8. `0008-feat-tools-add-safe_call-wrapper-for-bounded-tool-ou.patch`
9. `0009-fix-tools-harden-safe_call-based-on-code-review-feed.patch`
10. `0010-feat-tools-add-filter-command-support-to-safe_call.patch`
11. `0011-refactor-tools-rename-safe_call-to-ctx_safe_call-for.patch`
12. `0012-feat-session_compact-add-keepHead-keepTail-turn-wind.patch`

## Install

```bash
chmod +x install.sh
./install.sh
```

Or apply manually:

```bash
git clone https://github.com/openclaw/openclaw.git
cd openclaw
git checkout 33c75cb6bf2dde53131f33a1ea4995e1aa8d550e
git am /path/to/openclaw-patch/*.patch
```
