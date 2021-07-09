class Triangle
  def initialize(*sides)
    raise ArgumentError if invalid?(sides)
    @sides = sides
  end

  def invalid?(arr)
    return true if arr.any? { |e| e <= 0 }
    m = arr.max
    if m >= arr[0] + arr[1] ||
       m >= arr[0] + arr[2] ||
       m >= arr[1] + arr[2]
      return true
    end
    false
  end

  def kind
    case
    when equilateral?
      'equilateral'
    when isosceles?
      'isosceles'
    else
      'scalene'
    end
  end

  def equilateral?
    @sides[0] == @sides[1] && @sides[0] == @sides[2]
  end

  def isosceles?
    count = 0
    prev = [@sides[0]]
    i = 1
    loop do
      count += 1 if prev.include?(@sides[i])
      prev << @sides[i]
      i += 1
      break if i == @sides.size
    end
    count == 1
  end
end
