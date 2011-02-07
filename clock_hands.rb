require 'gosu'
require 'clock_hand'

class MilliHand < Hand
  def set_angle
    self.angle  = (360.0/1000) * (time.usec/1000.0)
  end
end

class SecondHand < Hand
  def set_angle
    self.angle  = (360.0/60) * (time.sec + (time.usec/1000.0/1000.0))
  end
end

class MinuteHand < Hand
  def set_angle
    self.angle  = (360.0/60) * (time.min + time.sec/60.0)
  end
end

class HourHand < Hand
  def set_angle
    self.angle = (360.0/12) * ((time.hour % 12) + time.min/60.0)
  end
end
