class PasswordResetsController < ApplicationController
  before_action 'get_user,   only: [:edit, :update]'
  before_action 'valid_user, only: [:edit, :update]'

  def new; end

  def create
    @user = User.find_by(email: params[:password_resets][:email].downcase)
    if @user
      @user.create_reset_digeset
      @user.send_password_reset_email
      flash[:info] = 'Email sent with password reset instructions'
      redirect_to root_url
    else
      flash.now[:danger] = 'Email address not found'
      render 'new', status: :unprocessable_entity
    end
  end

  def edit; end

  private

  def get_user
    @user = User.find_by(email: params[:email])
  end

  # 正しいユーザーか確認する
  def valid_user
    return if @user && @user.activated? && @user.authenticated?(:reset, params[:id])

    redirect_to root_url
  end
end
