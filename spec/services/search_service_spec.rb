require 'rails_helper'

describe SearchService do
  it 'initalizes with word and returns message' do
    VCR.use_cassette('services/return_valid_message') do
      word = 'intrigue'

      search = SearchService.new(word)
      message = search.message

      expect(search).to be_a SearchService
      expect(message).to eq("'#{word}' is a valid word and its root form is '#{word}'.")
    end
  end

  it 'initalizes with other real word and returns message' do
    VCR.use_cassette('services/other_real_word_message') do
      word = 'awesome'

      search = SearchService.new(word)
      message = search.message

      expect(search).to be_a SearchService
      expect(message).to eq("'#{word}' is a valid word and its root form is '#{word}'.")
    end
  end

  it 'initalizes with word and invalid message' do
    VCR.use_cassette('services/invalid_message_return') do
      word = 'babadook'

      search = SearchService.new(word)
      message = search.message

      expect(search).to be_a SearchService
      expect(message).to eq("'#{word}' is not a valid word.")
    end
  end

  it 'initalizes with word and invalid message' do
    VCR.use_cassette('services/other_invalid_message_return') do
      word = 'whapop'

      search = SearchService.new(word)
      message = search.message

      expect(search).to be_a SearchService
      expect(message).to eq("'#{word}' is not a valid word.")
    end
  end
end
