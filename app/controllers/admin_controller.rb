class AdminController < ApplicationController
  before_action :require_administrator

  def require_administrator
    unless Rails.configuration.administrators.include? request.env['REMOTE_USER'].to_sym
      redirect_to unauthorized_path
    end
  end

  def index
  end
end
