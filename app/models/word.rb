# class Word
#   def initialize(attrs, original_word)
#     @attrs = attrs
#     @original_word = original_word
#   end
#
#   def self.message(attrs, original_word)
#     new(attrs, original_word)
#     binding.pry
#     if attrs == nil
#       "'#{original_word}' is not a valid word."
#     else
#       "'#{original_word}' is a valid word and its root form is '#{root_word(attrs)}'."
#     end
#   end
#
#   private
#
#   def root_word(attrs)
#     attrs['results'][0]['lexicalEntries'][0]['inflectionOf'][0]['id']
#   end
# end


class Word
  def self.message(attrs, original_word)
    new
    if attrs == nil
      "'#{original_word}' is not a valid word."
    else
      "'#{original_word}' is a valid word and its root form is '#{attrs['results'][0]['lexicalEntries'][0]['inflectionOf'][0]['id']}'."
    end
  end
end
