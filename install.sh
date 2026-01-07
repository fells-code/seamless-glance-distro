#!/usr/bin/env bash
# Seamless Glance installer
# https://seamlessglance.com
set -e

BIN_NAME="seamless-glance"
VERSION="0.1.0-beta.13"
REPO="fells-code/seamless-glance-distro"
INSTALL_DIR="/usr/local/bin"

OS="$(uname -s)"
ARCH="$(uname -m)"

if [[ "$OS" == "Darwin" && "$ARCH" == "arm64" ]]; then
  FILE="$BIN_NAME-$VERSION-aarch64-apple-darwin"
elif [[ "$OS" == "Darwin" ]]; then
  FILE="$BIN_NAME-$VERSION-x86_64-apple-darwin"
elif [[ "$OS" == "Linux" ]]; then
  FILE="$BIN_NAME-$VERSION-x86_64-unknown-linux-gnu"
else
  echo "❌ Unsupported platform: $OS / $ARCH"
  exit 1
fi

URL="https://github.com/$REPO/releases/download/v$VERSION/$FILE"
CHECKSUM_URL="https://github.com/$REPO/releases/download/v$VERSION/SHA256SUMS.txt"

echo "⬇️  Downloading Seamless Glance ($VERSION)..."
curl -fsSL "$URL" -o "$FILE"

# Verify checksum if available
if curl -fsSL "$CHECKSUM_URL" -o SHA256SUMS.txt 2>/dev/null; then
  echo "🔐 Verifying checksum..."
  grep "$FILE" SHA256SUMS.txt | shasum -a 256 -c -
  rm SHA256SUMS.txt
else
  echo "⚠️  Checksum file not found, skipping verification"
fi

chmod +x "$FILE"
mv "$FILE" "$BIN_NAME"

# Install location handling
if [[ -w "$INSTALL_DIR" ]]; then
  mv "$BIN_NAME" "$INSTALL_DIR/$BIN_NAME"
elif command -v sudo >/dev/null; then
  sudo mv "$BIN_NAME" "$INSTALL_DIR/$BIN_NAME"
else
  INSTALL_DIR="$HOME/.local/bin"
  mkdir -p "$INSTALL_DIR"
  mv "$BIN_NAME" "$INSTALL_DIR/$BIN_NAME"
  echo "⚠️  Installed to $INSTALL_DIR (add to PATH if needed)"
fi

echo ""
echo "✅ Seamless Glance installed successfully"
echo ""
echo "Next steps:"
echo "  1. Place your license at ~/.seamless-glance/license.json"
echo "  2. Run: seamless-glance"
