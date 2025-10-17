#!/usr/bin/env bash
set -euo pipefail
docker run --rm -v "$PWD":/ws -w /ws python:3.11 bash -lc '
export PYTHONPATH=/ws &&
pip install -r app/requirements.txt pytest &&
python -m pytest -q'
