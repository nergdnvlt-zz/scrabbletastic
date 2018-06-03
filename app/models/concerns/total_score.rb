module TotalScore
  extend ActiveSupport::Concern

  def total_score(game_id, player_id)
    find_player(player_id).plays.where(game_id: game_id).sum(:score)
  end
end
