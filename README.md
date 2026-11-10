# D-Lab AI Co-Scientist Workshop

[![DataHub](https://img.shields.io/badge/launch-datahub-blue)](https://dlab.datahub.berkeley.edu/hub/user-redirect/git-pull?repo=https%3A%2F%2Fgithub.com%2Fdlab-berkeley%2FAI-Science-Coscientist&urlpath=lab%2Ftree%2FAI-Science-Coscientist%2F&branch=main)
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/dlab-berkeley/AI-Science-Coscientist/main?urlpath=lab)
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)

This repository contains the materials for D-Lab AI Co-Scientist workshop. 

## Prerequisites
We recommend attending [Python Fundamentals](https://github.com/dlab-berkeley/Python-Fundamentals) prior to this workshop.

Check out D-Lab’s [Workshop Catalog](https://dlab-berkeley.github.io/dlab-workshops/) to browse all workshops, see what’s running now, and review prerequisites.

## Workshop Goals

In this workshop, we provide a hands-on introduction to doing research with
AI co-scientists: AI tools that propose hypotheses, search for evidence, and
write up results. First, we’ll cover how agents generate and rank hypotheses
about a blind, noisy dataset, and how an evaluator lets evolution search for a
formula that predicts groups it has never seen. Then, we’ll explore how to
test those hypotheses with plain statistics, and how to audit a paper written
by an AI agent. All materials run without a paid AI plan.

_Only if necessary:_ If you are not familiar with material in
[Python Fundamentals](https://github.com/dlab-berkeley/Python-Fundamentals),
we recommend attending that workshop first.

## Learning Objectives

After this workshop, you will be able to:

- Describe the stages of an AI-assisted research workflow, and which AI tool fits each one.
- Explain why data are disguised before an AI model sees them.
- Explain why an evaluator must score hypotheses on held-out data, and spot one that leaks.
- Compare competing hypotheses and estimate their uncertainty with the bootstrap.
- Audit an AI-written paper claim by claim against the results.

This workshop does not cover the following:

- How the neural networks behind large language models work. These are covered in [Python Deep Learning](https://github.com/dlab-berkeley/Python-Deep-Learning).
- Machine learning methods in depth. These are covered in [Python Machine Learning](https://github.com/dlab-berkeley/Python-Machine-Learning).


## Installation Instructions

We will use Python to go through the workshop materials, which requires installation of [uv](https://docs.astral.sh/uv/), a Python package manager. Complete the following steps:

1. Install uv by following the [uv installation instructions](https://docs.astral.sh/uv/getting-started/installation/). On macOS or Linux, open a terminal and enter `curl -LsSf https://astral.sh/uv/install.sh | sh`.
2. Download these workshop materials:
    * Click the green "Code" button in the top right of the repository information.
    * Click "Download Zip".
    * Extract this file to a folder on your computer where you can easily access it (we recommend Desktop).
3. Optional: if you’re familiar with git, you can instead clone this repository by opening a terminal and entering `git clone https://github.com/dlab-berkeley/AI-Science-Coscientist.git`.
4. Open a terminal in the workshop folder and enter `uv sync`. This installs Python and every package the workshop needs.

## Is Python not Working on Your Computer?

If you do not have Python installed and the materials loaded on your
workshop by the time it starts, we *strongly* recommend using the UC Berkeley
Datahub to run the materials for these lessons. You can access the DataHub by
clicking the following button:

[![DataHub](https://img.shields.io/badge/launch-datahub-blue)](https://dlab.datahub.berkeley.edu/hub/user-redirect/git-pull?repo=https%3A%2F%2Fgithub.com%2Fdlab-berkeley%2FAI-Science-Coscientist&urlpath=lab%2Ftree%2FAI-Science-Coscientist%2F&branch=main)

The DataHub downloads this repository, along with any necessary packages, and
allows you to run the materials in a JupyterLab instance on UC Berkeley's servers.
No installation is necessary from your end - you only need an internet browser
and a CalNet ID to log in. By using the DataHub, you can save your work and come
back to it at any time. When you want to return to your saved work, just go
straight to the [D-Lab DataHub](https://dlab.datahub.berkeley.edu), sign in, and
you click on the `AI-Science-Coscientist` folder.

If you don't have a Berkeley CalNet ID, you can still run these lessons in the cloud, by clicking this button:

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/dlab-berkeley/AI-Science-Coscientist/main?urlpath=lab)

By using this button, however, you cannot save your work.


## Run the Code

Now that you have all the required software and materials, you need to run the code:

1. Open a terminal in the workshop folder and enter `uv run jupyter lab`. JupyterLab opens in your browser.
2. In the file browser on the left, open the `lessons` folder and click `1_Blind_Data_and_Hypotheses.ipynb`.
3. Work through the four notebooks in `lessons` in order. Solutions to the challenges are in `solutions`.

To run a cell, click on it and press `Shift + Enter`, or click the `Run` button
in the toolbar. Run the cells from top to bottom: later cells use what earlier
cells create.

Every notebook runs without an API key. To also run the AI tools themselves,
and for the results of our own test runs, see [`lessons/README.md`](lessons/README.md).

# Additional Resources

Check out the following resources to learn more about AI co-scientists:

* [Towards an AI co-scientist](https://research.google/blog/accelerating-scientific-breakthroughs-with-an-ai-co-scientist/): _Google's multi-agent system that Part 1 is modeled on._
* [AlphaEvolve](https://deepmind.google/discover/blog/alphaevolve-a-gemini-powered-coding-agent-for-designing-advanced-algorithms/): _DeepMind's evolutionary coding agent, which OpenEvolve reimplements in Part 2._
* [Open Coscientist](https://github.com/jataware/open-coscientist), [OpenEvolve](https://github.com/algorithmicsuperintelligence/openevolve) and [OpenScience](https://github.com/synthetic-sciences/openscience): _the open-source tools used in this workshop._


# About the UC Berkeley D-Lab

D-Lab works with Berkeley faculty, research staff, and students to advance data-intensive social science and humanities research. Our goal at D-Lab is to provide practical training, staff support, resources, and space to enable you to use Python for your own research applications. Our services cater to all skill levels and no programming, statistical, or computer science backgrounds are necessary. We offer these services in the form of workshops, one-to-one consulting, and working groups that cover a variety of research topics, digital tools, and programming languages.  

Visit the [D-Lab homepage](https://dlab.berkeley.edu/) to learn more about us. You can view our [calendar](https://dlab.berkeley.edu/events/calendar) for upcoming events, learn about how to utilize our [consulting](https://dlab.berkeley.edu/consulting) and [data](https://dlab.berkeley.edu/data) services, and check out upcoming [workshops](https://dlab.berkeley.edu/events/workshops).

# Other D-Lab Python Workshops

Here are other Python workshops offered by the D-Lab:

## Basic Competency

* [Python Fundamentals](https://github.com/dlab-berkeley/Python-Fundamentals)
* [Python Data Wrangling and Manipulation with Pandas](https://github.com/dlab-berkeley/Python-Data-Wrangling)
* [Python Data Visualization](https://github.com/dlab-berkeley/Python-Data-Visualization)

## Intermediate/Advanced Competency

* [Python Machine Learning](https://github.com/dlab-berkeley/Python-Machine-Learning)
* [Python Text Analysis](https://github.com/dlab-berkeley/Python-Text-Analysis)

# Contributors

* Kurt Soncco
