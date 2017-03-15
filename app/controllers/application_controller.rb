class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied, with: :access_denied

  private

  def access_denied
    flash[:info] = 'Access denied'
    redirect_to root_url
  end
end
