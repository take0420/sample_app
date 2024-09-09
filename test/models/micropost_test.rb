require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @micropost = @user.microposts.build(content: 'Lorem ipsum')
  end

  # micropost が正しいか
  test 'should be valid' do
    assert @micropost.valid?
  end

  # user_id が存在するか
  test 'user id should be present' do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  # 投稿が存在するか
  test 'content should be present' do
    @micropost.content = ' '
    assert_not @micropost.valid?
  end

  # 投稿の最大文字数が140字以下であるか
  test 'content should be at most 140 charactres' do
    @micropost.content = 'a' * 141
    assert_not @micropost.valid?
  end
end
