require 'test_helper'

class ColorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get colors_index_url
    assert_response :success
  end

  test "should get new" do
    get colors_new_url
    assert_response :success
  end

  test "should get edit" do
    get colors_edit_url
    assert_response :success
  end

end
