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
  ## checks input -- still in progress
  # stopifnot(
  #   "`input_season` must match ds. run `unique(smith_wbb_data$season)` for available seasons" =
  #     isTRUE(match.arg(arg = input_season, choices = unlist(smith_wbb_data$season)) == input_season),
  #   "`player_num1` must be numeric" = is.numeric(player_num1),
  #   "`player_num1` must be player number seen in `input_season`" =
  #     isTRUE(match.arg(arg = as.character(player_num1), choices = as.character(unlist(filter(smith_wbb_data, season == input_season)$number))) == as.character(player_num1)),
  #   "`player_num2` must be numeric" = is.numeric(player_num2),
  #   "`player_num2` must be player number seen in `input_season`" =
  #     isTRUE(match.arg(as.character(player_num2), as.character(unlist(filter(smith_wbb_data, season == input_season)$number))) == as.character(player_num2)),
  #   "`player_num1` cannot be the same as `player_num2`" = isTRUE(player_num1 != player_num2))

  smith_wbb_data <- as.data.frame(apply(smith_wbb_data,2, str_remove_all, "\r\n"))

  player_data <- smith_wbb_data |>
    filter(number == player_num1| number == player_num2, season == input_season) |>
    select(number, player, fga)

  player_1 <- player_data$player[1]
  player_2 <- player_data$player[2]

  p_players <- ggplot(player_data, aes(x = player, y = fga, fill = player))+
    geom_bar(stat="identity", position=position_dodge())+
    xlab("Name of player") +
    ylab("Field goals attempted") +
    ggplot2::ggtitle(paste0(player_1, " v. ", player_2, " field goals attempts, ", input_season, " season."))

  return(p_players)
}

