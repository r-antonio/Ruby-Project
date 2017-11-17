require 'test_helper'

class SiteControllerTest < ActionController::TestCase
  test "should get index" do
    get site_index_url
    assert_response :success
  end

end
