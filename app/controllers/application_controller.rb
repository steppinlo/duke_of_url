class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def new_link
    link = SecureRandom.urlsafe_base64(5)
    if Url.find_by(shortened: link)
      new_link
    else
      return link
    end
  end
end
