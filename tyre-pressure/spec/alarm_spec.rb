require 'alarm'

LOW_PRESSURE  = 15
HIGH_PRESSURE = 25
PASSING_PRESSURE = 20

RSpec.describe "tyre pressure alarm" do
  context("basic tests") do
    it "should check can retrieve a float from the sensor object" do
      sensor = Sensor.new
      expect( Alarm.new( sensor ).check ).to be_a( Alarm )
    end

    it "should initially be off" do
      sensor = Sensor.new
      expect( Alarm.new(sensor).on? ).to be false
    end

    it "doesnt turn on if it's within the range" do
      sensor = double("Sensor", sample_pressure: PASSING_PRESSURE)

      expect( Alarm.new(sensor).check.on? ).to be false
    end

    it "turns on when outside range, and back off when inside range" do
      sensor = double("Sensor", sample_pressure: HIGH_PRESSURE)
      alarm = Alarm.new( sensor )
      expect( alarm.check ).to be_on

      sensor = double("Sensor", sample_pressure: PASSING_PRESSURE)

      alarm.sensor = sensor

      expect( alarm.check ).not_to be_on
    end

    it "turns the alarm on if it's outside of the range" do
      sensor = double("Sensor", sample_pressure: HIGH_PRESSURE)

      alarm = Alarm.new( sensor )

      expect( alarm.check ).to be_on
    end

    it "shows a TPMS low pressure warning icon when pressure is outside of range" do
      sensor = double("Sensor", sample_pressure: HIGH_PRESSURE)
      alarm = Alarm.new( sensor )

      expect( alarm.check.to_s ).to eq "( ! )"
    end
  end

  context("notifiers",  notifiers: true) do
    it "should initially return true for .normal_range" do
      sensor = double("Sensor", sample_pressure: PASSING_PRESSURE)
      notifier = Notifier.new

      alarm = Alarm.new(sensor, notifier)
      alarm.check

      expect( alarm.notifier.normal_range ).to be true
    end

    it "should set .out_of_bounds to true when out of range" do
      sensor = double("Sensor", sample_pressure: HIGH_PRESSURE)
      notifier = Notifier.new

      alarm = Alarm.new(sensor, notifier)
      alarm.check

      expect( alarm.notifier.out_of_bounds ).to be true
      expect( alarm.notifier.normal_range  ).to be false
    end
  end
end
