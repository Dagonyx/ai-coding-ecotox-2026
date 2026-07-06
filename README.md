# ai-coding-ecotox-2026

A training sandbox for environmental scientists and ecotoxicologists learning to
code with the help of agentic AI coding assistants (e.g. GitHub Copilot in
Positron or RStudio).

The workshop pairs domain topics from ecotoxicology — dose-response modelling and
Species Sensitivity Distributions (SSDs) — with hands-on, AI-assisted R
development and reproducible reporting in R Markdown and Quarto.

## Student tasks

Students find their exercises in the [`student_tasks/`](student_tasks/) folder.
The tasks build on one another and progress from a gentle warmup to a full SSD
analysis:

| Task | File | Focus | Difficulty | Approx. time |
|------|------|-------|------------|--------------|
| 00 | [00_translate_to_quarto.md](student_tasks/00_translate_to_quarto.md) | Warm up with agentic coding by translating an `.Rmd` report into Quarto (`.qmd`) and comparing the rendered outputs. | Warmup | 15–30 min |
| 01 | [01_dose-response-analysis.md](student_tasks/01_dose-response-analysis.md) | Explore the `drc` package datasets, fit and select dose-response models with `mselect()`, and estimate EC/LC values in a report. | Beginner–Intermediate | 45–90 min |
| 02 | [02_practice_standartox.md](student_tasks/02_practice_standartox.md) | Get to know the standartox interface to the EPA ECOTOX Knowledgebase by working through the example workflow. | Beginner (code-along) | 30–45 min |
| 03 | [03_filter_stxquery_for_ssd.md](student_tasks/03_filter_stxquery_for_ssd.md) | Query and filter standartox to curate an SSD-ready dataset, pick a well-covered compound, and export it as TSV. | Intermediate | 45–60 min |
| 04 | [04_run_ssd.md](student_tasks/04_run_ssd.md) | Design an analysis plan and run a full SSD on the curated dataset, producing a rendered HTML report. | Intermediate–Advanced | 60–120 min |

Work through them in order — tasks 03 and 04 depend on the dataset produced
earlier.

## Getting started

1. **Clone the repository** and open it in Positron or RStudio.
2. **Install dependencies** by sourcing the setup script, which installs the
   required CRAN packages and the GitHub-only packages [standartox](https://github.com/andschar/standartox)
   (`andschar/standartox`) and [drc](https://github.com/hreinwald/drc) (`hreinwald/drc`):

   ```r
   source("R/install_dependencies.R")
   ```
3. **Configure Git and your AI assistant** (e.g. GitHub Copilot) in your IDE so
   you can use its chat and agentic/planning modes throughout the tasks.

## AI assistant tips

The tasks are designed to be done with an AI coding assistant. A few habits that
make it more effective:

- **Use planning mode first.** Before letting the agent make changes, ask it to
  outline a plan (which files it will touch, what it will produce). This is
  especially helpful for the more open-ended tasks 03 and 04, where you design
  the analysis before executing it.
- **Point the AI to context.** Tell it explicitly where files live and where to
  save output, and reference the JSON files in [`llm_context/`](llm_context/)
  (e.g. `standartox_data_dictionary.json`) so it understands the data structure.
- **Use `Fix` and `Explain`.** When a code chunk errors, use the assistant's
  `Fix` or `Explain` actions rather than debugging blind.
- **Stay in the loop.** Inspect data objects yourself (the `SESSION` pane) and
  apply your own domain judgment — treat the AI's output as a draft to verify.

### Useful IDE shortcuts

| Shortcut | Action |
|----------|--------|
| `Ctrl + Enter` | Run the current line or selection in the console. |
| `Ctrl + Shift + I` | Insert a new code chunk in an `.Rmd`/`.qmd` document. |
| `Ctrl + #` | Comment or uncomment the selected line(s). |

## Repository layout

| Path | Contents |
|------|----------|
| [`student_tasks/`](student_tasks/) | The workshop exercises (start here). |
| [`R/`](R/) | Utility scripts: dependency installer, standartox filtering, and custom plotting functions. |
| [`Rmd/`](Rmd/) | R Markdown reference workflows for dose-response, standartox exploration, and SSD. |
| [`qmd/`](qmd/) | Quarto versions of the example workflows. |
| [`data/`](data/) | Input/output datasets, including `ssd_dataset.tsv` and `tax_family_counts.tsv`. |
| [`analysis/`](analysis/) | Analysis prompts and specifications for the SSD task. |
| [`llm_context/`](llm_context/) | JSON context files (data dictionary and SSD grouping factors) for AI-assisted analysis. |
| [`llm_tasks/`](llm_tasks/) | Prompt specifications for generating context files and translating formats. |
| [`standartox_db/`](standartox_db/) | Local copy of the standartox database. |
| [`img/`](img/) | Image assets used in the workshop materials. |

## Key packages

- **standartox** — interface to the EPA ECOTOX Knowledgebase.
- **drc** — dose-response curve fitting and model selection.
- **ssdtools** — Species Sensitivity Distribution fitting.
- **dplyr**, **data.table**, **ggplot2**, **ggpubr** — data wrangling and plotting.
- **DT**, **plotly**, **kableExtra**, **patchwork** — interactive tables, plots, and reporting.

## License

Released under the [MIT License](LICENSE).
