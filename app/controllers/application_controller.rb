class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  force_ssl
  helper_method :login_path, :logout_path, :uniqname, :logged_in?, :administrator?
  def login_path
    path = Rails.configuration.cosign_login_path
    if path[-1] = "/"
      path = path[0..-2] # remove trailing /
    end
    path += request.original_fullpath
    return path
  end

  def require_login
    if request.env['REMOTE_USER'].nil? and cookies[:view_as].nil?
      redirect_to login_path
    end
  end

  def uniqname
    if Rails.env.development?
      if params[:view_as]
        cookies[:view_as] = params[:view_as]
        return cookies[:view_as]
      elsif cookies[:view_as]
        return cookies[:view_as]
      end
      request.env['REMOTE_USER']
    end
  end

  def logged_in?
    not uniqname.nil?
  end

  def administrator?
    unless uniqname.nil?
      Rails.configuration.administrators.include? uniqname.to_sym
    else
      false
    end
  end

  def require_administrator
    # TODO the logic here is kind of iffy
    if logged_in?
      unless administrator?
        redirect_to unauthorized_path
      end
    else
      redirect_to login_path
    end
  end

end
