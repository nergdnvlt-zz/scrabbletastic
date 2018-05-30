require 'rails_helper'

describe Play do
  context "Instance methods" do
    context "#score_word" do
      it "scores the word" do
        play = create(:play, word: "assess")
        expect(play.score).to eq(6)
      end

      it "scores different word" do
        play = create(:play, word: "amazing")
        expect(play.score).to eq(19)
      end
    end
  end
end
