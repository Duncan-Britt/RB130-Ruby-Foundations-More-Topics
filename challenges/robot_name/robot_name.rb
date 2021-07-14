class Robot
  @@robots = []

  def initialize
    @name = initial_name
    @@robots << self
  end

  def name
    return @name if @name

    @name = initial_name
  end

  def reset
    @name = nil
  end

  private

  def initial_name
    str = ''
    str << (rand(25) + 65).chr
    str << (rand(25) + 65).chr
    str << rand(1000).to_s
    str = initial_name if @@robots.any? { |robot| robot != self && robot.name == str }
    str
  end
end
