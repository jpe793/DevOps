#!/usr/bin/env bash
set -euo pipefail

if [[ -n "${WORKSPACE:-}" ]]; then
  docker run --rm \
    -v jenkins_home:/var/jenkins_home:ro \
    -w "${WORKSPACE}" \
    python:3.11 bash -lc '
      export PYTHONPATH=$PWD &&
      pip install -r app/requirements.txt pytest &&
      python -m pytest -q'
else
  docker run --rm \
    -v "$PWD":/ws \
    -w /ws \
    python:3.11 bash -lc '
      export PYTHONPATH=/ws &&
      pip install -r app/requirements.txt pytest &&
      python -m pytest -q'
fi
