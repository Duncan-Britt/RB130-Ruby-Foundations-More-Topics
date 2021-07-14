require 'date'

class Meetup
  WEEKDAYS = {
    sunday: 0,
    monday: 1,
    tuesday: 2,
    wednesday: 3,
    thursday: 4,
    friday: 5,
    saturday: 6
  }

  NTH = {
    first: 0,
    second: 1,
    third: 2,
    fourth: 3,
    fifth: 4
  }

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, nth)
    calendar = {}
    i = Date.civil(@year, @month)
    while i.month == @month
      calendar[i] = i.wday
      i = i.next_day
    end

    calendar = calendar.select { |_, wday| wday == WEEKDAYS[weekday.downcase.to_sym] }
    if nth =~ /last/i
      d = calendar.keys.last
    elsif nth =~ /teenth/i
      calendar.select! { |date, _| date.mday >= 13 && date.mday <= 20 }
      d = calendar.keys.last
    else
      d = calendar.keys[NTH[nth.downcase.to_sym]]
    end

    return nil unless d

    d = d.mday

    Date.civil(@year, @month, d)
  end
end

meetup = Meetup.new(2021, 4)
