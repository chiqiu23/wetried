#' Compare field goals attempted of players in one season
#'
#' @name perform_players
#' @param player_num1 The number of the first player of interest
#' @param player_num2 The number of the second player of interest
#' @param input_season The season of interest from the dataset
#'
#' @usage perform_players(player_num1, player_num2, input_season)
#' @return A bar graph that compares performance of `player1`'s performance with `player2`'s on field goals attempted in one `season`
#' @export
#' @import dplyr
#' @import ggplot2
#' @import stringr
#'
#' @examples
#' perform_players(10, 22, "2021-22")

utils::globalVariables(c("number", "season", "player", "fga"))

perform_players <- function(player_num1, player_num2, input_season){
  ## checks input
  stopifnot(
    "`input_season` must match ds. run `unique(smith_wbb_data$season)` for available seasons" =
      input_season %in% unlist(smith_wbb_data$season)
  )
  stopifnot(
    "`player_num1` must be numeric" = is.numeric(player_num1)
  )
  stopifnot(
    "`player_num1` must be player number seen in `input_season`" =
      player_num1 %in% (filter(smith_wbb_data, season == input_season)$number)
  )
  stopifnot(
    "`player_num2` must be numeric" = is.numeric(player_num2)
  )
  stopifnot(
    "`player_num2` must be player number seen in `input_season`" =
      player_num2 %in% (filter(smith_wbb_data, season == input_season)$number)
  )

  p_players <- ggplot(filter(smith_wbb_data, season == input_season & number == player_num1
                             | season == input_season & number == player_num2),
                      aes(x = player, y = fga)) +
    geom_bar(stat = "identity", position = position_dodge(), aes(fill = player)) +
    xlab("Player") +
    ylab("Field goals attempted") +
    ggtitle(paste0(filter(smith_wbb_data, season == input_season & number == player_num1)$player," v. ",
                   filter(smith_wbb_data, season == input_season & number == player_num2)$player,
                   " field goals attempts, ", input_season, " season."))

  return(p_players)
}


