#!/usr/bin/env bash
# Run the pipeline in order. Parts that need an LLM are skipped when no key is set.
#
#   ./run_all.sh                       # offline stages only if no key is exported
#   OPENAI_API_KEY=... ./run_all.sh    # also runs Open Coscientist and OpenEvolve
set -euo pipefail
cd "$(dirname "$0")/../.."

if [ -n "${OPENAI_API_KEY:-}" ]; then
  model="gpt-4.1-mini"; config="lessons/scripts/02_openevolve/config.openai.yaml"
elif [ -n "${ANTHROPIC_API_KEY:-}" ]; then
  model="anthropic/claude-haiku-4-5-20251001"; config="lessons/scripts/02_openevolve/config.anthropic.yaml"
elif [ -n "${GEMINI_API_KEY:-}" ]; then
  model="gemini/gemini-2.5-flash"; config="lessons/scripts/02_openevolve/config.yaml"
else
  model=""; config=""
fi

echo "== Data: noisy, disguised observations"
uv run python data/make_dataset.py

if [ -n "$model" ]; then
  echo "== Part 1: Open Coscientist ($model)"
  uv run python lessons/scripts/01_hypotheses/run_coscientist.py --model "$model" \
    || echo "Part 1 failed (rate limit?). Continuing."
  echo "== Part 2: OpenEvolve"
  uv run openevolve-run lessons/scripts/02_openevolve/initial_program.py lessons/scripts/02_openevolve/evaluator.py \
    --config "$config" --iterations 30 --log-level WARNING \
    || echo "Part 2 failed (rate limit?). Continuing."
else
  echo "== Part 1: skipped, no API key (see lessons/scripts/01_hypotheses/prompts.md for the by-hand route)"
  echo "== Part 2: no API key, running the offline evolution instead"
  uv run python lessons/scripts/02_openevolve/mini_evolve.py
fi

echo "== Part 3: hypothesis tests and reveal"
uv run python lessons/scripts/03_tests/hypothesis_tests.py

echo "== Part 4: pseudo-paper (template version; see lessons/scripts/04_paper/goal.md for OpenScience)"
uv run python lessons/scripts/04_paper/make_paper.py
