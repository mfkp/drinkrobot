require 'test_helper'

class IngredientsRecipesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ingredients_recipes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ingredients_recipes" do
    assert_difference('IngredientsRecipes.count') do
      post :create, :ingredients_recipes => { }
    end

    assert_redirected_to ingredients_recipes_path(assigns(:ingredients_recipes))
  end

  test "should show ingredients_recipes" do
    get :show, :id => ingredients_recipes(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => ingredients_recipes(:one).id
    assert_response :success
  end

  test "should update ingredients_recipes" do
    put :update, :id => ingredients_recipes(:one).id, :ingredients_recipes => { }
    assert_redirected_to ingredients_recipes_path(assigns(:ingredients_recipes))
  end

  test "should destroy ingredients_recipes" do
    assert_difference('IngredientsRecipes.count', -1) do
      delete :destroy, :id => ingredients_recipes(:one).id
    end

    assert_redirected_to ingredients_recipes_path
  end
end
