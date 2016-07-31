class AdminController < ApplicationController
  before_action :require_login
  before_action :require_administrator
  def index
  end
end
