require 'test_helper'

class SprintsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sprints_index_url
    assert_response :success
  end

  test "should get show" do
    get sprints_show_url
    assert_response :success
  end

  test "should get new" do
    get sprints_new_url
    assert_response :success
  end

  test "should get edit" do
    get sprints_edit_url
    assert_response :success
  end

end
