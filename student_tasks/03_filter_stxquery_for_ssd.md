## Prepare data set for SSD analysis 

Before we can dive into an SSD we first must pick a compound for which we wish to run the SSD analysis. It make sense to pick one for which we have a good taxonomic coverage in the standartox data base (EPA Ecotox Knowledgebase). 

Use your AI assistant to build a very basic R script to perform the subsequent tasks. Save the script in the `./R` directory.

### Tasks 

1. Run a basic stx_query() then filter the results for: 

```r
stxDb %>% 
  filter(
    duration_unit == "h",
    concentration_unit == "g/l",
    endpoint_group == "XX50",
    !is.na(duration),
    !is.na(concentration),
    !is.na(tax_family)
  ) %>%
  # filter for a minimum of 24h of exposure and a maximum of 192h of exposure
  filter(duration >= 24, duration <= 192)
  ```

2. Identify the chemicals (based on CAS number) which cover the most `tax_family` groups. Name the top 20 chemicals and select one organic molecule out of them. (Anything which is not a salt / inorganic compound)

3. Once you have picked one compound - filter the data for this particular chemical and export the data as a tabular format (prefferably tab separated values, .tsv) to:
```r
output_path = file.path("data","ssd_dataset.tsv")

fwrite(
    filtered_data, output_path, 
    sep = "\t", quote = FALSE, row.names = FALSE
)
```

### Bonus 

Once you have a running R script ask your AI assistant to convert that into a Quarto document so that your analysis is more transparent, reproducible, and shareable.
