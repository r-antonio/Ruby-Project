require 'test_helper'

class EntryTest < ActiveSupport::TestCase

  test "user" do
    e = entries(:one)
    e.user = nil
    assert_not e.save
  end

  test "medium" do
    e = entries(:one)
    e.medium = nil
    assert_not e.save
  end

  test "caps" do
    e = entries(:one)
    e.caps = nil
    assert_not e.save
    e.caps = -1
    assert_not e.save
    e.caps = e.medium.episodes+1
    assert_not e.save
    e.caps = 10.2
    assert_not e.save
  end

  test "rating" do
    e = entries(:one)
    e.rating = nil
    assert e.save
    e.rating = -1
    assert_not e.save
    e.rating = 11
    assert_not e.save
    e.rating = 7.2
    assert_not e.save
  end

  test "state" do
    e = entries(:one)
    e.state = nil
    assert_not e.save
    e.state = 0
    assert_not e.save
    e.state = 4
    assert_not e.save
    e.state = 2.1
    assert_not e.save
  end

  test "date start" do
    e = entries(:one)
    e.date_start = nil
    assert_not e.save
  end

  test "datos completos" do
    e = entries(:one)
    assert e.save
  end

end
