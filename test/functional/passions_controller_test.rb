require 'test_helper'

class PassionsControllerTest < ActionController::TestCase
  setup do
    @passion = passions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:passions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create passion" do
    assert_difference('Passion.count') do
      post :create, :passion => @passion.attributes
    end

    assert_redirected_to passion_path(assigns(:passion))
  end

  test "should show passion" do
    get :show, :id => @passion.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @passion.to_param
    assert_response :success
  end

  test "should update passion" do
    put :update, :id => @passion.to_param, :passion => @passion.attributes
    assert_redirected_to passion_path(assigns(:passion))
  end

  test "should destroy passion" do
    assert_difference('Passion.count', -1) do
      delete :destroy, :id => @passion.to_param
    end

    assert_redirected_to passions_path
  end
end
