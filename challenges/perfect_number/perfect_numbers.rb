class NegativeError < StandardError; end

module PerfectNumber
  def self.classify(n)
    raise NegativeError if n < 0

    case aliquot_sum(n) <=> n
    when -1
      'deficient'
    when 0
      'perfect'
    when 1
      'abundant'
    end
  end

  class << self
    private

    def aliquot_sum(n)
      divisors = []
      1.upto(n/2) do |i|
        divisors << i if n % i == 0
      end
      divisors.sum
    end
  end
end
