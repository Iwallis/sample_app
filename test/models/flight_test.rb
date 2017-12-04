require 'test_helper'

class FlightTest < ActiveSupport::TestCase

  def setup
    @user = users(:iain)
    # build puts an object in memory to work with but doesn't save to db
    @flight = @user.flights.build( date: 2.days.ago,
                                  aircraft_type: 'C-172',
                                  aircraft_ident: 'GBMO',
                                  pic: 'Iain Wallis',
                                  day_hours: 1.6,
                                  user_id: @user.id)
  end

  test "when asked order should be most recent first" do
    assert_equal flights(:most_recent), Flight.first
  end

  test "should be valid" do
    assert @flight.valid?
  end

  test "user id should be present" do
    @flight.user_id = nil
    assert_not @flight.valid?
  end

  test "date should be present" do
    @flight.date = "   "
    assert_not @flight.valid?
  end

  test "date should not be future" do
    @flight.date = 1.year.from_now
    assert_not @flight.valid?
    @flight.date = 1.day.from_now
    assert_not @flight.valid?
    @flight.date = 1.minute.from_now
    assert_not @flight.valid?
  end

  test "should have a pilot, theses aren't drones" do
    @flight.pic = nil
    assert_not @flight.valid?
  end

  test "should have at least 0.1 hours somewhere" do
    @flight.day_hours = 0
    assert_not @flight.valid?
  end

  test "can't fly for negative hours" do
    @flight.day_hours = -0.1
    assert_not @flight.valid?
  end

end
