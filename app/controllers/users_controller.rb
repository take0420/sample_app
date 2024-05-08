class UsersController < ApplicationController
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

  private

    # Strong Parameters
    def user_params
      params.require(:user).permit(:name, :email, :password, 
                                   :password_confirmation)
    end
end
