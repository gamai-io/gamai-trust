#!/usr/bin/env bash
# One command, no network, no keys: unit tests + all three component demos.
set -euo pipefail
cd "$(dirname "$0")"
python3 -m unittest discover -s tests -v
python3 -m gamai_trust.cli demo > /tmp/gamai_trust_demo.json
python3 - <<'PY'
import json
d = json.load(open("/tmp/gamai_trust_demo.json"))
assert d["proofgate"]["counts"] == {"confirmed": 10, "refuted": 2, "unverified": 0}, d
assert d["immunity"]["passed"] == 18, d
assert d["crossnode"]["false_success"] == 2, d
print("demo invariants ok")
PY
