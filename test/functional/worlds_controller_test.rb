require 'test_helper'

class WorldsControllerTest < ActionController::TestCase
  setup do
    @world = worlds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:worlds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create world" do
    assert_difference('World.count') do
      post :create, :world => @world.attributes
    end

    assert_redirected_to world_path(assigns(:world))
  end

  test "should show world" do
    get :show, :id => @world.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @world.to_param
    assert_response :success
  end

  test "should update world" do
    put :update, :id => @world.to_param, :world => @world.attributes
    assert_redirected_to world_path(assigns(:world))
  end

  test "should destroy world" do
    assert_difference('World.count', -1) do
      delete :destroy, :id => @world.to_param
    end

    assert_redirected_to worlds_path
  end
end
