require 'test_helper'

class IngredientsRecipesQuantitiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ingredients_recipes_quantities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ingredients_recipes_quantities" do
    assert_difference('IngredientsRecipesQuantities.count') do
      post :create, :ingredients_recipes_quantities => { }
    end

    assert_redirected_to ingredients_recipes_quantities_path(assigns(:ingredients_recipes_quantities))
  end

  test "should show ingredients_recipes_quantities" do
    get :show, :id => ingredients_recipes_quantities(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => ingredients_recipes_quantities(:one).id
    assert_response :success
  end

  test "should update ingredients_recipes_quantities" do
    put :update, :id => ingredients_recipes_quantities(:one).id, :ingredients_recipes_quantities => { }
    assert_redirected_to ingredients_recipes_quantities_path(assigns(:ingredients_recipes_quantities))
  end

  test "should destroy ingredients_recipes_quantities" do
    assert_difference('IngredientsRecipesQuantities.count', -1) do
      delete :destroy, :id => ingredients_recipes_quantities(:one).id
    end

    assert_redirected_to ingredients_recipes_quantities_path
  end
end
