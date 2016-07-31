class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :require_administrator, only: [:index, :show]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_parameters)
    @category.save
    redirect_to @category
  end

  def edit
  end

  def update
    @category.update(category_parameters)
    redirect_to @category
  end

  private
    def category_parameters
      params.require(:category).permit(:name, :description)
    end

    def set_category
      @category = Category.find(params[:id])
    end
end
