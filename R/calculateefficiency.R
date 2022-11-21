#' Calculate TS% or True Shooting Percentage from the Smith WBB dataset.
#'
#' @param pts Total points scored in a given game.
#' @param fga Total field goals attempted in a given game.
#' @param fta Total free throws attempted in a given game.
#' @return The true shooting percentage of the player being looked into in that given game.
#'
#' @examples
#' calc_efficiency(30, 14, 10)
#' calc_efficiency(20, 17, 2)
#'
#'

calc_efficiency <- function(pts, fga, fta) {
  100 * (pts/((2 * fga) + (0.88 * fta)))
}

