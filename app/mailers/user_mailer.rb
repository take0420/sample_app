class UserMailer < ApplicationMailer
  def account_activation(user)
    @user = user
    mail to: user.email.to_s, subject: 'Account activation'.to_s
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: 'Password reset'
  end
end
