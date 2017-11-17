require 'test_helper'

class MediumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "imdb" do
    m = media(:padrino)
    m.imdb = nil
    assert_not m.save
    m.imdb = "tt0"
    assert_not m.save
    m.imdb = "tt0943259048525"
    assert_not m.save
  end

  test "title" do
    m = media(:padrino)
    m.title = nil
    assert_not m.save
  end

  test "rated" do
    m = media(:padrino)
    m.rated = nil
    assert_not m.save
    m.rated = "Rated"
    assert_not m.save
  end

  test "released" do
    m = media(:padrino)
    m.released = nil
    assert_not m.save
  end

  test "runtime" do
    m = media(:padrino)
    m.runtime = nil
    assert_not m.save
    m.runtime = 25.245
    assert_not m.save
  end

  test "synopsis" do
    m = media(:padrino)
    m.synopsis = nil
    assert_not m.save
  end

  test "airing" do
    m = media(:padrino)
    m.airing = nil
    assert_not m.save
  end

  test "airing time" do
    m = media(:padrino)
    m.airing = true
    m.airing_time = nil
    assert_not m.save
    m.airing_time = Date.new
    assert m.save
  end

  test "serie" do
    m = media(:padrino)
    m.serie = nil
    assert_not m.save
  end

  test "poster" do
    m = media(:padrino)
    m.poster = nil
    assert_not m.save
  end

  test "episodes" do
    m = media(:padrino)
    m.episodes = nil
    assert_not m.save
    m.episodes = 25.147
    assert_not m.save
  end

  test "datos completos" do
    m = media(:padrino)
    assert m.save
  end

end
