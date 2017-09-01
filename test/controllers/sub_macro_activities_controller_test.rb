require 'test_helper'

class SubMacroActivitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sub_macro_activities_new_url
    assert_response :success
  end

  test "should get edit" do
    get sub_macro_activities_edit_url
    assert_response :success
  end

end
