class PigLatinizer

  def piglatinize(string)
    string.split(' ').length == 1 ? piglatinize_word(string) : piglatinize_sentence(string)
  end

  def consonant?(char)
    !char.match(/[aeiouAEIOU]/)
  end

  def piglatinize_word(string)
    #words that start with a vowel
    if !consonant?(string[0])
      string = string + 'w'
    #words that start with three consonants
  elsif consonant?(string[0]) && consonant?(string[1]) && consonant?(string[2])
      string = string.slice(3..-1) + string.slice(0, 3)
    #words that start with two consonants
    elsif consonant?(string[0]) && consonant?(string[1])
      string = string.slice(2..-1) + string.slice(0, 2)
    #words that start with one consonant
    else
      string = string.slice(1..-1) + string.slice(0, 1)
    end
    string << 'ay'
  end

  def piglatinize_sentence(string)
    string.split.map {|word| piglatinize_word(word)}.join(' ')
  end

end
