class AccountsController < ApplicationController
  # require login before letting someone access their account (duh)
  # excluding logout so that if somehow, someone is directed to the logout
  # link, but is, in fact, NOT logged in, they won't be prompted to log in just
  # so that they can log out.
  before_action :require_login, except: [:logout]
  before_action :require_administrator, only: [:index]

  # TODO move all the uniqname processing stuff into a before_action filter

  helper_method :total_overdue
  helper_method :total_on_time

  def index
    render inline: '<p>Not implemented</p>', layout: true
  end

  def show
    # if a uniqname is specified, and the user loading the page is an
    # administrator, allow them to view another person's account; if they're
    # not an administrator, show them a 401 Unauthorized message; if no
    # uniqname is specified, simply show the user's account
    if params[:uniqname].nil?
      @uniqname = uniqname
    else
      if administrator?
        @uniqname = params[:uniqname]
      else
        redirect_to unauthorized_path
        return
      end
    end
    # TODO: Sort properly
    # Definitely have it descending (is that the right word? more recent
    # checkouts are shown higher on the list, probably sorted by time out, and
    # not by time in

    # TODO: Separate tables for overdue and out-but-not-overdue titles

    @overdue = Record.where(borrower: @uniqname).overdue
    @out = Record.where(borrower: @uniqname).out_but_not_overdue
  end

  def history
    # this param should always exist, because it's required for the route to be
    # matched... but just because I wrote this comment, I'm gonna run into shit
    @uniqname = params[:uniqname]
    @records = Record.where(borrower: @uniqname)
  end

  def statistics
    @uniqname = params[:uniqname]
  end

  def logout
    # TODO will this throw an error if the user is somehow directed to logout
    # but there is no cosign cookie?
    cookies.delete request.env["COSIGN_SERVICE"]
    redirect_to Rails.configuration.cosign_logout_path
  end

  #############################################################################
  private #####################################################################
  #############################################################################

  # private
  def total_overdue
    # NOT DATABASE AGNOSTIC
    # DEPENDS UPON MYSQL FOR THE ` QUOTING OF COLUMN NAMES
    # BECAUSE I'M LAZY
    Record.where(borrower: @uniqname)
      .where('(`in` > `due`) OR (? > `due` AND `in` IS NULL)', DateTime.now)
      .length
  end

  def total_on_time
    # NOT DATABASE AGNOSTIC
    # DEPENDS UPON MYSQL FOR THE ` QUOTING OF COLUMN NAMES
    # BECAUSE I'M LAZY
    # only includes records that are checked in
    Record.where(borrower: @uniqname)
      .where('(`in` <= `due`)', DateTime.now)
      .length
  end
end
