#!/bin/bash
cat app-configs/vscode/extensions.json | \
  python scripts/helpers/decomment.py | \
  jq .recommendations -c | \
  python scripts/helpers/install-vscode-extensions.py

