## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----load_packages-------------------------------------------------------
library(dplyr)
library(elo)
library(lubridate)
library(fitzRoy)


## ----load_data-----------------------------------------------------------
# Get data
results <- fitzRoy::get_match_results()
fixture <- fitzRoy::get_fixture(2019)

head(results)
head(fixture)

## ----clean_results-------------------------------------------------------
results <- results %>%
  mutate(seas_rnd = paste0(Season, ".", Round.Number),
         First.Game = ifelse(Round.Number == 1, TRUE, FALSE))

head(results)


## ----clean_fixture-------------------------------------------------------
fixture <- fixture %>%
  filter(Date > max(results$Date)) %>%
  mutate(Date = ymd(format(Date, "%Y-%m-%d"))) %>%
  rename(Round.Number = Round)

## ----elo_param-----------------------------------------------------------
# Set parameters
HGA <- 30 # home ground advantage
carryOver <- 0.5 # season carry over
k_val <- 20 # update weighting factor

## ----margin_outcome------------------------------------------------------
map_margin_to_outcome <- function(margin, marg.max = 80, marg.min = -80){
  norm <- (margin - marg.min)/(marg.max - marg.min)
  norm %>% pmin(1) %>% pmax(0)
}

## ----run_elo-------------------------------------------------------------
# Run ELO
elo.data <- elo.run(
  map_margin_to_outcome(Home.Points - Away.Points) ~
  adjust(Home.Team, HGA) +
    Away.Team +
    group(seas_rnd) +
    regress(First.Game, 1500, carryOver),
  k = k_val,
  data = results
)


## ----print_results1------------------------------------------------------
as.data.frame(elo.data) %>% tail()

## ----print_results2------------------------------------------------------
as.matrix(elo.data) %>% tail()

## ----print_results3------------------------------------------------------
final.elos(elo.data)

## ----predictions---------------------------------------------------------
fixture <- fixture %>%
  mutate(Prob = predict(elo.data, newdata = fixture))

head(fixture)

