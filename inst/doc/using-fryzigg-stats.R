## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, include = FALSE---------------------------------------------------
not_cran = identical(Sys.getenv("NOT_CRAN"), "true")
online <- !is.null(curl::nslookup("r-project.org", error = FALSE))
eval_param <- not_cran & online


knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = eval_param
)
original_options <- options()
options(tibble.print_min = 5, tibble.print_max = 5)
requireNamespace("ggplot2", quietly = TRUE)
dat <- fitzRoy:::fryzigg

## ----load_packages, eval=eval_param, message=FALSE, warning=FALSE-------------
#  library(fitzRoy)
#  library(dplyr)
#  library(elo)
#  library(lubridate)

## ----results, eval=FALSE------------------------------------------------------
#  dat <- fitzRoy::get_fryzigg_stats(start = 2019, end = 2019)

## ----results2, eval=eval_param------------------------------------------------
#  dplyr::glimpse(dat)

## ----results3, eval=eval_param------------------------------------------------
#  head(dat)

## ----reset-options, message=FALSE, warning=FALSE, include=FALSE---------------
#  options(original_options)

