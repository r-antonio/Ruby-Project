require 'test_helper'

class MediaControllerTest < ActionController::TestCase

  include Devise::Test::ControllerHelpers

  setup do
    @medium = media(:batman)
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

  test "should create medium" do
    assert_difference('Medium.count') do
      post :create, params: { medium: { airing: @medium.airing, airing_time: @medium.airing_time, episodes: @medium.episodes, imdb: @medium.imdb, poster: @medium.poster, rated: @medium.rated, released: @medium.released, runtime: @medium.runtime, serie: @medium.serie, synopsis: @medium.synopsis, title: @medium.title } }
    end

    assert_redirected_to medium_path(Medium.last)
  end

  test "should show medium" do
    get :show, params: { id: @medium.id }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @medium.id }
    assert_response :success
  end

  test "should update medium" do
    patch :update, params: { id: @medium.id, medium: { airing: @medium.airing, airing_time: @medium.airing_time, episodes: @medium.episodes, imdb: @medium.imdb, poster: @medium.poster, rated: @medium.rated, released: @medium.released, runtime: @medium.runtime, serie: @medium.serie, synopsis: @medium.synopsis, title: @medium.title } }
    assert_redirected_to medium_path(@medium)
  end
end
