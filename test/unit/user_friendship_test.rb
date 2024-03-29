require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:friend)

  test "that creating a friendship works without raising an exception" do
    assert_nothing_raised do
    UserFriendship.create user: users(:daniel), friend: users(:dirty)
    end
  end

  test "that creating a friendship based on user id and driend id works" do
    UserFriendship.create user_id: users(:daniel).id, friend_id: users(:dirty).id
    assert users(:daniel).friends.include?(users(:dirty))
  end

end
