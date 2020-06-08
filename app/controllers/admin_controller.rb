class AdminController < ApplicationController
  before_action :require_administrator
  if Rails.env.production?
    before_action :require_login
  end

  def index
    @pending_returns = Record.where(return_approved: nil).where.not(in: nil)
    @overdue = Record.where('? > due AND `in` IS NULL', [DateTime.current])
  end

  def unreturned
    @records = Record.where(in: nil).reorder(:due)
  end

  def longterm
    @records = Record.where(due: nil, in: nil)
  end
end
