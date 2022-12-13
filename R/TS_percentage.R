#' Calculate TS% or True Shooting Percentage from the Smith WBB dataset.
#'
#' @name TS_percentage
#' @param input_player Player from the Smith WBB roster to calculate stat for.
#' @param input_season Specifies season within `input_player`s career to calculate stat for.
#' @return The true shooting percentage of `input_player` in `input_season`.
#' @export
#'
#' @examples
#' TS_percentage(input_player = "Bondi, Lauren", input_season = "2018-19")
#' # [1] 56.037
#' player <- "Dornbusch, Abby"
#' season <- "2010-11"
#' TS_percentage(player, season)
#' # [1] 100

utils::globalVariables(c("season", "player", "smith_wbb_data"))
# base statistic structure
# TS_percentage <- function(pts, fga, fta) {
#   100 * (pts/((2 * fga) + (0.88 * fta)))
# }

#implementation on a per player, per season basis
TS_percentage <- function(input_player, input_season) {
  ## checks input
  stopifnot(
    "`input_season` must match ds. run `unique(smith_wbb_data$season)` for available seasons" =
      match.arg(arg = input_season, choices = unlist(smith_wbb_data$season)) == input_season,
    "`input_player` must be player number seen in `input_season`" =
      match.arg(arg = input_player, choices = unlist(filter(smith_wbb_data, season == input_season)$player)) == input_player
  )

  choice <- smith_wbb_data |>
    subset(season == input_season & player == input_player)
  ts_stat <- 100 * (choice$pts/((2 * choice$fga) + (0.88 * choice$fta)))
  return(ts_stat)
}
