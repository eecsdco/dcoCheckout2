class RecordsController < ApplicationController
  before_action :require_login
  before_action :require_administrator, only: [:confirm_return]
  before_action :get_title, only: [:new]
  before_action :get_record, only: [:show, :return, :edit, :update, :destroy, :confirm_return]

  def index
    @records = Record.all
  end

  def out
    @records = Record.where(borrower: uniqname, in: nil)
  end

  def show
    unless @record.borrower == uniqname or administrator?
      redirect_to :unauthorized
    end
  end

  def new
    if @title
      @record = Record.new
      @record.title = @title
      #@record.loan_length = @title.max_loan
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
      @record.loan_length = @record.title.max_loan
      @record.borrower = uniqname # don't let the user redefine things
    end
    if @record.save
      redirect_to @record
    else
      params[:title_id] = params[:record][:title_id]
      render :new
    end
  end

  def destroy
    @record.destroy
    redirect_to titles_path
  end

  def return
    if @record
      render inline: "<p>Not implemented: present return prompt</p>", layout: true
    else
      render inline: "<p>Not implemented: list records that are out</p>", layout: true
    end
  end

  def return_post
    render inline: "<p>Not implemented</p>", layout: true
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
      params.require(:record).permit(:title_id, :borrower, :note, :agent, :loan_length)
    end

    def get_record
      @record = Record.find_by_id(params[:id])
    end
end
