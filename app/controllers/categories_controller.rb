class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :require_administrator, only: [:new, :create, :edit, :update, :destroy]

  if Rails.env.production?
    before_action :require_login
  end

  def index
    @categories = Category.all.sort_by(&:popularity).reverse!
  end

  def show
  end

  def new
    @category = Category.new()
  end

  def create
    @category = Category.new(category_parameters)
    if @category.save
      redirect_to @category
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @category.update(category_parameters)
    redirect_to @category
  end

  private
    def category_parameters
      params.require(:category).permit(:name, :description, :loan_length)
    end

    def set_category
      @category = Category.find(params[:id])
    end
end
