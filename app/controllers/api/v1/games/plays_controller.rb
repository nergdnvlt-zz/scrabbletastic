class Api::V1::Games::PlaysController < ApplicationController
  before_action :evaluate_message, :set_game, :set_player, only: [:create]

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

  def validate_word
    SearchService.new(params['word']).message
  end

  def evaluate_message
    return render json: {message: validate_word}.to_json if validate_word.include?('not a valid word')
  end
end
