class RecordsController < ApplicationController
  before_action :require_login
  before_action :require_administrator, only: [:confirm_return]
  before_action :get_title, only: [:new]
  before_action :get_record, only: [:show, :return, :return_post, :edit, :update, :destroy, :confirm_return]

  def index
    @records = Record.all
  end

  def show
    unless @record.borrower == uniqname or administrator?
      redirect_to :unauthorized
    end
  end

  def new
    if @title
      @record = Record.new(title: @title)
      render "new", layout: true
    else
      redirect_to titles_path
    end
  end

  def create
    @record = Record.new(record_parameters)
    @record.out = DateTime.current
    @record.agent = uniqname
    unless administrator?
      @record.loan_length_seconds = @record.title.loan_length_seconds
      logger.debug "Setting loan_length_seconds on #{@record.id} to #{@record.title.loan_length}"
      @record.borrower = uniqname # don't let the user redefine things
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
    @record.save
    redirect_to @record
  end

  def confirm_return
    @record.return_approved = DateTime.current
    @record.save
    redirect_to @record
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
      valid_params_list = [:title_id, :borrower, :note, :agent, :loan_length]
      begin
        params.require(:record).permit(valid_params_list)
      rescue ActionController::ParameterMissing
        params.permit(valid_params_list)
      end
    end

    def get_record
      @record = Record.find_by_id(params[:record_id])
    end
end
