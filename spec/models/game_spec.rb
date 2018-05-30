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
        expect(game.add_scores(josh.id)).to eq(15)
      end
    end
  end
end
