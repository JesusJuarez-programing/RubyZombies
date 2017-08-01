require 'test_helper'

class BrainsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @brain = brains(:one)
  end

  test "should get index" do
    get brains_url
    assert_response :success
  end

  test "should get new" do
    get new_brain_url
    assert_response :success
  end

  test "should create brain" do
    assert_difference('Brain.count') do
      post brains_url, params: { brain: { flavor: @brain.flavor } }
    end

    assert_redirected_to brain_url(Brain.last)
  end

  test "should show brain" do
    get brain_url(@brain)
    assert_response :success
  end

  test "should get edit" do
    get edit_brain_url(@brain)
    assert_response :success
  end

  test "should update brain" do
    patch brain_url(@brain), params: { brain: { flavor: @brain.flavor } }
    assert_redirected_to brain_url(@brain)
  end

  test "should destroy brain" do
    assert_difference('Brain.count', -1) do
      delete brain_url(@brain)
    end

    assert_redirected_to brains_url
  end
end
