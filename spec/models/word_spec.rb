require 'rails_helper'

describe Word do
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
    word = Word.new(attrs, 'foxes')
    message = word.message
    expect(word).to be_a Word
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
    word = Word.new(attrs, 'lame')
    message = word.message
    expect(word).to be_a Word
    expect(message).to eq("'lame' is a valid word and its root form is 'lame'.")
  end

  it 'initiates with nil attributes' do
    attrs = nil
    word = Word.new(attrs, 'foxez')
    message = word.message
    expect(word).to be_a Word
    expect(message).to eq("'foxez' is not a valid word.")
  end
end
