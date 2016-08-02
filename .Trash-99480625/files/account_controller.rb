class AccountsController < ApplicationController
  def index
    render inline: "Not implemented", layout: true
  end

  def logout
    cookies.delete request.env["COSIGN_SERVICE"]
    redirect_to Rails.configuration.cosign_logout_path
  end
end
