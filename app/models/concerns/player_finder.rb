module PlayerFinder
  extend ActiveSupport::Concern

  def find_player(player_id)
    User.find(player_id)
  end
end
