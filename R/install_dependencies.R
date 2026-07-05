# ==========================
#   install_dependencies.R
# ==========================
#
# Checks whether the R packages required by the scripts in this /R folder are
# installed, and installs any that are missing.
#
# Usage:
#   - In RStudio/Positron: source this file.
#   - From the command line: Rscript R/install_dependencies.R

required_packages <- c(
  "remotes",      # for installing packages from GitHub
  "dplyr",       # data manipulation and the %>% pipe
  "ggplot2",     # plotting
  "ggpubr",      # publication-ready ggplot2 plots
  "data.table",  # efficient data handling (rbindlist, fread, fwrite)
  "readxl",      # reading the .xlsx input
  "stringr",     # string manipulation
  "forcats",     # factor manipulation
  "ssdtools",     # species sensitivity distribution fitting
  #"tidyr",       # data tidying
  #"purrr",       # functional programming tools
  #"rstudioapi",  # resolving the script directory in RStudio/Positron
  "writexl"      # writing the .xlsx output

)

# Determine which required packages are not yet installed
installed <- rownames(installed.packages())
missing_packages <- setdiff(required_packages, installed)

if (length(missing_packages) == 0) {
  message("All required packages are already installed.")
} else {
  message(sprintf(
    "Installing %d missing package(s): %s",
    length(missing_packages),
    paste(missing_packages, collapse = ", ")
  ))
  install.packages(missing_packages)
}

# Verify installation succeeded
still_missing <- setdiff(required_packages, rownames(installed.packages()))
if (length(still_missing) > 0) {
  stop(sprintf(
    "The following package(s) could not be installed: %s",
    paste(still_missing, collapse = ", ")
  ))
}

message("\u2713 All required packages are installed.")

# Install GitHub-only packages ------------------------------------------
# These are not on CRAN and must be installed from GitHub.
github_packages <- c(
  standartox = "andschar/standartox",
  drc        = "hreinwald/drc"
)

for (pkg in names(github_packages)) {
  if (!pkg %in% rownames(installed.packages())) {
    message(sprintf("Installing '%s' from GitHub (%s)", pkg, github_packages[[pkg]]))
    remotes::install_github(github_packages[[pkg]])
  }
}

# Load-check: confirm each package can actually be loaded ----------------
load_failures <- character(0)
for (pkg in c(required_packages, names(github_packages))) {
  ok <- suppressWarnings(suppressMessages(
    requireNamespace(pkg, quietly = TRUE)
  ))
  if (!ok) {
    load_failures <- c(load_failures, pkg)
  }
}

if (length(load_failures) > 0) {
  stop(sprintf(
    "The following package(s) are installed but failed to load: %s",
    paste(load_failures, collapse = ", ")
  ))
}

message("\u2713 All required packages loaded successfully.")

