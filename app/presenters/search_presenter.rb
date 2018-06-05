class SearchPresenter
  def self.message(word)
    new(word).message
  end

  def message
    @message ||= SearchService.new(@word).message
  end

  private

  def initialize(word)
    @word = word
  end
end
