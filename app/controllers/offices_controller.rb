class OfficesController < ApplicationController

  if Rails.env.production?
    before_action :require_login
  end
  before_action :require_administrator, only: [:new, :create, :edit, :update, :destroy]
  before_action :get_office, only: [:show, :edit, :update, :destroy]

  def index
    @offices = Office.all
  end

  def new
    @office = Office.new
  end

  def create
    @office = Office.new(office_parameters)
    if @office.save
      redirect_to @office
    else
      render 'new'
    end
  end

  def show
  end

  def update
    if @office.update(office_parameters)
      redirect_to @office
    else
      render 'edit'
    end
  end

  def destroy
    flash[:error] = "I can't let you do that, Dave.\nDeleting an entire DCO Office hardly sounds like a good idea."
    redirect_to @office
  end

  private
    def get_office
      @office = Office.find(params[:id])
    end

    def office_parameters
      params.require(:office).permit(:name, :address)
    end
end
