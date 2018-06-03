require 'rails_helper'

describe WordMessage do
  describe 'Class Methods' do
    it 'initiates with real attributes' do
      attrs = {"metadata"=>{"provider"=>"Oxford University Press"},
               "results"=>
                          [{"id"=>"foxes",
                            "language"=>"en",
                            "lexicalEntries"=>
                                              [{"grammaticalFeatures"=>[{"text"=>"Third", "type"=>"Person"}, {"text"=>"Singular", "type"=>"Number"}, {"text"=>"Present", "type"=>"Tense"}],
                                              "inflectionOf"=>[{"id"=>"fox", "text"=>"fox"}],
                                              "language"=>"en",
                                              "lexicalCategory"=>"Verb",
                                              "text"=>"foxes"},
                          {"grammaticalFeatures"=>[{"text"=>"Plural", "type"=>"Number"}], "inflectionOf"=>[{"id"=>"fox", "text"=>"fox"}], "language"=>"en", "lexicalCategory"=>"Noun", "text"=>"foxes"}],
      "word"=>"foxes"}]}
      message = WordMessage.message(attrs, 'foxes')
      expect(message).to eq("'foxes' is a valid word and its root form is 'fox'.")
    end

    it 'initiates with real but different attributes' do
      attrs = {"metadata"=>{"provider"=>"Oxford University Press"},
               "results"=>
                          [{"id"=>"lame",
                            "language"=>"en",
                            "lexicalEntries"=>
                                              [{"grammaticalFeatures"=>[{"text"=>"Third", "type"=>"Person"}, {"text"=>"Singular", "type"=>"Number"}, {"text"=>"Present", "type"=>"Tense"}],
                                              "inflectionOf"=>[{"id"=>"lame", "text"=>"lame"}],
                                              "language"=>"en",
                                              "lexicalCategory"=>"Verb",
                                              "text"=>"foxes"},
                          {"grammaticalFeatures"=>[{"text"=>"Plural", "type"=>"Number"}], "inflectionOf"=>[{"id"=>"fox", "text"=>"fox"}], "language"=>"en", "lexicalCategory"=>"Noun", "text"=>"foxes"}],
      "word"=>"foxes"}]}
      message = WordMessage.message(attrs, 'lame')
      # message = word.message
      # expect(word).to be_a Word
      expect(message).to eq("'lame' is a valid word and its root form is 'lame'.")
    end

    it 'initiates with nil attributes' do
      attrs = nil
      message = WordMessage.message(attrs, 'foxez')
      # message = word.message
      # expect(word).to be_a Word
      expect(message).to eq("'foxez' is not a valid word.")
    end
  end

  describe 'Instance Methods' do
    it 'initiates with real attributes' do
      attrs = {"metadata"=>{"provider"=>"Oxford University Press"},
               "results"=>
                          [{"id"=>"foxes",
                            "language"=>"en",
                            "lexicalEntries"=>
                                              [{"grammaticalFeatures"=>[{"text"=>"Third", "type"=>"Person"}, {"text"=>"Singular", "type"=>"Number"}, {"text"=>"Present", "type"=>"Tense"}],
                                              "inflectionOf"=>[{"id"=>"fox", "text"=>"fox"}],
                                              "language"=>"en",
                                              "lexicalCategory"=>"Verb",
                                              "text"=>"foxes"},
                          {"grammaticalFeatures"=>[{"text"=>"Plural", "type"=>"Number"}], "inflectionOf"=>[{"id"=>"fox", "text"=>"fox"}], "language"=>"en", "lexicalCategory"=>"Noun", "text"=>"foxes"}],
      "word"=>"foxes"}]}
      message = WordMessage.new(attrs, 'foxes').message
      expect(message).to eq("'foxes' is a valid word and its root form is 'fox'.")
    end

    it 'initiates with real but different attributes' do
      attrs = {"metadata"=>{"provider"=>"Oxford University Press"},
               "results"=>
                          [{"id"=>"lame",
                            "language"=>"en",
                            "lexicalEntries"=>
                                              [{"grammaticalFeatures"=>[{"text"=>"Third", "type"=>"Person"}, {"text"=>"Singular", "type"=>"Number"}, {"text"=>"Present", "type"=>"Tense"}],
                                              "inflectionOf"=>[{"id"=>"lame", "text"=>"lame"}],
                                              "language"=>"en",
                                              "lexicalCategory"=>"Verb",
                                              "text"=>"foxes"},
                          {"grammaticalFeatures"=>[{"text"=>"Plural", "type"=>"Number"}], "inflectionOf"=>[{"id"=>"fox", "text"=>"fox"}], "language"=>"en", "lexicalCategory"=>"Noun", "text"=>"foxes"}],
      "word"=>"foxes"}]}
      message = WordMessage.new(attrs, 'lame').message
      # message = word.message
      # expect(word).to be_a Word
      expect(message).to eq("'lame' is a valid word and its root form is 'lame'.")
    end

    it 'initiates with nil attributes' do
      attrs = nil
      message = WordMessage.new(attrs, 'foxez').message
      # message = word.message
      # expect(word).to be_a Word
      expect(message).to eq("'foxez' is not a valid word.")
    end
  end
end
