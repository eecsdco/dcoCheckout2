class AdminController < ApplicationController
  before_action :require_login
  before_action :require_administrator
  def index
    @pending_returns = Record.where(return_approved: nil).where.not(in: nil)
    @overdue = Record.where('? > due AND `in` IS NULL', [DateTime.current])
  end
end
