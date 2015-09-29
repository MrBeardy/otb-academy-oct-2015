require 'sensor'

class Notifier
  attr_accessor :out_of_bounds, :normal_range

  def initialize()
    @out_of_bounds = false
    @normal_range = true
  end
end

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
      if @notifier
        @notifier.out_of_bounds = false
        @notifier.normal_range  = true
      end

      @is_on = false
    else
      if @notifier
        @notifier.out_of_bounds = true
        @notifier.normal_range  = false
      end

      @is_on = true
    end

    self
  end

  def on?
    @is_on
  end
end
