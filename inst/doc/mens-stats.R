## ----setup, include = FALSE----------------------------------------------
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

results <- fitzRoy:::results
fixture <- fitzRoy:::fixture
stats <- fitzRoy:::stats
stats_gf <- fitzRoy:::stats_gf
ladder <- fitzRoy:::ladder
ladder_round <- fitzRoy:::ladder_round
sources <- fitzRoy:::sources
tips <- fitzRoy:::tips
tips_round <- fitzRoy:::tips_round


## ----load_packages, eval=eval_param, message=FALSE, warning=FALSE--------
#  library(dplyr)
#  library(elo)
#  library(lubridate)
#  library(fitzRoy)
#  

## ----results, eval=FALSE-------------------------------------------------
#  results <- get_match_results()

## ----results2, eval=eval_param-------------------------------------------
#  tail(results)

## ----convert, eval=eval_param--------------------------------------------
#  results_long <- convert_results(results)
#  
#  head(results_long)

## ----afltables_match, eval=FALSE-----------------------------------------
#  stats <- get_afltables_stats(start_date = "2018-01-01", end_date = "2018-06-01")

## ----afltables_match2, eval=eval_param-----------------------------------
#  tail(stats)

## ----fixture, eval=FALSE-------------------------------------------------
#  fixture <- get_fixture()

## ----fixture2, eval=eval_param-------------------------------------------
#  head(fixture)

## ----footywire, eval=FALSE, include=TRUE---------------------------------
#  ## Show the top of player_stats
#  head(fitzRoy::player_stats)

## ----update_footywire, eval=FALSE, include=TRUE--------------------------
#  ## Update footywire data
#  dat <- update_footywire_stats()

## ----get_footywire_gf, eval=FALSE, include=TRUE--------------------------
#  ## Update footywire data
#  stats_gf <- get_footywire_stats(ids = 9927)

## ----get_footywire_gf2, eval=eval_param, include=TRUE--------------------
#  head(stats_gf)

## ----squiggle_sources1, message=FALSE, warning=FALSE, eval=FALSE---------
#  # You can get the sources
#  sources <- get_squiggle_data("sources")

## ----squiggle_sources2, message=FALSE, warning=FALSE, eval=eval_param----
#  head(sources)

## ----squiggle_tips1, message=FALSE, warning=FALSE, eval=FALSE------------
#  # Get all tips
#  tips <- get_squiggle_data("tips")

## ----squiggle_tips2, message=FALSE, warning=FALSE, eval=eval_param-------
#  head(tips)

## ----squiggle_round1, message=FALSE, warning=FALSE, eval=FALSE-----------
#  # Get` just tips from round 1, 2018
#  tips_round <- get_squiggle_data("tips", round = 1, year = 2018)

## ----squiggle_round2, message=FALSE, warning=FALSE, eval=eval_param------
#  head(tips_round)

## ----ladder1, message=FALSE, warning=FALSE, eval=FALSE-------------------
#  ladder <- return_ladder(match_results_df = results)

## ----ladder2, message=FALSE, warning=FALSE, eval=eval_param--------------
#  head(ladder)

## ----ladder3, message=FALSE, warning=FALSE, eval=FALSE-------------------
#  ladder <- return_ladder()

## ----ladder4, message=FALSE, warning=FALSE, eval=FALSE-------------------
#  ladder_round <- return_ladder(match_results_df = results, season_round = 15, season = 2018)

## ----ladder5, message=FALSE, warning=FALSE, eval=eval_param--------------
#  head(ladder_round)

## ----reset-options, message=FALSE, warning=FALSE, include=FALSE----------
#  options(original_options)

