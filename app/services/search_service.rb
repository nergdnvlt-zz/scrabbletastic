class SearchService
  def initialize(word)
    @word = word
  end

  def message
    WordMessage.message(parse, @word)
  end

  private

  def parse
    @parse ||= OxfordService.parse("https://od-api.oxforddictionaries.com/api/v1/inflections/en/", @word)
  end
end
