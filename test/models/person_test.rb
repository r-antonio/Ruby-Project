require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "nombre demasiado largo" do
    assert_not people(:nombre_largo).save
  end

  test "nombre nulo" do
    assert_not people(:sin_name).save
  end

  test "sin biografia" do
    assert_not people(:sin_bio).save
  end

  test "datos completos" do
    assert people(:hamill).save
  end
end
