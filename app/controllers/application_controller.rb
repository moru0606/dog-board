class ApplicationController < ActionController::Base
  include Pagy::Backend
  include SessionsHelper

  private

  def require_user_logged_in?
    redirect_to login_url unless logged_in?
  end

  def counts(user)
    @count_like = user.like_posts.count
  end
end