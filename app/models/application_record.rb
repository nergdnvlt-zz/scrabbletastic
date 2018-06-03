class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def find_player(player_id)
    User.find(player_id)
  end
end
