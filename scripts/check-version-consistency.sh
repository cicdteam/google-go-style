#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0
# Copyright 2026 Andrei Taranik
#
# Assert the plugin version is identical everywhere it is declared:
#   - plugins/google-go-style/.claude-plugin/plugin.json  (.version)
#   - .claude-plugin/marketplace.json                     (.version, root)
#   - .claude-plugin/marketplace.json                     (.plugins[0].version)
#   - CHANGELOG.md                                         (latest "## [X.Y.Z]" heading)
#
# Exits non-zero on any mismatch. Safe to run locally from anywhere in the repo.
set -euo pipefail

cd "$(dirname "$0")/.."

plugin_json=$(jq -r '.version' plugins/google-go-style/.claude-plugin/plugin.json)
mkt_root=$(jq -r '.version' .claude-plugin/marketplace.json)
mkt_plugin=$(jq -r '.plugins[0].version' .claude-plugin/marketplace.json)
changelog=$(grep -m1 -oE '^## \[[0-9]+\.[0-9]+\.[0-9]+\]' CHANGELOG.md | grep -oE '[0-9]+\.[0-9]+\.[0-9]+')

printf '%-30s %s\n' "plugin.json:" "$plugin_json"
printf '%-30s %s\n' "marketplace.json (root):" "$mkt_root"
printf '%-30s %s\n' "marketplace.json (plugin):" "$mkt_plugin"
printf '%-30s %s\n' "CHANGELOG.md (latest):" "$changelog"

if [[ "$plugin_json" == "$mkt_root" && "$mkt_root" == "$mkt_plugin" && "$mkt_plugin" == "$changelog" ]]; then
  echo "OK: all versions agree ($plugin_json)"
else
  echo "ERROR: version mismatch across manifests / CHANGELOG" >&2
  exit 1
fi
