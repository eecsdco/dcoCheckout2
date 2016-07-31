class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :login_path, :logout_path, :uniqname, :logged_in?
  def login_path
    path = Rails.configuration.cosign_login_path
    if path[-1] = "/"
      path = path[0..-2] # remove trailing /
    end
    path += request.original_fullpath
    return path
  end

  def require_login
    if request.env['REMOTE_USER'].nil?
      redirect_to login_path
    end
  end

  def uniqname
    request.env['REMOTE_USER']
  end

  def logged_in?
    not uniqname.nil?
  end

  def administrator?
    Rails.configuration.administrators.include? uniqname.to_sym
  end

  def require_administrator
    if logged_in?
      unless administrator?
        redirect_to unauthorized_path
      end
    else
      redirect_to login_path
    end
  end

end
