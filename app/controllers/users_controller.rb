class UsersController < ApplicationController
  before_action :require_login, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      reset_session
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # => GET /users/:id
      # redirect_to user_url(@user)    # GET /users/:id
      # redirect_to user_url(@user.id) # GET /users/2
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find_by(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  private

    # Strong Parameters
    def user_params
      params.require(:user).permit(:name, :email, :password, 
                                   :password_confirmation)
    end

    # beforeフィルタ

    # ログイン済みのユーザーか確認
    def logged_in_user
      unless logged_in_user?
        flash[:danger]= "Please log in."
        redirect_to login_url, status: :see_other
      end
    end
end
