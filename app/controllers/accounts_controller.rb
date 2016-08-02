class AccountsController < ApplicationController
  def index
    render inline: "<p>Not implemented</p>", layout: true
  end

  def logout
    cookies.delete request.env["COSIGN_SERVICE"]
    redirect_to Rails.configuration.cosign_logout_path
  end
end
