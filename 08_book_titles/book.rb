# Book Titles in English obey some strange capitalization rules
class Book
  attr_reader :title
  def title=(value)
    title_exceptions = %w{ the in and an a of }
    title_words = value.split(" ")
    
    if title_words.length == 1
        @title = value.capitalize
    else
       title_words.map! do |word|
        case
          when !title_exceptions.include?(word)
               word.capitalize
          when title_exceptions.include?(word) && title_words.first == word
               word.capitalize
          else
               word
        end
      end
      @title = title_words.join(" ")
    end
  end
end