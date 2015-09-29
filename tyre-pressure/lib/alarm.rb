require 'sensor'

class SensorLower < Sensor
  def sample_pressure
    15
  end
end

class SensorHigher < Sensor
  def sample_pressure
    25
  end
end

class SensorPassing < Sensor
  def sample_pressure
    18
  end
end

class Alarm
  attr_accessor :sensor

  def initialize( sensor )
    @sensor = sensor
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
      @is_on = false
    else
      @is_on = true
    end

    self
  end

  def on?
    @is_on
  end
end
