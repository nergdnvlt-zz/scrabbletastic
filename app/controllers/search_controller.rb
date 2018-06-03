class SearchController < ApplicationController
  def index
    @message ||= SearchPresenter.message(params['q'])
  end
end
