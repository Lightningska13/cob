require 'test_helper'

class AnimalsControllerTest < ActionController::TestCase
  setup do
    @animal = animals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:animals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create animal" do
    assert_difference('Animal.count') do
      post :create, :animal => { :ac_id => @animal.ac_id, :adoptable => @animal.adoptable, :age => @animal.age, :arrival_date => @animal.arrival_date, :breed => @animal.breed, :description => @animal.description, :final_date => @animal.final_date, :location => @animal.location, :pic_content_type => @animal.pic_content_type, :pic_file_name => @animal.pic_file_name, :pic_file_size => @animal.pic_file_size, :release_date => @animal.release_date, :sex => @animal.sex, :species => @animal.species }
    end

    assert_redirected_to animal_path(assigns(:animal))
  end

  test "should show animal" do
    get :show, :id => @animal
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @animal
    assert_response :success
  end

  test "should update animal" do
    put :update, :id => @animal, :animal => { :ac_id => @animal.ac_id, :adoptable => @animal.adoptable, :age => @animal.age, :arrival_date => @animal.arrival_date, :breed => @animal.breed, :description => @animal.description, :final_date => @animal.final_date, :location => @animal.location, :pic_content_type => @animal.pic_content_type, :pic_file_name => @animal.pic_file_name, :pic_file_size => @animal.pic_file_size, :release_date => @animal.release_date, :sex => @animal.sex, :species => @animal.species }
    assert_redirected_to animal_path(assigns(:animal))
  end

  test "should destroy animal" do
    assert_difference('Animal.count', -1) do
      delete :destroy, :id => @animal
    end

    assert_redirected_to animals_path
  end
end
