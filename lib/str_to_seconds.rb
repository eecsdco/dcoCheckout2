class String
  def to_seconds
    # first, remove all non alphanumeric characters (including spaces)
    string = self.gsub /[^A-Za-z0-9]+/, ''
    # then, change full words into letters for easy parsing
    # note: both 'year' and 'years' translate into 'y'
    # going to assume here that no one is using times > years
    string.sub! /years?/, 'y'
    # no month's b/c that's not a definitive unit of time
    string.sub! /weeks?/, 'w'
    string.sub! /days?/, 'd'
    string.sub! /hours?/, 'h'
    string.sub! /minutes?/, 'm'
    string.sub! /seconds?/, 's'

    # find all the units of the time string (eg. "4y", "3d", "10h", "7m")
    units = string.scan /\d+\w/

    # now lets find the total number of seconds
    seconds = 0
    units.each do |unit|
      seconds += _unit_to_seconds unit
    end
    return seconds
  end

  def _unit_to_seconds(unit)
    # the length of time is represented by the last character
    period = unit[-1]
    # the number of these periods is the other part of the string
    number = unit[0..-2].to_i
    return case period
    when 'y'
      number * 31536000
    when 'w'
      number * 604800
    when 'd'
      number * 86400
    when 'h'
      number * 3600
    when 'm'
      number * 60
    else # aka when 's'
      number
    end
  end
end

class Integer
  def to_human_time
    remaining = self
    y = remaining / 31536000
    remaining -= y * 31536000
    w = remaining / 604800
    remaining -= w * 604800
    d = remaining / 86400
    remaining -= d * 86400
    h = remaining / 3600
    remaining -= h * 3600
    m = remaining / 60
    remaining -= m * 60
    s = remaining
    
    human_str = ""
    if y > 0
      human_str += y.to_s + (y == 1 ? " year, " : " years, ")
    end
    if w > 0
      human_str += w.to_s + (w == 1 ? " week, " : " weeks, ")
    end
    if d > 0
      human_str += d.to_s + (d == 1 ? " day, " : " days, ")
    end
    if h > 0
      human_str += h.to_s + (h == 1 ? " hour, " : " hours, ")
    end
    if m > 0
      human_str += m.to_s + (m == 1 ? " minute, " : " minutes, ")
    end
    if s > 0
      human_str += s.to_s + (s == 1 ? " second, " : " seconds, ")
    end
    human_str = human_str[0..-3]
    return human_str
  end
end
