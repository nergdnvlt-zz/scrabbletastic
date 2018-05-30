module PlaysHelper
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
