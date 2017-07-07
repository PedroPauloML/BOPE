require 'test_helper'

class WeeksControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get weeks_edit_url
    assert_response :success
  end

end
