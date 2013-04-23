require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  test "should get capacity" do
    get :capacity
    assert_response :success
  end

  test "should get stock" do
    get :stock
    assert_response :success
  end

  test "should get sales" do
    get :sales
    assert_response :success
  end

  test "should get trends" do
    get :trends
    assert_response :success
  end

end
