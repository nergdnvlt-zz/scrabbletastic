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
