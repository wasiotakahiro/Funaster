require 'test_helper'

class FunastarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @funastar = funastars(:one)
  end

  test "should get index" do
    get funastars_url
    assert_response :success
  end

  test "should get new" do
    get new_funastar_url
    assert_response :success
  end

  test "should create funastar" do
    assert_difference('Funastar.count') do
      post funastars_url, params: { funastar: { caption: @funastar.caption, image: @funastar.image } }
    end

    assert_redirected_to funastar_url(Funastar.last)
  end

  test "should show funastar" do
    get funastar_url(@funastar)
    assert_response :success
  end

  test "should get edit" do
    get edit_funastar_url(@funastar)
    assert_response :success
  end

  test "should update funastar" do
    patch funastar_url(@funastar), params: { funastar: { caption: @funastar.caption, image: @funastar.image } }
    assert_redirected_to funastar_url(@funastar)
  end

  test "should destroy funastar" do
    assert_difference('Funastar.count', -1) do
      delete funastar_url(@funastar)
    end

    assert_redirected_to funastars_url
  end
end
