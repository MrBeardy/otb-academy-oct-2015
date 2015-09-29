require 'alarm'

#
# the alarm doesnt turn on if it's within the range
# the alarom does turn on if it's outside the range

RSpec.describe "tyre pressure alarm" do
  it "should check can retrieve a float from the sensor object" do
    sensor = Sensor.new
    expect( Alarm.new( sensor ).check ).to be_a( Alarm )
  end

  it "should initially be off" do
    sensor = Sensor.new
    expect( Alarm.new(sensor).on? ).to be false
  end

  it "doesnt turn on if it's within the range" do
    sensor = SensorPassing.new

    expect( Alarm.new(sensor).check.on? ).to be false
  end

  it "turns on when outside range, and back off when inside range" do
    alarm = Alarm.new( SensorHigher.new )
    expect( alarm.check ).to be_on

    alarm.sensor = SensorPassing.new

    expect( alarm.check ).not_to be_on
  end

  it "turns the alarm on if it's outside of the range" do
    sensor = double("Sensor")
    allow(sensor).to receive(:sample_pressure).and_return( 25 )

    alarm = Alarm.new( sensor )

    expect( alarm.check ).to be_on
  end
  
  #
  # it "shows a TPMS low pressure warning icon when pressure is outside of range" do
  #   alarm = Alarm.new( SensorHigher.new )
  #   alarm.check
  #
  #   expect( alarm.to_s ).to eq "( ! )"
  # end
end
