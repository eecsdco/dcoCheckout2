class AccountsController < ApplicationController
  # require login before letting someone access their account (duh)
  # excluding logout so that if somehow, someone is directed to the logout
  # link, but is, in fact, NOT logged in, they won't be prompted to log in just
  # so that they can log out.

  if Rails.env.production?
    before_action :require_login, except: [:logout]
  end
  before_action :require_administrator, only: [:index]
  before_action :initialize_uniqname

  helper_method :total_overdue
  helper_method :total_on_time
  helper_method :total_checkouts

  def index
    # TODO
    render inline: '<p>Not implemented</p>', layout: true
  end

  def show
    # if a uniqname is specified, and the user loading the page is an
    # administrator, allow them to view another person's account; if they're
    # not an administrator, show them a 401 Unauthorized message; if no
    # uniqname is specified, simply show the user's account
    @overdue = Record.where(borrower: @uniqname).overdue
    @out = Record.where(borrower: @uniqname).out_but_not_overdue

    @total_checked_out = @overdue.length + @out.length

    @pie_chart_params = {}
    @pie_chart_params["Checked Out"] = @total_checked_out if (@total_checked_out > 0)
    @pie_chart_params["Returned On Time"] = total_on_time if total_on_time > 0
    @pie_chart_params["Returned Past Due"] = total_overdue if total_overdue > 0
  end

  def history
    @records = Record.where(borrower: @uniqname).reorder(out: :desc)
  end

  def statistics
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

  # private
  def total_on_time
    # NOT DATABASE AGNOSTIC
    # DEPENDS UPON MYSQL FOR THE ` QUOTING OF COLUMN NAMES
    # BECAUSE I'M LAZY
    # only includes records that are checked in
    Record.where(borrower: @uniqname)
      .where('(`in` <= `due`)', DateTime.now)
      .length
  end

  # private
  def total_checkouts
    Record.where(borrower: @uniqname).length
  end

  # private
  def initialize_uniqname
    if params[:uniqname].nil? or params[:uniqname] == uniqname
      # if no uniqname is passed, just present the user with their own account
      # if the uniqname is passed, and it matches the uniqname of the user
      # making the request, that's okay too
      @uniqname = uniqname
    else
      if administrator?
        # only administrators are allowed to view other peoples accounts
        @uniqname = params[:uniqname]
      else
        # if not an administrator, they're not allowed to view other people's accounts
        redirect_to unauthorized_path
        return
      end
    end
  end
end
