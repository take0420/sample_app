require 'test_helper'

class PasswordResetsTest < ActionDispatch::IntegrationTest
  def setup
    ActionMailer::Base.deliveries.clear
  end
end

class ForgotPasswordFormTest < PasswordResetsController
  test 'password reset path' do
    get new_password_reset_path
    assert_template 'password_resets/new'
    assert_selet 'input[name=?]', 'password_reset[email]'
  end
end
