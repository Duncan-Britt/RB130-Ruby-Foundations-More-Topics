class CustomSet
  def initialize(arr=[])
    @set = arr.uniq
  end

  def empty?
    set.empty?
  end

  def contains?(n)
    set.include?(n)
  end

  def subset?(other)
    self.set.all? { |e| other.contains?(e) }
  end

  def disjoint?(other)
    self.set.all? { |e| !other.contains?e }
  end

  def eql?(other)
    self.set.sort == other.set.sort
  end

  def add(n)
    self.set << n
    self.set.uniq!
    self
  end

  def ==(other)
    self.set == other.set
  end

  def intersection(other)
    arr = self.set.intersection(other.set)
    CustomSet.new(arr)
  end

  def difference(other)
    intersect = intersection(other)
    arr = self.set.reject { |e| intersect.contains?(e) }
    CustomSet.new(arr)
  end

  def union(other)
    arr = self.set + other.set
    CustomSet.new(arr.sort)
  end

  protected

  attr_accessor :set
end
