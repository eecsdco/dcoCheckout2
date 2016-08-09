class AdminController < ApplicationController
  before_action :require_login
  before_action :require_administrator
  def index
    @pending_returns = Record.where("[in] IS NOT NULL AND return_approved IS NULL")
    @overdue = Record.where("? > due AND [in] IS NULL", [DateTime.current])
  end
end
