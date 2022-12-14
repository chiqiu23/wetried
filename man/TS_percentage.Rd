% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/TS_percentage.R
\name{TS_percentage}
\alias{TS_percentage}
\title{Calculate TS\% or True Shooting Percentage from the Smith WBB dataset.}
\arguments{
\item{input_player}{Player name from the Smith WBB roster to calculate stat for.}

\item{input_season}{Specifies season within \code{input_player}s career to calculate stat for.}
}
\value{
The true shooting percentage of \code{input_player} in \code{input_season}.
}
\description{
Calculate TS\% or True Shooting Percentage from the Smith WBB dataset.
}
\examples{
TS_percentage(input_player = "Bondi, Lauren", input_season = "2018-19")
# [1] 56.037
player <- "Dornbusch, Abby"
season <- "2010-11"
TS_percentage(player, season)
# [1] 100
}
