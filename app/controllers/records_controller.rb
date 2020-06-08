class RecordsController < ApplicationController

  if Rails.env.production?
    before_action :require_login
    before_action :require_checkout_authorization, only: [:new, :create, :return, :return_post]
  end
  before_action :require_administrator, only: [:edit, :update, :confirm_return, :destroy]
  before_action :get_title, only: [:new]
  before_action :get_record, only: [:show, :return_post, :edit, :update, :destroy, :confirm_return]

  before_action :require_enabled_title, only: [:new]


  def index
    # Rails lazy-loads all this, so the conditions are all applied at the same
    # time; this means that instead of taking the first 20 records, then
    # filtering those, it takes the first twenty records that match all the
    # critera specified
    @records = Record.where(nil)
    @records = @records.borrower_is(params[:uniqname])
    @records = @records.office_is(params[:office_id])
    @records = @records.title_like(params[:title_name])
    @records = @records.reorder(out: :desc)

    unless params[:show_returned].present?
      @records = @records.where(in: nil)
    end


    @total_pages = (@records.count.to_f / Rails.configuration.index_length).ceil
    @current_page = params[:page].to_i # if nil, to_i converts to 0
    if @current_page < 1
      # don't allow negative page numbers
      @current_page = 1
    elsif @current_page > @total_pages
      # don't allow a user to go past the total number of pages
      @current_page = @total_pages
    end
    @params = params.permit(:title_name, :uniqname, :office_id)

    @records = @records.limit(Rails.configuration.index_length)
      .offset((@current_page - 1)  * Rails.configuration.index_length)
  end

  def show
    unless @record.borrower == uniqname or administrator?
      redirect_to :unauthorized
    end
  end

  def new
    if @title
      if ((Record.where(borrower: uniqname)
          .where('(? > `due` AND `in` IS NULL)', DateTime.now)
          .length) > 0) and !administrator?
        flash[:error] = "You are unable to check out any new titles. Your account currently has a hold on it: you have overdue titles. Please speak to a member of the DCO Staff to resolve this issue."
        redirect_to account_path
      elsif @title.available?
        @record = Record.new(title: @title)
      elsif administrator?
        @record = Record.new(title: @title)
        flash.now[:error] = "Every instance of this title is checked out in the checkout system. You are allowed to check it out because you are an administrator; please investigate why the system thinks there are no more of this title available (e.g. a title was returned but not marked returned, or, the number available in the system is inaccurate (i.e. too low)"
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
    @record.loan_length = params[:record][:loan_length]
    @record.out = DateTime.current
    @record.agent = uniqname
    unless administrator?
      # don't let the user inject stuff that they're not supposed to change
      @record.loan_length_seconds = @record.title.loan_length_seconds
      @record.borrower = uniqname
      @record.office = Office.find current_office_id
    end
    if @record.save
      ReminderMailer.checkout_email(@record).deliver
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

  def edit
  end

  def update
    if @record.update(record_parameters)
      redirect_to @record
    else
      render "edit"
    end
  end

  def destroy
    @record.destroy
    redirect_to titles_path
  end

  def return
    @record = Record.find_by_id(params[:record_id])
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
    valid_params_list = [:title_id, :borrower, :office_id, :note, :loan_length, :option, :due]
    begin
      params.require(:record).permit(valid_params_list)
    rescue ActionController::ParameterMissing
      params.permit(valid_params_list)
    end
  end

  def get_record
    @record = Record.find_by_id(params[:record_id])
    if @record.nil?
      redirect_to not_found_path
    end
  end

  def require_enabled_title
    unless @title.enabled or administrator?
      flash[:error] = @title.name + " is not available for checkout."
      redirect_to @title
    end
  end
end
