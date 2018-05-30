class Api::V1::Games::PlaysController < ApplicationController
  before_action :set_game, :set_player

  def create
    set_player.plays.create(game: set_game, word: params['word'])
    render json: set_game.as_json, status: 201
  end

  private

  def set_game
    Game.find(params[:game_id])
  end

  def set_player
    User.find(params['user_id'])
  end
end
