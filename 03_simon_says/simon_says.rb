# Echo a given string
def echo(str)
  str
end

# Shout a given str all caps
def shout(str)
  str.upcase
end

# Repeat a given str n times
def repeat(str, n=2)
  ((str + " ") * n).rstrip
end

# The first several letters of a word
def start_of_word(str, n)
  str[0..n-1]
end

# Tell what is the first word in str
def first_word(str)
  str.split(" ").first
end

# Capitalize each word in a given str
def titleize(str)
  little_words = ['a', 'an', 'and', 'to', 'over', 'the' ]
  str_arr = str.split(" ")
  str_arr.map do |word|
    if word == str_arr.first
      word.capitalize!
    else
      little_words.include?(word) ? word : word.capitalize!
    end
  end
  str_arr.join(" ")
end