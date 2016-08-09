class AccountsController < ApplicationController
  def index
    @records = Record.where(borrower: uniqname)
  end

  def logout
    cookies.delete request.env["COSIGN_SERVICE"]
    redirect_to Rails.configuration.cosign_logout_path
  end
end
