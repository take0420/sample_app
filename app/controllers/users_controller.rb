class UsersController < ApplicationController
  def new
    # => GET app/views/users/new.html.erb
  end

  def show
    @user = User.find(params[:id])
  end
end
