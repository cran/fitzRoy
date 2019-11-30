## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----gh-installation, eval = FALSE, echo = TRUE--------------------------
#  # install.packages("devtools")
#  # devtools::install_github("jimmyday12/fitzRoy")

## ----libraries, message=FALSE, warning=FALSE-----------------------------
library(fitzRoy)
library(dplyr)

## ----fetch_match_stats, message=FALSE, warning=TRUE----------------------
match_data <- get_aflw_match_data()

## ----show_match_stats, message=FALSE, warning=FALSE----------------------
glimpse(match_data)

## ----first_10, message=FALSE, warning=FALSE------------------------------
first10 <- head(match_data, 10)
first10_ids <- first10$Match.Id
first10_ids

## ------------------------------------------------------------------------
detailed <- get_aflw_detailed_data(first10_ids)
glimpse(detailed)

