class SearchController < ApplicationController
  def index
    word = params['q']
    @search = SearchService.new(word).message
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
    JSON.parse(response.body)
  end

  def message
    Word.new(parse).message
  end
end

class Word
  def initialize(attrs)

  end
end
