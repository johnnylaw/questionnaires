class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  def user_uuid
    @user_uuid = begin
      cookies[:user_uuid] ||= SecureRandom.uuid
    end
  end
  helper_method :user_uuid

end
