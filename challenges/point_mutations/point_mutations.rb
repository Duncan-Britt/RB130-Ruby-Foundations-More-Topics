class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other)
    other = other.chars
    count = 0
    @strand.chars.each_with_index do |e,  i|
      break if i == other.size
      count += 1 if e != other[i]
    end
    count
  end
end
