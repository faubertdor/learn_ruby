# Reopen the Fixnum class to add the method in_words
class Fixnum
  attr_accessor :irregulars, :word, :num_0_to_9, :num_10_to_12
  
  def in_words
    self.word = ""
    self.irregulars   =   [3, 5, 8]
    self.num_0_to_9   =   { 0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four",
                            5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine" }
    self.num_10_to_12 =   { 10 => "ten", 11 => "eleven", 12 => "twelve" }
    
    case self
      when 0..999
        zero_to_999(self)
      when 1000..99999
        one_thousand_and_up(self, 1000)
      when 1_000_000..999_999_999
        one_thousand_and_up(self, 1_000_000)
      when 1_000_000_000..999_999_999_999
        one_thousand_and_up(self, 1_000_000_000)
      when 1_000_000_000_000..999_999_999_999_999
        one_thousand_and_up(self, 1_000_000_000_000)
    end
  end
  
#////////////////////////////////////////////////////////////////////////////////
  private
    # 0 to 9
    def zero_to_nine(num)
      num_0_to_9[num]
    end
    
    # 10 to 12
    def ten_to_twelve(num)
      num_10_to_12[num]
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
      self.irregulars << 4
      self.irregulars << 2
      word = ""
      quotient = num / 10
      remainder = num % 10
      
      if irregulars.include?(quotient)
        word = irregular_case(quotient)
      else
        word = zero_to_nine(quotient)
      end
      
      # When there is a remainder for num / 10
      word += "ty"
      remainder == 0 ? word : word += " #{zero_to_nine(remainder)}"
    end
    
    # Reads everything after a 999
    # Unit can be 1000, 1000,...
    def one_thousand_and_up(num, unit)
      quotient = num / unit
      remainder = num % unit
      quotient_in_words = ""
      
      # 1 <= quotien <= 999 
      quotient_in_words = zero_to_999(quotient)
      self.word += quotient_in_words + "#{unit_in_word(unit)}"
      
      if remainder == 0
        self.word[-1] = ""
        word
      else
        postfix = ""
        case remainder
        when 1..999
          postfix = zero_to_999(remainder)
          self.word << postfix
        when 1000..999_999
          one_thousand_and_up(remainder, 1000)
        when 1_000_000..999_999_999
          one_thousand_and_up(remainder, 1_000_000)
        when 1_000_000_000..999_999_999_999
          one_thousand_and_up(remainder, 1_000_000_000)
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
    
    # Returns the word for each unit
    # 1000, 1 000 000 and up!
    def unit_in_word(unit)
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