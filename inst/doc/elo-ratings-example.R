## ----setup, include = FALSE----------------------------------------------
not_cran = identical(Sys.getenv("NOT_CRAN"), "true")
online <- !is.null(curl::nslookup("r-project.org", error = FALSE))
eval_param <- not_cran & online

knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = eval_param
)

results <- fitzRoy:::results
fixture <- fitzRoy:::fixture

## ----load_packages, eval=eval_param, message=FALSE, warning=FALSE--------
#  library(dplyr)
#  library(elo)
#  library(lubridate)
#  library(fitzRoy)
#  

## ----load_data, eval=FALSE, include=TRUE---------------------------------
#  # Get data
#  results <- fitzRoy::get_match_results()
#  fixture <- fitzRoy::get_fixture(2019)

## ----load_data2, eval=eval_param-----------------------------------------
#  results <- results %>% filter(Date < "2019-01-01")
#  tail(results)

## ----load_data3, eval=eval_param-----------------------------------------
#  fixture <- fixture %>% filter(Date > "2019-01-01")
#  head(fixture)

## ----clean_results, eval=eval_param--------------------------------------
#  results <- results %>%
#    mutate(seas_rnd = paste0(Season, ".", Round.Number),
#           First.Game = ifelse(Round.Number == 1, TRUE, FALSE))
#  

## ----clean_fixture, eval=eval_param--------------------------------------
#  fixture <- fixture %>%
#    filter(Date > max(results$Date)) %>%
#    mutate(Date = ymd(format(Date, "%Y-%m-%d"))) %>%
#    rename(Round.Number = `Round`)
#  
#  head(fixture)

## ----elo_param, eval=eval_param------------------------------------------
#  # Set parameters
#  HGA <- 30 # home ground advantage
#  carryOver <- 0.5 # season carry over
#  k_val <- 20 # update weighting factor

## ----margin_outcome, eval=eval_param-------------------------------------
#  map_margin_to_outcome <- function(margin, marg.max = 80, marg.min = -80){
#    norm <- (margin - marg.min)/(marg.max - marg.min)
#    norm %>% pmin(1) %>% pmax(0)
#  }

## ----run_elo, eval=eval_param--------------------------------------------
#  # Run ELO
#  elo.data <- elo.run(
#    map_margin_to_outcome(Home.Points - Away.Points) ~
#    adjust(Home.Team, HGA) +
#      Away.Team +
#      group(seas_rnd) +
#      regress(First.Game, 1500, carryOver),
#    k = k_val,
#    data = results
#  )
#  

## ----print_results1, eval=eval_param-------------------------------------
#  as.data.frame(elo.data) %>% tail()

## ----print_results2, eval=eval_param-------------------------------------
#  as.matrix(elo.data) %>% tail()

## ----print_results3, eval=eval_param-------------------------------------
#  final.elos(elo.data)

## ----predictions, eval=eval_param----------------------------------------
#  fixture <- fixture %>%
#    mutate(Prob = predict(elo.data, newdata = fixture))
#  
#  head(fixture)

