require 'test_helper'

class MegatilesControllerTest < ActionController::TestCase
  setup do
    @megatile = megatiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:megatiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create megatile" do
    assert_difference('Megatile.count') do
      post :create, :megatile => @megatile.attributes
    end

    assert_redirected_to megatile_path(assigns(:megatile))
  end

  test "should show megatile" do
    get :show, :id => @megatile.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @megatile.to_param
    assert_response :success
  end

  test "should update megatile" do
    put :update, :id => @megatile.to_param, :megatile => @megatile.attributes
    assert_redirected_to megatile_path(assigns(:megatile))
  end

  test "should destroy megatile" do
    assert_difference('Megatile.count', -1) do
      delete :destroy, :id => @megatile.to_param
    end

    assert_redirected_to megatiles_path
  end
end
