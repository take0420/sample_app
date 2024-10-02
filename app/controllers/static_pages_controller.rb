class StaticPagesController < ApplicationController
  def home
    return unless logged_in?

    @micropost  = current_user.microposts.build
    @feed_items = current_user.feed.paginate(page: params[:page])
  end

  def help; end

  def about
    # app/views/static_pages/about.html.erb
  end

  def contact
    # app/views/static_pages/contact.html.erb
  end
end
