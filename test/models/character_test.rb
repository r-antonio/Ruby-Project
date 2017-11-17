require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "nombre demasiado largo" do
    assert_not characters(:nombre_largo).save
  end

  test "nombre nulo" do
    assert_not characters(:sin_nombre).save
  end

  test "sin biografia" do
    assert_not characters(:sin_bio).save
  end

  test "datos completos" do
    assert characters(:luke).save
  end
end
