class Api::V1::Games::PlaysController < ApplicationController
  def create
    game = Game.find(params[:game_id])
    player = User.find(params['user_id'])
    player.plays.create(game: game, word: params['word'])
    render json: game.as_json, status: 201
  end
end
