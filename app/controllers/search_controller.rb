class SearchController < ApplicationController
  def index
    word = params['q']
    @search ||= SearchService.new(word)
  end
end
