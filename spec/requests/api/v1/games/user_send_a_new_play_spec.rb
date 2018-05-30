require 'rails_helper'

describe 'it can get a single game' do
  before(:each) do
    josh = User.create(id: 1, name: "Josh")
    sal = User.create(id: 2, name: "Sal")

    game = Game.create(player_1: josh, player_2: sal)

    josh.plays.create(game: game, word: "sal", score: 3)
    josh.plays.create(game: game, word: "zoo", score: 12)
    sal.plays.create(game: game, word: "josh", score: 14)
    sal.plays.create(game: game, word: "no", score: 2)
  end

  it 'returns a json response' do
    # You can choose to send the user_id and word specified below however you'd like or are comfortable.
    #
    # When I send a POST request to "/api/v1/games/1/plays" with a user_id=1 and word=at
    user = '1'
    in_word = 'at'
    post "/api/v1/games/1/plays?user_id=#{user}&word=#{in_word}"
    # Then I should receive a 201 Created Response
    expect(response.status).to eq(201)
    # When I send a GET request to "/api/v1/games/1" I receive a JSON response as follows:
    game = JSON.parse(response.body, symbolize_names: true)
    expect(game).to eq(
    {
      "game_id":1,
      "scores": [
        {
          "user_id":1,
          "score":17
        },
        {
          "user_id":2,
          "score":16
        }
      ]
    })
  end
end
