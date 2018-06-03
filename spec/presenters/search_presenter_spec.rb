require 'rails_helper'

describe SearchPresenter do
  it 'initializes with word and returns message' do
    VCR.use_cassette('presenters/search_presenter_invalid') do
      message = SearchPresenter.message('fiesty')

      expect(message).to eq("'fiesty' is not a valid word.")
    end
  end

  it 'initializes with word and returns message' do
    VCR.use_cassette('presenters/search_presenter_valid') do
      message = SearchPresenter.message('fox')

      expect(message).to eq("'fox' is a valid word and its root form is 'fox'.")
    end
  end

  it 'initializes with word and returns message' do
    VCR.use_cassette('presenters/search_presenter_message_invalid') do
      message = SearchPresenter.new('wakoo').message

      expect(message).to eq("'wakoo' is not a valid word.")
    end
  end

  it 'initializes with word and returns message' do
    VCR.use_cassette('presenters/search_presenter_message_valid') do
      message = SearchPresenter.new('fluffy').message

      expect(message).to eq("'fluffy' is a valid word and its root form is 'fluffy'.")
    end
  end
end
