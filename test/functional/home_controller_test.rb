require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get left" do
    get :left
    assert_response :success
  end

  test "should get right" do
    get :right
    assert_response :success
  end

  test "should get up" do
    get :up
    assert_response :success
  end

  test "should get down" do
    get :down
    assert_response :success
  end

  test "should get center" do
    get :center
    assert_response :success
  end

end
