class AccountsController < ApplicationController
  before_action

  def index
    # TODO: Sort properly
    # Definitely have it descending (is that the right word? more recent
    # checkouts are shown higher on the list, probably sorted by time out, and
    # not by time in

    # TODO: Separate tables for overdue and out-but-not-overdue titles

    @records = Record.where(borrower: uniqname)
  end

  def history
    # TODO
    render inline: '<p>Not implemented.</p>', layout: true
  end

  def logout
    # TODO will this throw an error if the user is somehow directed to logout
    # but there is no cosign cookie?
    cookies.delete request.env["COSIGN_SERVICE"]
    redirect_to Rails.configuration.cosign_logout_path
  end
end
