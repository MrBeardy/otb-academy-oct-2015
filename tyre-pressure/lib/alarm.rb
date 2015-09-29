require 'sensor'

class Alarm
  attr_accessor :sensor, :notifier

  def initialize( sensor, notifier = nil )
    @sensor = sensor
    @notifier = notifier

    @is_on = false
  end

  def to_s
    if on?
      "( ! )"
    else
      ""
    end
  end

  def check()
    if (17.5 .. 21).include? @sensor.sample_pressure
      notifier.normal_range if notifier
      @is_on = false
    else
      notifier.out_of_bounds if notifier
      @is_on = true
    end

    self
  end

  def on?
    @is_on
  end
end
