require 'test_helper'

class MacroActivitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get macro_activities_index_url
    assert_response :success
  end

  test "should get show" do
    get macro_activities_show_url
    assert_response :success
  end

  test "should get new" do
    get macro_activities_new_url
    assert_response :success
  end

  test "should get edit" do
    get macro_activities_edit_url
    assert_response :success
  end

end
