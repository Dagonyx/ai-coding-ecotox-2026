## Run SSD with EPA Ecotox Knowledgebase data

Use the data output from task #03 stored under `data/ssd_dataset.tsv` as input for your custom Species Sensitivity Distribution (SSD) analysis.

Use your AI assistant planing mode to fabricate a custom analysis plan for your data set. 

Understand the important grouping factors for your data and make sure that when you comput the geometric means of endpoints that the data is correctly grouped. 

Create a custom SSD analysis prompt for this task and store it under a new folder named `analysis`. Specify in your final SSD analysis prompt that your AI agent should create a Rmd or Quarto documentation of your custom analysis within this `analysis` folder. 

Once you have a plan, execute it to generate the interactive SSD report. After the Rmd / qmd file is generated render the it to the final html-report. 