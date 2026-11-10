# Lessons

Work through the notebooks in order. Solutions to the challenges are in
[`../solutions`](../solutions).

| Notebook | Question | AI tool | No-key fallback |
| --- | --- | --- | --- |
| [`1_Blind_Data_and_Hypotheses`](1_Blind_Data_and_Hypotheses.ipynb) | What could the law be? | [Open Coscientist](https://github.com/jataware/open-coscientist) | Prompts by hand in a chat app |
| [`2_Evolving_a_Formula`](2_Evolving_a_Formula.ipynb) | Which formula predicts unseen groups? | [OpenEvolve](https://github.com/algorithmicsuperintelligence/openevolve) | `mini_evolve.py` |
| [`3_Testing_Hypotheses`](3_Testing_Hypotheses.ipynb) | Is the evidence strong enough? | None: plain statistics | Always offline |
| [`4_Writing_and_Auditing_the_Paper`](4_Writing_and_Auditing_the_Paper.ipynb) | How does it compare with the literature? | [OpenScience](https://github.com/synthetic-sciences/openscience) | `make_paper.py` |

The task: given 29 noisy measurements of three unnamed quantities (`x1`, `x2`,
`y`), find the law that links them and show that it holds for groups it never
saw. Names are hidden, units are scrambled and noise is added, so the law must
be fitted, not recited from memory. Part 3 opens the key: the data are real
orbits, and the law is Kepler's third law with Newton's mass term,
`T = 2π √(a³ / GM)`.

## Folder Layout

```
lessons/
  1_ ... 4_*.ipynb   the workshop notebooks
  scripts/           the code the notebooks call
    01_hypotheses/   run_coscientist.py, prompts.md
    02_openevolve/   initial_program.py, evaluator.py, config*.yaml, mini_evolve.py
    03_tests/        hypothesis_tests.py
    04_paper/        goal.md (OpenScience), make_paper.py
    run_all.sh       every step in order, from the command line
  paper/             example papers and the audit of the AI-written one
  results/           written by Part 3 (not committed)
data/
  orbits.csv         the real orbits
  make_dataset.py    disguises them as observations.csv, the only file the AI sees
  key.json, reveal.py  how to undo the disguise, used only at the reveal
  literature/        Galileo 1610, Kepler 1619, Newton 1687: citations and quotations
```

To run every step without notebooks, from the repo root:

```bash
./lessons/scripts/run_all.sh
```

It writes the results to `lessons/results/` and a paper to
`lessons/paper/report.md`, and also runs the AI tools if a key is exported.

## Running the AI Tools

Every notebook runs without a key. With one, the demo cells also run the AI
tools. Export the key before you start Jupyter:

| Provider | Key variable | Part 1 `--model` | Part 2 `--config` |
| --- | --- | --- | --- |
| Gemini (free tier) | `GEMINI_API_KEY` | `gemini/gemini-2.5-flash` | `scripts/02_openevolve/config.yaml` |
| OpenAI (paid) | `OPENAI_API_KEY` | `gpt-4.1-mini` | `scripts/02_openevolve/config.openai.yaml` |
| Anthropic (paid) | `ANTHROPIC_API_KEY` | `anthropic/claude-haiku-4-5-20251001` | `scripts/02_openevolve/config.anthropic.yaml` |

Only OpenAI has been tested so far. Never commit a key. OpenScience (Part 4)
is a Node.js tool: see [`scripts/04_paper/goal.md`](scripts/04_paper/goal.md).

## Results

From Part 3, on the committed data:

| Hypothesis | Formula | Held-out error (dex) |
| --- | --- | --- |
| H1 | `y = c * x1` | 0.245 |
| H2 | `y = c * x1^p` (Kepler's form, no mass) | 0.293 |
| H3 | `y = c * x1^p * x2^q` | 0.037 |
| H4 | `y = c * x1^(3/2) * x2^(-1/2)` (Newton's form) | 0.036 |

- **Exponents:** p = 1.506 and q = −0.507. Their 95% intervals contain 3/2
  and −1/2.
- **Mass matters:** p = 1.3e-09 on a test with one point per group.
- **G:** 7.256e-11, which is 8.7% above the accepted 6.674e-11.
- **A lesson in uncertainty:** the interval for G from resampling rows,
  [6.899e-11, 7.630e-11], misses the accepted value. Resampling whole groups
  gives [6.591e-11, 7.892e-11], which contains it. Rows that share one mass
  estimate are not independent.

![Predicted against observed y, without and with x2](../images/fig_pred_vs_obs.png)

## What the AI Tools Did in Our Test Runs

One run each, with an OpenAI key.

| Part | Model | Outcome |
| --- | --- | --- |
| 1. Open Coscientist | `gpt-4.1-mini` | Completed in 96 s. Its top-ranked hypotheses were elaborate power laws with the wrong sign on the `x2` exponent (+0.5; the data say −0.5). |
| 2. OpenEvolve | `gpt-4o-mini` | Score rose from 0.803 to 0.964: a least-squares power law fitted from the data, as good as H3. Only 10 of 30 iterations ran because of a rate limit. |
| 4. OpenScience | `gpt-4.1-mini` | Wrote a full paper in 40 s. Tables were correct, but it had six errors, including the headline one. Audit in [`paper/README.md`](paper/README.md). |

The pattern is the point of the workshop: debate ranked a wrong hypothesis
first, the held-out score found the right one, and the fluent write-up still
needed checking line by line.

## Troubleshooting

| Symptom | Fix |
| --- | --- |
| `uv: command not found` | Install uv: `curl -LsSf https://astral.sh/uv/install.sh \| sh` |
| HTTP 429, "requests per day" | Rate limit. New OpenAI accounts can be capped at 50 requests a day per model. Wait, switch model, or use the fallback. |
| HTTP 429, "no credits remaining" | Add credits on the provider's billing page. |
| Anthropic 400, "not scoped to a workspace" | Create the key inside a workspace in the Anthropic Console. |
| `ImportError` from `mcp` | Install with `uv sync`, which pins `mcp<2`. |

## Sources and Licences

- `data/orbits.csv`: NASA planetary and satellite fact sheets. Every row
  agrees with Kepler's law to within 1%.
- `data/literature/`: public-domain editions, linked there.
- Open Coscientist: MIT with Commons Clause. OpenEvolve and OpenScience:
  Apache 2.0.
