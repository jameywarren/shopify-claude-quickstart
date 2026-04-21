#!/usr/bin/env bash
# shopify-claude-quickstart — per-client scaffold script
# Usage:
#   ./setup.sh <client-name>
#   ./setup.sh <client-name> --quick                  # use single-file quick brief
#   ./setup.sh <client-name> --from <existing-dir>    # seed brief from another client

set -euo pipefail

CLIENT_NAME="${1:-}"
MODE="full"
SEED_FROM=""

if [[ -z "$CLIENT_NAME" ]]; then
  cat <<EOF
Usage:
  ./setup.sh <client-name>
  ./setup.sh <client-name> --quick
  ./setup.sh <client-name> --from <path-to-existing-client>

Creates a sibling directory with the template, ready to start a Claude Code session.
EOF
  exit 1
fi

shift
while [[ $# -gt 0 ]]; do
  case "$1" in
    --quick)
      MODE="quick"
      shift
      ;;
    --from)
      SEED_FROM="${2:-}"
      if [[ -z "$SEED_FROM" || ! -d "$SEED_FROM" ]]; then
        echo "Error: --from requires a path to an existing client directory" >&2
        exit 1
      fi
      shift 2
      ;;
    *)
      echo "Unknown option: $1" >&2
      exit 1
      ;;
  esac
done

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PARENT_DIR="$(dirname "$SCRIPT_DIR")"
TARGET="$PARENT_DIR/$CLIENT_NAME"

if [[ -e "$TARGET" ]]; then
  echo "Error: $TARGET already exists." >&2
  exit 1
fi

echo "Creating $TARGET..."
cp -R "$SCRIPT_DIR" "$TARGET"
cd "$TARGET"

# Strip template-only files
rm -f setup.sh
rm -rf .git

if [[ "$MODE" == "quick" ]]; then
  rm -rf client-brief client-brief-EXAMPLE
  echo "Quick mode: kept client-brief-QUICK.md only."
else
  rm -f client-brief-QUICK.md
fi

if [[ -n "$SEED_FROM" ]]; then
  if [[ -d "$SEED_FROM/client-brief" ]] && [[ -d "$TARGET/client-brief" ]]; then
    echo "Seeding client-brief/ from $SEED_FROM..."
    cp -R "$SEED_FROM/client-brief"/* "$TARGET/client-brief/"
  fi
  if [[ -f "$SEED_FROM/client-brief-QUICK.md" ]] && [[ -f "$TARGET/client-brief-QUICK.md" ]]; then
    echo "Seeding client-brief-QUICK.md from $SEED_FROM..."
    cp "$SEED_FROM/client-brief-QUICK.md" "$TARGET/client-brief-QUICK.md"
  fi
fi

# Prompt for store handle and prefill CLAUDE.md
read -rp "Store handle (e.g. acme.myshopify.com, leave blank to fill in later): " STORE_HANDLE
if [[ -n "$STORE_HANDLE" ]]; then
  STORE_HANDLE="${STORE_HANDLE%.myshopify.com}.myshopify.com"
  # macOS sed needs -i ''; GNU sed needs -i. Detect.
  if sed --version >/dev/null 2>&1; then
    SED_INPLACE=(-i)
  else
    SED_INPLACE=(-i '')
  fi
  sed "${SED_INPLACE[@]}" "s|_____________________\.myshopify\.com|$STORE_HANDLE|g" CLAUDE.md
fi

git init -q
git add -A >/dev/null
git commit -q -m "Initial commit from shopify-claude-quickstart" || true

echo ""
echo "Done. Next:"
echo "  cd \"$TARGET\""
echo "  claude"
if [[ -n "$STORE_HANDLE" ]]; then
  echo "  /init-store $STORE_HANDLE"
else
  echo "  /init-store <store.myshopify.com>"
fi
if [[ "$MODE" == "quick" ]]; then
  echo "  /brief-quick"
else
  echo "  /brief-interview"
fi
