class SumOfMultiples
  def self.to(n)
    SumOfMultiples.new(3, 5).to(n)
  end

  attr_reader :set

  def initialize(*set)
    @set = set
  end

  def to(n)
    (1...n).select do |i|
      set.any? { |e| i % e == 0 }
    end.sum
  end
end
