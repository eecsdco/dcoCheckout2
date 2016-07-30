class CategoriesController < ApplicationController
  before_action :require_administrator, only: [:index, :show]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
  end

  def create
    @category = Category.new(category_parameters)
    @category.save
    redirect_to @category
  end

  private
    def category_parameters
      params.require(:category).permit(:name, :description)
    end
end
