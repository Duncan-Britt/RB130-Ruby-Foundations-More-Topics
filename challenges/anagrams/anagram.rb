class Anagram
  def initialize(str)
    @str = str
  end

  def match(words)
    words.select { |w| anagram?(w) }
  end

  def anagram?(word)
    return false if word.downcase == @str.downcase
    word.downcase.chars.sort.join == @str.downcase.chars.sort.join
  end
end
