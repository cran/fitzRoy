## ----setup, include = FALSE----------------------------------------------
eval_param = identical(Sys.getenv("NOT_CRAN"), "true")

knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = eval_param
)
original_options <- options()
options(tibble.print_min = 5, tibble.print_max = 5)
requireNamespace("ggplot2", quietly = TRUE)

## ----gh-installation, eval = FALSE, echo = TRUE--------------------------
#  # install.packages("devtools")
#  devtools::install_github("jimmyday12/fitzRoy")

## ----results, eval=eval_param--------------------------------------------
#  library(fitzRoy)
#  library(dplyr)
#  library(ggplot2)
#  results <- get_match_results()
#  
#  tail(results)
#  

## ----convert, eval=eval_param--------------------------------------------
#  results_long <- convert_results(results)
#  
#  head(results_long)

## ----afltables_match, eval=eval_param------------------------------------
#  stats <- get_afltables_stats(start_date = "2000-01-01", end_date = "2018-06-01")
#  
#  tail(stats)

## ----fixture, eval=eval_param--------------------------------------------
#  fixture <- get_fixture()
#  
#  head(fixture)

## ----footywire, eval=FALSE, include=TRUE---------------------------------
#  ## Show the top of player_stats
#  head(fitzRoy::player_stats)

## ----update_footywire, eval=FALSE, include=TRUE--------------------------
#  ## Update footywire data
#  dat <- update_footywire_stats()
#  

## ----get_footywire_gf, eval=eval_param, include=TRUE---------------------
#  ## Update footywire data
#  dat <- get_footywire_stats(ids = 9927)
#  
#  head(dat)

## ----squiggle1, message=FALSE, warning=FALSE, eval=eval_param------------
#  # You can get the sources
#  sources <- get_squiggle_data("sources")
#  head(sources)

## ----squiggle2, message=FALSE, warning=FALSE, eval=eval_param------------
#  # Get all tips
#  tips <- get_squiggle_data("tips")
#  head(tips)

## ----squiggle3, message=FALSE, warning=FALSE, eval=eval_param------------
#  # Get` just tips from round 1, 2018
#  tips <- get_squiggle_data("tips", round = 1, year = 2018)
#  head(tips)

## ----ladder1, message=FALSE, warning=FALSE, eval=eval_param--------------
#  ladder <- return_ladder(match_results_df = results)
#  head(ladder)

## ----ladder2, message=FALSE, warning=FALSE, eval=eval_param--------------
#  ladder <- return_ladder()
#  head(ladder)

## ----ladder3, message=FALSE, warning=FALSE, eval=eval_param--------------
#  ladder <- return_ladder(match_results_df = results, season_round = 15, season = 2018)
#  head(ladder)

## ----reset-options, message=FALSE, warning=FALSE, include=FALSE----------
#  options(original_options)

