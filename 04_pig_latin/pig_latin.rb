# Translate given string to pig latin
AY = "ay"
def translate(str)
  vowels = %w{ a e i o u }
  consonants = "bl, br, ch, ck, cl, cr, dr, fl, fr, gh, gl, gr, ng, ph, pl, pr,
                sc, sh, sk, sl, sm, sn, sp, st, sw, th, tr, tw, wh, wr, qu"
  consonant_blend = consonants.split(", ")
  str_arr = str.split(" ")
  punctuation = %{ . ! ? : ; }

  str_arr.map! do |word|
    p_sign = punctuation.include?(word[-1]) ? word[-1] : ""
    word.slice!(p_sign)
    temp = String.new(word)
    word.downcase!
    case
      when vowels.include?(word[0])
        word << AY
      when consonant_blend.include?(word[0..1].downcase) &&
           !(word.include?("thr") || word.include?("sch"))
        word = word[2..-1] << word[0..1] + AY
      when word[0..2] == "thr"
        word = word[3..-1] << "thr" + AY
      when word[0..2] == "sch"
        word = word[3..-1] << "sch" + AY
      when word.include?("qu")
        index = word.index("qu")
        word = (word[index + 2 ..-1] + word[0..index - 1]) << "qu" + AY
      else
        word = word[1..-1] << word[0] + AY
    end
   word = temp[0] == temp[0].upcase ? word.capitalize : word
   word << p_sign
  end
  str_arr.join(" ")
end