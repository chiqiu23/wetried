#' Compare field goals attempted of players in one season
#'
#' @name perform_players
#' @param player_num1 The number of the player1
#' @param player_num2 The number of the player2
#' @param input_season The season of the basketball game
#'
#' @usage perform_players(player_num1, player_num2, input_season)
#' @return A bar graph that compares performance of `player1`'s performance with `player2`'s on field goals attempted in one `season`
#'
#' @examples
#' perform_players(10, 22, "2021-22")
#'
#' @import dplyr
#' @import ggplot2

perform_players <- function(player_num1, player_num2, input_season){
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
    ggplot2::ggtitle(paste0(player_1, "v. ", player_2, "of field goals attempted in season ", input_season))

  return(p_players)
}

