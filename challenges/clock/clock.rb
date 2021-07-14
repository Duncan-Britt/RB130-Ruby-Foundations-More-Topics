module Clock
  MINUTES_PER_HOUR = 60

  def self.at(*time)
    hours = time[0]
    minutes = (time[1] || 0)
    total_minutes = (hours * MINUTES_PER_HOUR + minutes) % 1440
    ClockTime.new(total_minutes)
  end

  class ClockTime
    def initialize(time)
      @time = time
    end

    def +(minutes)
      @time = (@time + minutes) % 1440
      self
    end

    def -(minutes)
      @time = (@time - minutes) % 1440
      self
    end

    def ==(other)
      time == other.time
    end

    def to_s
      hours, minutes = @time.divmod(MINUTES_PER_HOUR)
      sprintf("%.2d:%.2d", hours, minutes)
    end

    protected

    attr_reader :time
  end
end
