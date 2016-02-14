# Reopen the Fixnum class to add the method in_words
class Fixnum
 
  def in_words
    word = ""
        
    case self
      when 0..999
        zero_to_999(self)
      when 1000..999_999_999_999_999
        one_thousand_and_up(self, word)
    end
  end
  
#////////////////////////////////////////////////////////////////////////////////
  private
    # 0 to 9
    def zero_to_nine(num)
      case num
        when 0
          "zero"
        when 1
          "one"
        when 2
          "two"
        when 3
          "three"
        when 4
          "four"
        when 5
          "five"
        when 6
          "six"
        when 7
          "seven"
        when 8
          "eight"
        when 9
          "nine"
      end
    end
    
    # 10 to 12
    def ten_to_twelve(num)
      case num
        when 10
          "ten"
        when 11
          "eleven"
        when 12
          "twelve"
      end
    end
    
    # 13 to 19
    def thirteen_to_nineteen(num)
      num -= 10
      word = ""
      if irregulars.include?(num)
        word = irregular_case(num)
      else
        word = zero_to_nine(num)
      end
      word + "teen"     
    end
    
    # 20 to 90
    def twenty_to_ninety_nine(num)
      irreg_arr = irregulars
      irreg_arr << 4
      irreg_arr << 2
      word = ""
      quotient = num / 10
      remainder = num % 10
      
      if irreg_arr.include?(quotient)
        word = irregular_case(quotient)
      else
        word = zero_to_nine(quotient)
      end
      
      # When there is a remainder for num / 10
      word += "ty"
      remainder == 0 ? word : word += " #{zero_to_nine(remainder)}"
    end
    
    # Reads everything after a 999
    # Base can be 1000, 1 000 000,...
    def one_thousand_and_up(num, word)
      base = 1
      quotient = num / base
      remainder = num % base
      quotient_in_words = ""
      
      # 1 <= quotien <= 999
      while quotient < 1 || quotient > 999
        base *= 1000
        quotient = num / base
        remainder = num % base
      end
      
      quotient_in_words = zero_to_999(quotient)
      word += quotient_in_words + "#{base_in_word(base)}"
      
      if remainder == 0
        word[-1] = ""
        word
      else
        postfix = ""
        case remainder
        when 1..999
          postfix = zero_to_999(remainder)
          word << postfix
        when 1000..999_999_999_999
          word = one_thousand_and_up(remainder, word)
        end
      end
    end
    
    # Zero to 999 wrapper because it makes things easier
    def zero_to_999(num)
      case num
        when 0..99
          zero_to_99(num)
        when 100..999
          one_hundred_to_999(num)
      end
    end
    
    # In words for 0 to 99
    def zero_to_99(num)
      case num
      when 0..9
        zero_to_nine(num)
      when 10..12
        ten_to_twelve(num)
      when 13..19
        thirteen_to_nineteen(num)
      when 20..99
        twenty_to_ninety_nine(num)
      end
    end
    
    # In words for 100 to 999
    def one_hundred_to_999(num)
      quotient = num / 100
      remainder = num % 100
      num_in_word = "#{zero_to_99(quotient)} hundred"
      
      if remainder == 0
        num_in_word
      else
        num_in_word << " #{zero_to_99(remainder)}"
      end
    end
    
    # Returns the word for each base
    # 1000, 1 000 000 and up!
    def base_in_word(unit)
      case unit
        when 1000
          " thousand "
        when 1_000_000
          " million "
        when 1_000_000_000
          " billion "
        when 1_000_000_000_000
          " trillion "
      end
    end
    
    # Irregulars digits
    def irregulars
        [3, 5, 8]
    end
    
    # Irregular cases 3, 4, 5, 8, 20
    def irregular_case(num)
      case num
        when 3
          "thir"
        when 4
          "for"
        when 5
          "fif"
        when 8
          "eigh"
        when 2
          "twen"
      end
    end
          
end

puts 232497494123473.in_words