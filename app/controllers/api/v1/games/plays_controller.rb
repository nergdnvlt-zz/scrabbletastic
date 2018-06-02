class Api::V1::Games::PlaysController < ApplicationController
  skip_before_action :verify_authenticity_token
  include PlaysHelper

  before_action :evaluate_message, :set_game, :set_player, only: [:create]

  def create
    set_player.plays.create(game: set_game, word: params['word'])
    render json: set_game.as_json, status: 201
  end
end
