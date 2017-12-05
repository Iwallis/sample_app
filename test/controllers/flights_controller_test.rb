require 'test_helper'

class FlightsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @flight = flights(:one)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Flight.count' do
      post flights_path, params: { flight: { pic: "Bob McBob" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Flight.count' do
      delete flight_path(@flight)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong flight" do
    log_in_as(users(:archer))
    flight = flights(:one)
    assert_no_difference 'Flight.count' do
      delete flight_path(flight)
    end
    assert_redirected_to root_url
  end
end
