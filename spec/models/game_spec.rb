require 'rails_helper'

describe Game do
  context "Instance methods" do
    context "#add scores" do
      it "scores the total" do
        josh = User.create(id: 1, name: "Josh")
        sal = User.create(id: 2, name: "Sal")

        game = Game.create(player_1: josh, player_2: sal)
        josh.plays.create(game: game, word: "sal", score: 3)
        josh.plays.create(game: game, word: "zoo", score: 12)
        expect(game.total_score(josh.id)).to eq(15)
      end
    end

    context "#as_json" do
      it "scores the total" do
        josh = User.create(id: 1, name: "Josh")
        sal = User.create(id: 2, name: "Sal")

        game = Game.create(player_1: josh, player_2: sal)

        josh.plays.create(game: game, word: "sal", score: 3)
        josh.plays.create(game: game, word: "zoo", score: 12)
        sal.plays.create(game: game, word: "josh", score: 14)
        sal.plays.create(game: game, word: "no", score: 2)
        game = game.as_json

        expect(game).to eq({:game_id=>1, :scores=>[{:user_id=>1, :score=>15}, {:user_id=>2, :score=>16}]})
      end
    end
  end
end
