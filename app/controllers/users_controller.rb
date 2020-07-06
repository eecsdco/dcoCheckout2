class UsersController < ApplicationController
  before_action :require_administrator
  if Rails.env.production?
    before_action :require_login
  end

  def index
    @users = User.all
  end

  def create
    @existinguser = User.find_by(uniqname: params[:uniqname])
    if @existinguser
      flash.alert = "#{params[:uniqname]} is already a user"
    else
      @user = User.new(uniqname: params[:uniqname])
      @user.save
    end
    redirect_to users_path
  end

  def destroy
    @user = User.find_by(uniqname: params[:id])
    @user.destroy
    redirect_to users_path
  end
end
