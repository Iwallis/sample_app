require 'test_helper'

class UsersLogbookTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:iain)
    @current_user = @user
  end
  
end
