require 'rails_helper'

describe SearchService do
  it 'initalizes with word and returns message' do
    VCR.use_cassette('services/return_valid_message') do
      word = 'intrigue'
      search = SearchService.new(word)
      message = search.message
      expect(search).to be_a SearchService
      expect(message).to eq("'intrigue' is a valid word and its root form is 'intrigue'.")
    end
  end
end
