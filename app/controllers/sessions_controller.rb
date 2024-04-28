class SessionsController < ApplicationController
  def new
    # × @session = Session.new
    # ◯ scope: :session + url: login_path
  end

  # POST /login
  def create
    user = User.find_by(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      # Success
      # login(@user)
    else
      # Failure
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
  end
end
