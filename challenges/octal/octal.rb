class Octal
  def initialize(o)
    @o = o
  end

  def to_decimal
    digits = @o.chars.reverse
    digits.map.with_index do |n, i|
      return 0 unless n =~ /[01234567]/
      n.to_i * 8**i
    end.sum
  end
end
