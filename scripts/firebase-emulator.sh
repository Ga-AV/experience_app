#!/bin/zsh

export JAVA_HOME="/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home"
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

echo "============================================"
echo "Using Java:"
echo "============================================"

"$JAVA_HOME/bin/java" -version

echo ""
echo "============================================"
echo "OBJC_DISABLE_INITIALIZE_FORK_SAFETY:"
echo "$OBJC_DISABLE_INITIALIZE_FORK_SAFETY"
echo "============================================"

echo ""
echo "Starting Firebase Emulator Suite..."
echo ""

firebase emulators:start \
  --import=.firebase-data \
  --export-on-exit=.firebase-data
