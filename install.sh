#!/usr/bin/env bash
set -e

BIN_NAME="seamless-glance"
INSTALL_DIR="/usr/local/bin"

OS="$(uname -s)"
ARCH="$(uname -m)"

if [[ "$OS" == "Darwin" && "$ARCH" == "arm64" ]]; then
  FILE="seamless-glance-0.1.0-beta.8-aarch64-apple-darwin"
elif [[ "$OS" == "Darwin" ]]; then
  FILE="seamless-glance-0.1.0-beta.8-x86_64-apple-darwin"
elif [[ "$OS" == "Linux" ]]; then
  FILE="seamless-glance-0.1.0-beta.8-x86_64-unknown-linux-gnu"
else
  echo "Unsupported platform"
  exit 1
fi

URL="https://github.com/fellscode/seamless-glance-distro/releases/download/v0.1.0-beta.8/$FILE"

echo "Downloading Seamless Glance..."
curl -fsSL "$URL" -o "$BIN_NAME"

chmod +x "$BIN_NAME"
sudo mv "$BIN_NAME" "$INSTALL_DIR/$BIN_NAME"

echo ""
echo "✅ Seamless Glance installed successfully"
echo ""
echo "Next steps:"
echo "  1. Place your license at ~/.seamless-glance/license.json"
echo "  2. Run: seamless-glance"
