#!/usr/bin/env bash
#
# CNC One-Line Installer Entrypoint
# Usage:
#   curl -sSL https://raw.githubusercontent.com/rel7z/cnc/main/bin/install.sh | bash
#   or: ./bin/install.sh
#

set -e

# Ensure Python 3 is installed
if ! command -v python3 &>/dev/null; then
  echo "[i] Python 3 is required. Attempting installation..."
  if command -v apt-get &>/dev/null; then
    sudo apt-get update -y && sudo apt-get install -y python3
  elif command -v yum &>/dev/null; then
    sudo yum install -y python3
  else
    echo "[!] Please install Python 3 and re-run this script."
    exit 1
  fi
fi

# Locate installer script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALLER_PY="${SCRIPT_DIR}/install.py"

if [ ! -f "$INSTALLER_PY" ]; then
  # Download temporarily if running via pipe/curl
  TMP_PY=$(mktemp /tmp/cnc_install_XXXXXX.py)
  echo "[i] Downloading installer script..."
  curl -sSL https://raw.githubusercontent.com/rel7z/cnc/main/bin/install.py -o "$TMP_PY"
  python3 "$TMP_PY" "$@"
  rm -f "$TMP_PY"
else
  python3 "$INSTALLER_PY" "$@"
fi
