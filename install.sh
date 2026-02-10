#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/openclaw/openclaw.git"
BASE_COMMIT="1d46ca3a95c7ff2669cc9c2a231fc460a2a3cbbb"
TARGET_DIR="${1:-openclaw}"

if [ -e "$TARGET_DIR" ]; then
  echo "Target directory already exists: $TARGET_DIR" >&2
  exit 1
fi

git clone "$REPO_URL" "$TARGET_DIR"
cd "$TARGET_DIR"
git checkout "$BASE_COMMIT"

git am ../patches/*.patch

echo "Done. Applied patches on top of $BASE_COMMIT in $TARGET_DIR"
