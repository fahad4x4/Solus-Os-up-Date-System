#!/bin/bash
# A sample Bash script, by Fahad ALGhathbar
# Routine eopkg + Flatpak maintenance for Solus.

set -euo pipefail

line="########################################################"
warnings=0

# Run commands as root: directly when already root, otherwise through sudo.
if [[ $EUID -eq 0 ]]; then
  SUDO=()
else
  if ! command -v sudo > /dev/null 2>&1; then
    echo "Error: run this script as root or install sudo." >&2
    exit 1
  fi
  echo "This script needs root privileges; asking for your sudo password once."
  if ! sudo -v; then
    echo "Error: could not get sudo privileges." >&2
    exit 1
  fi
  SUDO=(sudo)
fi

if ! command -v eopkg > /dev/null 2>&1; then
  echo "Error: eopkg not found. This script is for Solus." >&2
  exit 1
fi

# step "Title" command...  -> stops the script if the command fails
step() {
  local title=$1
  shift
  echo "$title"
  if "${SUDO[@]}" "$@"; then
    echo "OK: $title"
  else
    local rc=$?
    echo "Error: '$title' failed (exit code $rc): $*" >&2
    echo "Stopping. Fix the problem above and run the script again." >&2
    exit "$rc"
  fi
  echo "$line"
}

# optional_step "Title" command...  -> warns and continues if the command fails
optional_step() {
  local title=$1
  shift
  echo "$title"
  if "${SUDO[@]}" "$@"; then
    echo "OK: $title"
  else
    local rc=$?
    echo "Warning: '$title' failed (exit code $rc): $*" >&2
    warnings=$((warnings + 1))
  fi
  echo "$line"
}

# Clear stale locks first so a lock left by an interrupted run cannot block the steps below.
step "Clean" eopkg clean -y
# Finish configuring any packages left half-installed by an interrupted run.
step "Configure-pending" eopkg configure-pending -y
step "Rebuild-db" eopkg rebuild-db -y
# A failed check (e.g. an edited config file) should not stop updates; report it instead.
optional_step "Check" eopkg check -y
step "Update-repo" eopkg update-repo -y
step "Upgrade" eopkg upgrade -y
step "Remove" eopkg rmo -y

if command -v flatpak > /dev/null 2>&1; then
  optional_step "Flatpak Update" flatpak update -y
else
  echo "Flatpak not installed; skipping Flatpak Update."
  echo "$line"
fi

if (( warnings > 0 )); then
  echo "Finished with $warnings warning(s); see the messages above." >&2
  exit 2
fi
echo "All steps completed successfully."
