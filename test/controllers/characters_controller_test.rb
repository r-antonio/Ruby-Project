require 'test_helper'

class CharactersControllerTest < ActionController::TestCase

  include Devise::Test::ControllerHelpers

  setup do
    @character = characters(:luke)
    sign_in users(:admin)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create character" do
    assert_difference('Character.count') do
      post :create, params: { character: { bio: @character.bio, name: @character.name } }
    end

    assert_redirected_to character_path(Character.last)
  end

  test "should show character" do
    get :show, params: { id: @character.id }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @character.id }
    assert_response :success
  end

  test "should update character" do
    patch :update, params: { id: @character.id, character: { bio: @character.bio, name: @character.name } }
    assert_redirected_to character_path(@character)
  end

  test "should destroy character" do
    assert_difference('Character.count', -1) do
      delete :destroy, params: { id: @character.id }
    end

    assert_redirected_to characters_path
  end
end
