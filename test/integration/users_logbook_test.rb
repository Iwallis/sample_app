require 'test_helper'

class UsersLogbookTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:iain)
  end

  test "logbook display" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'h1', text: @user.name
    assert_select 'h1>img.gravatar'
    assert_match @user.flights.count.to_s, response.body
    @user.flights.paginate(page: 1).each do |flight|
      assert_match flight.date.year.to_s + '/' +  flight.date.month.to_s + '/' +  flight.date.day.to_s, response.body
    end
  end
end
