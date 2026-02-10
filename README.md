# openclaw-patch

Personal patch collection for OpenClaw.

## Included patches

- `0001-feat-compaction-add-session_compact-tool.patch` - feat(compaction): add session_compact tool
- `0002-feat-cli-add-plugins-uninstall-command.patch` - feat(cli): add plugins uninstall command
- `0003-docs-document-session_compact-and-plugins-uninstall.patch` - docs: document session_compact and plugins uninstall
- `0004-fix-compaction-schedule-session_compact-after-turn.patch` - fix(compaction): schedule session_compact after turn
- `0005-fix-compaction-retry-session_compact-on-transient-50.patch` - fix(compaction): retry session_compact on transient 503
- `0006-fix-pass-agentId-directly-to-session_compact-tool-to.patch` - fix: pass agentId directly to session_compact tool to
- `0007-fix-normalize-message-content-before-compaction-to-p.patch` - fix: normalize message content before compaction to
- `0008-feat-tools-add-safe_call-wrapper-for-bounded-tool-ou.patch` - feat(tools): add safe_call wrapper for bounded tool
- `0009-docs-openclaw-patch-add-safe_call-reports-and-README.patch` - docs(openclaw-patch): add safe_call reports and README
- `0010-docs-openclaw-patch-finalize-report-files.patch` - docs(openclaw-patch): finalize report files
- `0011-docs-openclaw-patch-update-publish-status-notes.patch` - docs(openclaw-patch): update publish status notes
- `0012-fix-tools-harden-safe_call-based-on-code-review-feed.patch` - fix(tools): harden safe_call based on code review

## Apply patches

```bash
cd openclaw && git am /path/to/*.patch
```

## Base OpenClaw commit

- Branch compared: `main..fix/compact-content-normalize`
- Base commit: `1d46ca3a95c7ff2669cc9c2a231fc460a2a3cbbb`
- Base commit message: `fix(signal): enforce mention gating for group messages (#13124)`
