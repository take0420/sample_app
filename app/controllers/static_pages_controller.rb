class StaticPagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build if logged_in?
  end

  def help; end

  def about
    # app/views/static_pages/about.html.erb
  end

  def contact
    # app/views/static_pages/contact.html.erb
  end
end
