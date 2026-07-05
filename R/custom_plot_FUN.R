# R-script with some custom plotting functions
library(ggplot2)
library(dplyr)


plot_col_freq <- function(data, col_name, top_n = 30) {
#' Plot the frequency of categories in a column
#'
#' Creates a bar chart of the frequency (count) of each distinct value in a
#' column of a data frame, sorted from most to least frequent. Optionally
#' limits the display to the `top_n` most frequent categories. Each bar is
#' annotated with its count, and the subtitle reports the total number of
#' unique categories.
#'
#' @param data A data frame (or object that can be subset with `[[`) containing
#'   the column to summarise.
#' @param col_name A single character string naming the column in `data` whose
#'   value frequencies should be plotted. `NA` values are dropped by the
#'   underlying [base::table()] call.
#' @param top_n A single positive integer giving the maximum number of
#'   categories to display, keeping the most frequent ones. Use `NULL` to show
#'   all categories. Defaults to `30`. If the column has fewer than or equal to
#'   `top_n` categories, all are shown.
#'
#' @return A [ggplot2::ggplot] object. Printing it renders the bar chart.
#'
#' @examples
#' \dontrun{
#' q <- stx_query()
#' plot_col_freq(q, "tax_genus")
#' plot_col_freq(q, "endpoint", top_n = NULL)
#' }
#'
#' @importFrom dplyr rename arrange desc slice_head mutate
#' @importFrom ggplot2 ggplot aes geom_bar geom_text labs theme_minimal theme
#'   element_text
#' @export

  # --- Input validation ---
  if (!is.character(col_name) || length(col_name) != 1L) {
    stop("`col_name` must be a single character string.", call. = FALSE)
  }
  if (!col_name %in% names(data)) {
    stop("Column '", col_name, "' not found in `data`.", call. = FALSE)
  }
  if (!is.null(top_n)) {
    if (!is.numeric(top_n) || length(top_n) != 1L || is.na(top_n) || top_n < 1) {
      stop("`top_n` must be `NULL` or a single positive number.", call. = FALSE)
    }
    top_n <- as.integer(top_n)
  }

  # --- Data Preparation ---
  # Create a frequency table and arrange by count, most to least frequent.
  full_df <- data[[col_name]] %>%
    table() %>%
    as.data.frame(stringsAsFactors = FALSE) %>%
    rename(Category = ".", Count = "Freq") %>%
    arrange(desc(Count))

  if (nrow(full_df) == 0L) {
    stop("Column '", col_name, "' has no non-missing values to plot.",
         call. = FALSE)
  }

  # --- Filtering and Title Generation ---
  plot_df <- full_df
  plot_title <- paste("Frequency of", col_name)

  # Limit categories only if top_n is set and smaller than the total.
  if (!is.null(top_n) && nrow(full_df) > top_n) {
    plot_df <- full_df %>%
      slice_head(n = top_n)

    plot_title <- paste("Top", top_n, "Frequencies for", col_name)
  }

  # --- Plotting ---
  # Lock in the sorted order by making Category an ordered factor.
  plot_df <- plot_df %>%
    mutate(Category = factor(as.character(Category),
                             levels = as.character(Category)))

  ggplot(plot_df, aes(x = Category, y = Count)) +
    geom_bar(stat = "identity", fill = "steelblue", alpha = 0.9) +
    geom_text(aes(label = Count), vjust = -0.3, size = 3.5) + # Add count labels on top of bars
    labs(
      title = plot_title,
      subtitle = paste("Total unique categories:", nrow(full_df)),
      x = col_name,
      y = "Count"
    ) +
    theme_minimal(base_size = 12) +
    theme(
      axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1),
      plot.title = element_text(face = "bold", size = 16),
      plot.subtitle = element_text(color = "gray40")
    )
}

# Test code 
skip = TRUE
if(!skip){
  q = stx_query()
  plot_col_freq(q, "tax_genus")
  plot_col_freq(q, "tax_family")
  plot_col_freq(q, "measurement")
  plot_col_freq(q, "endpoint")
}

