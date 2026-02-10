# openclaw-patch

Custom personal patch set for OpenClaw.

Base version: `v2026.2.9`

## Patch list (11)

1. `0001-feat-compaction-add-session_compact-tool.patch`
2. `0002-feat-cli-add-plugins-uninstall-command.patch`
3. `0003-docs-document-session_compact-and-plugins-uninstall.patch`
4. `0004-fix-compaction-schedule-session_compact-after-turn.patch`
5. `0005-fix-compaction-retry-session_compact-on-transient-50.patch`
6. `0006-fix-pass-agentId-directly-to-session_compact-tool-to.patch`
7. `0007-fix-normalize-message-content-before-compaction-to-p.patch`
8. `0008-feat-tools-add-ctx_safe_call-wrapper-for-bounded-tool-ou.patch`
9. `0009-fix-tools-harden-ctx_safe_call-based-on-code-review-feed.patch`
10. `0010-feat-tools-add-filter-command-support-to-ctx_safe_call.patch`
11. `0011-refactor-tools-rename-ctx_safe_call-for-context-safety-clarity.patch`

## Install

```bash
chmod +x install.sh
./install.sh
```

Or apply manually:

```bash
git clone https://github.com/openclaw/openclaw.git
cd openclaw
git checkout v2026.2.9
git am ../*.patch
```
