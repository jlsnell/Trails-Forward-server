require 'test_helper'

class ResourceTilesControllerTest < ActionController::TestCase
  setup do
    @resource_tile = resource_tiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resource_tiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resource_tile" do
    assert_difference('ResourceTile.count') do
      post :create, :resource_tile => @resource_tile.attributes
    end

    assert_redirected_to resource_tile_path(assigns(:resource_tile))
  end

  test "should show resource_tile" do
    get :show, :id => @resource_tile.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @resource_tile.to_param
    assert_response :success
  end

  test "should update resource_tile" do
    put :update, :id => @resource_tile.to_param, :resource_tile => @resource_tile.attributes
    assert_redirected_to resource_tile_path(assigns(:resource_tile))
  end

  test "should destroy resource_tile" do
    assert_difference('ResourceTile.count', -1) do
      delete :destroy, :id => @resource_tile.to_param
    end

    assert_redirected_to resource_tiles_path
  end
end
