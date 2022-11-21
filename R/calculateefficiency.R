#' Calculate TS% or True Shooting Percentage from the Smith WBB dataset.
#'
#' @param input_player Player from the Smith WBB roster to calculate stat for.
#' @param input_season Specifies season within `input_player`s career to calculate stat for.
#' @return The true shooting percentage of `input_player` in `input_season`.
#'
#' @examples
#' calc_efficiency(player = "Bondi, Lauren", season = "2018-19)
#' input_player <- "Dornbusch, Abby"
#' input_season <- "2010-11"
#' calc_efficiency(input_player, input_season)

# #base statistic structure
# calc_efficiency <- function(pts, fga, fta) {
#   100 * (pts/((2 * fga) + (0.88 * fta)))
# }

#implementation on a per player, per season basis
TS_percentage <- function(input_player, input_season) {
  choice <- smith_wbb_data |>
    subset(season == input_season & player == paste0(input_player, "\r\n"))

  ts_stat <- 100 * (choice$pts/((2 * choice$fga) + (0.88 * choice$fta)))
  return(ts_stat)
}
