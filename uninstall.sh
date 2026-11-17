#!/bin/bash
# Removes Linguine completely and hands charging back to macOS.
set -e
[ "$EUID" -eq 0 ] || { echo "Run this with sudo."; exit 1; }
USER_NAME="${SUDO_USER:-$USER}"
USER_UID="${SUDO_UID:-$(id -u "$USER_NAME")}"
USER_HOME="$(dscl . -read /Users/"$USER_NAME" NFSHomeDirectory | awk '{print $2}')"

# Clear both switches before removing the only thing that can clear them.
if [ -S /var/run/linguine.sock ]; then
  printf 'write CHIE 00\n' | nc -U /var/run/linguine.sock >/dev/null 2>&1 || true
  printf 'write CHTE 00000000\n' | nc -U /var/run/linguine.sock >/dev/null 2>&1 || true
  echo "Charging handed back to macOS."
fi

sudo -u "$USER_NAME" launchctl bootout "gui/$USER_UID/com.linguine.app" 2>/dev/null || true
launchctl bootout system/com.linguine.daemon 2>/dev/null || true
rm -f /Library/LaunchDaemons/com.linguine.daemon.plist /usr/local/libexec/linguined
rm -f "$USER_HOME/Library/LaunchAgents/com.linguine.app.plist"
rm -rf /Applications/Linguine.app "$USER_HOME/Applications/Linguine.app"
rm -f "$USER_HOME/Library/Preferences/com.linguine.app.plist"
rm -f "$USER_HOME/Library/Logs/Linguine-sleep.log"
echo "Linguine removed."
