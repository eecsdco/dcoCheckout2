class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  force_ssl
  helper_method :login_path, :logout_path, :uniqname, :logged_in?,
    :administrator?, :current_office_id, :checkout_computer?,
    :authorized_to_checkout?
  
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
    if logged_in?
      unless administrator?
        redirect_to unauthorized_path
      end
    else
      redirect_to login_path
    end
  end

  def current_office_id
    if params[:office_id]
      params[:office_id]
    else
      Rails.configuration.checkout_computers[request.remote_addr]
    end
  end

  def checkout_computer?
    request.remote_addr.in? Rails.configuration.checkout_computers
  end

  def authorized_to_checkout?
    administrator? or checkout_computer?
  end

  def require_checkout_authorization
    unless authorized_to_checkout?
      redirect_to unauthorized_path
    end
  end

end
