class SearchController < ApplicationController
  def index
    word = params['q']
    @search ||= SearchService.new(word)
  end
end

class SearchService
  def initialize(word)
    @word = word
  end

  def conn
    Faraday.new(ENV['dict_base_url'])
  end

  def response
    conn.get do |req|
      req.url "inflections/en/#{@word}"
      req.headers['app_id'] = ENV['app_id']
      req.headers['app_key'] = ENV['app_key']
    end
  end

  def parse
    return nil if response.body.include?('404')
    JSON.parse(response.body)
  end

  def message
    Word.new(parse, @word).message
  end
end

class Word
  def initialize(attrs, original_word)
    @attrs = attrs
    @original_word = original_word
  end

  def root_word
    @attrs['results'][0]['lexicalEntries'][0]['inflectionOf'][0]['id']
  end

  def message
    if @attrs == nil
      "'#{@original_word}' is not a valid word."
    else
    "'#{@original_word}' is a valid word and its root form is '#{root_word}'."
    end
  end
end
