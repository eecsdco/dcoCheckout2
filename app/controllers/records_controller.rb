class RecordsController < ApplicationController
  before_action :require_login
  before_action :require_checkout_authorization, only: [:new, :create, :return, :return_post]
  before_action :require_administrator, only: [:confirm_return, :destroy]

  before_action :get_title, only: [:new]
  before_action :get_record, only: [:show, :return, :return_post, :edit, :update, :destroy, :confirm_return]

  before_action :require_enabled_title, only: [:new]


  def index
    @records = Record.all
  end

  def show
    unless @record.borrower == uniqname or administrator?
      redirect_to :unauthorized
    end
  end

  def new
    # TODO: Refactor logic here
    if @title
      if !@title.available? and administrator?
        flash[:error] = "Every instance of this title is checked out in the checkout system. You are allowed to check it out because you are an administrator; please investigate why the system thinks there are no more of this title available (e.g. a title was returned but not marked returned, or, the number available in the system is inaccurate (i.e. too low)"
      end
      if @title.available? or administrator?
        @record = Record.new(title: @title)
        render "new", layout: true
      else
        flash[:error] = "This item is currently unavailable; there are no more of this item available for checkout. Please contact a DCO Staff Member if you need assistance."
        redirect_to @title
      end
    else
      redirect_to titles_path
    end
  end

  def create
    @record = Record.new(record_parameters)
    # TODO move this into a before_action thing
    unless @record.title.enabled
      flash[:error] = @title.name + " is not available for checkout."
      redirect_to @title
    end
    @record.out = DateTime.current
    @record.agent = uniqname
    unless administrator?
      @record.loan_length_seconds = @record.title.loan_length_seconds
      logger.debug "Setting loan_length_seconds on #{@record.id} to #{@record.title.loan_length}"
      @record.borrower = uniqname # don't let the user redefine things
      @record.office = Office.find current_office_id
      flash[:error] = "Records#create: Office is " + @record.office.name
    end
    if @record.save
      redirect_to @record
    else
      @title = Title.find_by_id(@record.title_id)
      if @title.nil?
        redirect_to titles_path
      else
        render "new"
      end
    end
  end

  def destroy
    @record.destroy
    redirect_to titles_path
  end

  def return
    if @record
      render "return"
    else
      @records = Record.where(borrower: uniqname, in: nil)
      render "out", layout: true
    end
  end

  def return_post
    @record.in = DateTime.current
    @record.save!
    redirect_to @record
  end

  def confirm_return
    @record.return_approved = DateTime.current
    @record.save!
    redirect_to :back
  end

  private

  def get_title
    logger.debug params
    if params[:title_id]
      @title = Title.find(params[:title_id])
    else
      @title = nil
    end
  end

  def record_parameters
    valid_params_list = [:title_id, :borrower, :office_id, :note, :loan_length, :option]
    begin
      params.require(:record).permit(valid_params_list)
    rescue ActionController::ParameterMissing
      params.permit(valid_params_list)
    end
  end

  def get_record
    @record = Record.find_by_id(params[:record_id])
  end

  def require_enabled_title
    unless @title.enabled
      flash[:error] = @title.name + " is not available for checkout."
      redirect_to @title
    end
  end
end
