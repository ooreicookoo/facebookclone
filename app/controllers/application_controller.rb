class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  def authenticate_with_http_digest
    if current_user == nil
      flash[:denger] = 'ログインが必要です'
      redirect_to new_session_path
    end
  end
end
