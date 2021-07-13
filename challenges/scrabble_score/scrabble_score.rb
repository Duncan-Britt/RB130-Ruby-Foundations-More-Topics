class Scrabble
  attr_reader :word

  def initialize(str)
    @word = str
  end

  def self.score(str)
    Scrabble.new(str).score
  end

  def score
    return 0 unless word
    word.chars.reduce(0) do |acc, chr|
      if chr =~ /[aeioulnrst]/i
        acc + 1
      elsif chr =~ /[dg]/i
        acc + 2
      elsif chr =~ /[bcmp]/i
        acc + 3
      elsif chr =~ /[fhvwy]/i
        acc + 4
      elsif chr =~ /k/i
        acc + 5
      elsif chr =~ /[jx]/i
        acc + 8
      elsif chr =~ /[qz]/i
        acc + 10
      else
        acc
      end
    end
  end
end
