require 'test_helper'
class SiteControllerTest < ActionController::TestCase

  include Devise::Test::ControllerHelpers

  test "should get index" do
    get :index
    assert_response :success
  end

end
