require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "email mal formado" do
    assert_not users(:email_mal).save
  end

  test "email nulo" do
    assert_not users(:sin_email).save
  end

  test "admin nulo" do
    assert_not users(:sin_admin).save
  end

  test "datos completos" do
    assert users(:admin).save
    assert users(:normal).save
  end
end
