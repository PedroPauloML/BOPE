require 'test_helper'

class TeamUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get team_users_index_url
    assert_response :success
  end

  test "should get new" do
    get team_users_new_url
    assert_response :success
  end

  test "should get edit" do
    get team_users_edit_url
    assert_response :success
  end
end
