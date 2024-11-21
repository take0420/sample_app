require 'test_helper'

class Following < ActionDispatch::IntegrationTest
  def setup
    @user  = users(:michael)
    @other = users(:archer)
    log_in_as(@user)
  end
end

class FollowPagesTest < Following
  test 'following page' do
    get following_user_path(@user)
    assert_response :success
    assert_not @user.following.empty?
    assert_match @user.following.count.to_s, response.body
    @user.following.each do |user|
      assert_select 'a[href=?]', user_path(user)
    end
  end

  test 'followers page' do
    get followers_user_path(@user)
    assert_response :success
    assert_not @user.followers.empty?
    assert_match @user.followers.count.to_s, response.body
    @user.followers.each do |user|
      assert_select 'a[href=?]', user_path(user)
    end
  end
end

class FollowTest < Following

  test "should follow a user the standard way" do
    assert_difference "@user.following.count", 1 do
      post relationships_path, params: { followed_id: @other.id }
    end
    assert_redirected_to @other

  test "should follow a user with Hotwire" do
    assert_difference "@user.following.count", 1 do
      post relationships_path(format: :turbo_stream),
           params: { followed_id: @other.id }
    end
  end

  end
