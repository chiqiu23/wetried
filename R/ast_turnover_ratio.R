#' Calculate the assist to turnover ratio of a player from the Smith WBB dataset.
#'
#' @name ast_turnover_ratio
#' @param input_player Player from the Smith WBB roster to calculate stat for.
#' @param input_season Specifies season within `input_player`s career to calculate stat for.
#' @return The assist to turnover ratio of `input_player` in `input_season`.
#' @export
#'
#' @examples
#' ast_turnover_ratio(input_player = "Bondi, Lauren", input_season = "2018-19")
#' # [1] 1.27381

utils::globalVariables(c("season", "player", "smith_wbb_data"))
# base statistic structure
# TS_percentage <- function(ast, to) {
#   (ast/to)
# }

#implementation on a per player, per season basis
ast_turnover_ratio <- function(input_player, input_season) {
  choice <- smith_wbb_data |>
    subset(season == input_season & player == paste0(input_player, "\r\n"))
  ts_stat <- ((choice$ast)/(choice$to))
  return(ts_stat)
}
