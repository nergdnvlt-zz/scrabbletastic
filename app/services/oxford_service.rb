class OxfordService
  def self.parse(url, word)
    new(url, word).parse
  end

  def parse
    return nil if response.body.include?('404')
    JSON.parse(response.body)
  end
  
  private

  def response
    @conn.get do |req|
      req.url @word
      req.headers['app_id'] = ENV['app_id']
      req.headers['app_key'] = ENV['app_key']
    end
  end

  def initialize(url, word)
    @word = word
    @conn = Faraday.new(url)
  end
end
