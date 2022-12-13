#' Calculate Offensive Rating from the Smith WBB dataset.
#'
#' @name offensive_rating
#' @param input_player Player name from the Smith WBB roster to calculate stat for.
#' @param input_season Specifies season within `input_player`s career to calculate stat for.
#' @return The offensive rating of `input_player` in `input_season`.
#' @export
#'
#' @examples
#' offensive_rating(input_player = "Bondi, Lauren", input_season = "2018-19")
#' # [1] 129.2734
#' player <- "Barrett, Alyssa"
#' season <- "2012-13"
#' offensive_rating(player, season)
#' # [1] 117.226

utils::globalVariables(c("season", "player", "smith_wbb_data"))
utils::globalVariables(c("season", "smith_oppwbb_data"))

#implementation on a per player, per season basis
offensive_rating <- function(input_player, input_season) {
  #input checks
  stopifnot(
    "`input_season` must match ds. run `unique(smith_wbb_data$season)` for available seasons" =
      input_season %in% unlist(smith_wbb_data$season)
      # match.arg(arg = input_season, choices = unlist(smith_wbb_data$season)) == input_season
    )
  stopifnot(
    "`input_player` must be player number seen in `input_season`" =
      input_player %in% (filter(smith_wbb_data, season == input_season)$player)
      # match.arg(arg = input_player, choices = unlist(filter(smith_wbb_data, season == input_season)$player)) == input_player
  )

  choice <- smith_wbb_data |>
    subset(season == input_season & player == input_player)
  choice2 <- smith_oppwbb_data |>
    subset(season == input_season)
  choice3 <- smith_wbb_data |>
    subset(season == input_season)
  team_mp <- sum(choice3$tot)
  team_ast <- sum(choice3$ast)
  team_fgm <- sum(choice3$fgm)
  team_fga <- sum(choice3$fga)
  team_pts <- sum(choice3$pts)
  team_ftm <- sum(choice3$ftm)
  team_fta <- sum(choice3$fta)
  team_tov <- sum(choice3$to)
  team_orb <- sum(choice3$off)
  team_x3pt <- sum(choice3$x3pt)
  opp_trb <- sum(choice2$tot)
  opp_orb <- sum(choice2$off)

  qAST <- ((choice$tot/(team_mp * 5)) * (1.14 * ((team_ast - choice$ast)/team_fgm))) + ((((team_ast/team_mp) * choice$tot * 5 - choice$ast)/((team_fgm/team_mp) * choice$tot * 5 - choice$fgm)) * (1 - (choice$tot/(team_mp/5))))
  FG_part <- choice$fgm + (1 - 0.5 * ((choice$pts - choice$ftm)/(2 * choice$fga)) + qAST)
  AST_part <- 0.5 * (((team_pts - team_ftm) - (choice$pts - choice$ftm))/(2 * (team_fga - choice$fga))) * choice$ast
  FT_part <- (1 - (1 - (choice$ftm/choice$fta))^2) * 0.4 * choice$fta
  team_scoring_poss <- team_fgm + (1 - (1 - (team_ftm/team_fta))^2) * team_fta * 0.4
  team_xplay <- team_scoring_poss/(team_fga + team_fta * 0.4 + team_tov)
  team_xorb <- team_orb/(team_orb + (opp_trb - opp_orb))
  team_orb_weight <- ((1 - team_xorb) * team_xplay)/((1 - team_xorb) * team_xplay + team_xorb * (1 - team_xplay))
  ORB_part <- choice$off * team_orb_weight * team_xplay
  scposs <- (FG_part + AST_part + FT_part) * (1 - (team_orb/team_scoring_poss) * team_orb_weight * team_xplay) + ORB_part

  fgxposs <- (choice$fga - choice$fgm)*(1 - 1.07 * team_xorb)
  ftxposs <- ((1 - (choice$ftm/choice$fta))^2) * 0.4 * choice$fta

  totposs <- scposs + fgxposs + ftxposs + choice$to

  pprod_fg_part = 2 * (choice$fgm + 0.5 * choice$x3pt) * (1 - 0.5 * ((choice$pts - choice$ftm)/(2 * choice$fga)) * qAST)
  pprod_ast_part = 2 * ((team_fgm - choice$fgm + 0.5 * (team_x3pt - choice$x3pt))/(team_fgm - choice$fgm)) * 0.5 * (((team_pts - team_ftm) - (choice$pts - choice$ftm))/(2 * (team_fga - choice$fga))) * choice$ast
  pprod_orb_part = choice$off * team_orb_weight * team_xplay * (team_pts/(team_fgm + (1 - (1 - (team_ftm/team_fta))^2) * 0.4 * team_fta))
  pprod <- (pprod_fg_part + pprod_ast_part + choice$ftm) * (1 - (team_orb/team_scoring_poss) * team_orb_weight * team_xplay) + pprod_orb_part

  ORtg = 100 * (pprod/totposs)
  return(ORtg)
}
