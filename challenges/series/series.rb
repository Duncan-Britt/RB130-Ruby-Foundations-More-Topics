class Series
  def initialize(nums)
    @nums = nums.chars.map(&:to_i)
  end

  def slices(n)
    raise ArgumentError if n > @nums.size
    
    result = []
    i = 0
    while i + n - 1 < @nums.size
      result << @nums[i..i+n-1]
      i += 1
    end
    result
  end
end

series = Series.new('01234')
