library(rix)

rix(
  date = "2025-04-29",
  r_pkgs = "ggplot2",
  py_conf = list(
    py_version = "3.12",
    py_pkgs = c("polars", "great-tables")
  ),
  ide = "positron",
  project_path = ".",
  overwrite = TRUE
)
