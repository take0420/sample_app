require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_response :unprocessable_entity
    assert_template 'sessions/new'
    assert_not flash.empty? # flashが空ではなく何かしらの値が入っている
    get root_path # 任意のページに遷移したら
    assert flash.empty? # flashが消える
  end
end
