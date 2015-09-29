require 'alarm'

#
# the alarm doesnt turn on if it's within the range
# the alarom does turn on if it's outside the range

RSpec.describe "tyre pressure alarm" do
  it "should check can retrieve a float from the sensor object" do
    sensor = Sensor.new
    expect( Alarm.new( sensor ).check ).to be_a(Float)
  end

  it "should initially be off" do
    sensor = Sensor.new
    expect( Alarm.new(sensor).on? ).to be false
  end

  it "doesnt turn on if it's within the range" do
    sensor = SensorPassing.new
    alarm = Alarm.new( sensor )
    alarm.check

    expect( alarm.on? ).to be false
  end

  it "turns on when outside range, and back off when inside range" do
    alarm = Alarm.new( SensorHigher.new )
    alarm.check

    expect( alarm.on? ).to be true

    alarm.sensor = SensorPassing.new
    alarm.check

    expect( alarm.on? ).to be false
  end

  it "turns the alarm on if it's outside of the range" do
    alarm = Alarm.new( SensorHigher.new )
    alarm.check

    expect( alarm.on? ).to be true

    alarm = Alarm.new( SensorLower.new )
    alarm.check

    expect( alarm.on? ).to be true
  end

  it "shows a TPMS low pressure warning icon when pressure is outside of range" do
    alarm = Alarm.new( SensorHigher.new )
    alarm.check

    expect( alarm.to_s ).to eq "( ! )"
  end
end
