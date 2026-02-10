#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/openclaw/openclaw.git"
BASE_TAG="v2026.2.9"
TARGET_DIR="${1:-openclaw}"

if [ -e "$TARGET_DIR" ]; then
  echo "Target directory already exists: $TARGET_DIR" >&2
  exit 1
fi

git clone "$REPO_URL" "$TARGET_DIR"
cd "$TARGET_DIR"
git checkout "$BASE_TAG"

git am ../*.patch

echo "Done. Applied patches on top of $BASE_TAG in $TARGET_DIR"
