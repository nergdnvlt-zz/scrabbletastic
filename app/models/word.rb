class Word
  def self.message(attrs, original_word)
    new(attrs, original_word).message
  end

  def message
    if @attrs == nil
      "'#{@original_word}' is not a valid word."
    else
      "'#{@original_word}' is a valid word and its root form is '#{root_word}'."
    end
  end

  private

  def initialize(attrs, original_word)
    @attrs = attrs
    @original_word = original_word
  end


  def root_word
    @attrs['results'][0]['lexicalEntries'][0]['inflectionOf'][0]['id']
  end
end


# class Word
#   def self.message(attrs, original_word)
#     new
#     if attrs == nil
#       "'#{original_word}' is not a valid word."
#     else
#       "'#{original_word}' is a valid word and its root form is '#{attrs['results'][0]['lexicalEntries'][0]['inflectionOf'][0]['id']}'."
#     end
#   end
# end
