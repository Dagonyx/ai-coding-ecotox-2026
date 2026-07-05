## Dose Response Analysis with AI

### Outcome

Generate a dose-response analysis report in R Markdown. If you have Quarto installed feel free to do that directly in Quarto Markdown.

Use the github copilot coding agent in your IDE to conduct the following tasks and generate the Rmd (or Qmd) script.

Use the IDE chat to ask any question no matter how silly it might sound. The AI will be able to assist you. However, make sure to also use your own judgment and understanding of the data and analysis methods and inspect the data objects yourself. (Right window under `SESSION`)

### Tasks

1. Inspect the various data sets provided by the `drc` package. Visit the documentation here: [drc dataset documentation](https://hreinwald.github.io/drc/reference/index.html#datasets)

2. Choose a data set you wish to work with. **NOTE:** Some datasets are more complex than others. Make sure to understand the structure of the data before you proceed to dose-response modelling. If a data set contains multiple measure timepoints or compounds make sure to consider this in your downstream analysis. 

3. Perform dose-response modelling using the chosen data set. Use the `drc` package to select the best fitting model type (use `mselect()` for model comparison) to your data and fit a dose-response model to estimate the EC10, EC20 and EC50 (or LC respectively).

4. Generate a dose-response analysis report in R Markdown or Quarto Markdown, including your model selection process, fitted model, and estimated EC/LC values.

**HINT:** Use the [dose-response-workflow.Rmd](./Rmd/dose-response-workflow.Rmd) as a potential reference for you and your AI agent. 

