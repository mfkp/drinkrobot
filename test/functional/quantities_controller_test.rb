require 'test_helper'

class QuantitiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quantities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quantities" do
    assert_difference('Quantities.count') do
      post :create, :quantities => { }
    end

    assert_redirected_to quantities_path(assigns(:quantities))
  end

  test "should show quantities" do
    get :show, :id => quantities(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => quantities(:one).id
    assert_response :success
  end

  test "should update quantities" do
    put :update, :id => quantities(:one).id, :quantities => { }
    assert_redirected_to quantities_path(assigns(:quantities))
  end

  test "should destroy quantities" do
    assert_difference('Quantities.count', -1) do
      delete :destroy, :id => quantities(:one).id
    end

    assert_redirected_to quantities_path
  end
end
