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

    @overdue = Record.where(borrower: @uniqname).overdue
    @out = Record.where(borrower: @uniqname).out_but_not_overdue
  end

  def history
    # this param should always exist, because it's required for the route to be
    # matched... but just because I wrote this comment, I'm gonna run into shit
    @uniqname = params[:uniqname]
    @records = Record.where(borrower: @uniqname).reorder(out: :desc)
  end

  def statistics
    @uniqname = params[:uniqname]

    # generate a hash of 'title name' => 'number of checkouts' pairs for use in
    # a pretty nifty pie chart
    @common_titles = Hash[Record.where(borrower: @uniqname).group(:title_id).count.map { |k, v| [Title.find(k).name, v] }]
  end

  def logout
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
