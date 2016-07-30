class AccountController < ApplicationController
  def index
  end

  def logout
    cookies.delete request.env["COSIGN_SERVICE"]
    redirect_to Rails.configuration.cosign_logout_path
  end
end
