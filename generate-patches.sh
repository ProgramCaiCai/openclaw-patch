#!/usr/bin/env bash
# generate-patches.sh — 从 OpenClaw 仓库重新生成 .patch 文件
# 只替换 patches/ 目录，保留 README.md / AGENTS.md / install.sh 等文件
set -euo pipefail

OPENCLAW_REPO="${OPENCLAW_REPO:-/Users/programcaicai/clawd/projects/openclaw}"
BASE_TAG="${BASE_TAG:-v2026.2.9}"
PATCH_DIR="$(cd "$(dirname "$0")" && pwd)/patches"

# --- 安全检查 ---
if [ ! -d "$OPENCLAW_REPO/.git" ]; then
  echo "❌ OpenClaw repo not found: $OPENCLAW_REPO" >&2
  echo "   Set OPENCLAW_REPO env var to override." >&2
  exit 1
fi

# 获取 base commit
BASE_COMMIT=$(git -C "$OPENCLAW_REPO" rev-parse "$BASE_TAG" 2>/dev/null) || {
  echo "❌ Cannot resolve base tag: $BASE_TAG" >&2
  exit 1
}

# 获取当前分支 HEAD
HEAD_COMMIT=$(git -C "$OPENCLAW_REPO" rev-parse HEAD)
BRANCH=$(git -C "$OPENCLAW_REPO" rev-parse --abbrev-ref HEAD)

echo "📦 Generating patches..."
echo "   Repo:   $OPENCLAW_REPO"
echo "   Branch: $BRANCH ($HEAD_COMMIT)"
echo "   Base:   $BASE_TAG ($BASE_COMMIT)"
echo "   Output: $PATCH_DIR"
echo ""

# --- 只清理 patches/ 目录，不动其他文件 ---
rm -rf "$PATCH_DIR"
mkdir -p "$PATCH_DIR"

# --- 生成 patches ---
PATCH_COUNT=$(git -C "$OPENCLAW_REPO" format-patch \
  "$BASE_COMMIT..HEAD" \
  -o "$PATCH_DIR" | wc -l | tr -d ' ')

if [ "$PATCH_COUNT" -eq 0 ]; then
  echo "⚠️  No patches generated (HEAD == base?)"
  exit 0
fi

echo "✅ Generated $PATCH_COUNT patch(es):"
ls -1 "$PATCH_DIR"/*.patch | while read -r f; do
  echo "   $(basename "$f")"
done

echo ""
echo "Next steps:"
echo "  cd $(dirname "$0")"
echo "  git add patches/"
echo "  git commit -m 'chore: regenerate patches from $BRANCH'"
echo "  git push origin main"
