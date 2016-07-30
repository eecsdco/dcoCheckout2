class RecordsController < ApplicationController
  before_action :require_login

  def checkout
    render plain: "Not implemented"
  end

  def checkout_post
    render plain: "Not implemented"
  end

  def return
    render plain: "Not implemented"
  end

  def return_post
    render plain: "Not implemented"
  end
end
