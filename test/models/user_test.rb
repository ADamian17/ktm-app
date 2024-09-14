require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "new user not valid" do
    user = User.new(first_name: "Test", last_name: "User", password: "password")
    assert_not user.valid?
  end

  test "new user valid" do
    user = User.new(first_name: "Test", last_name: "User", email: "test.user@example.com", password: "password")
    assert user.valid?
  end
end
