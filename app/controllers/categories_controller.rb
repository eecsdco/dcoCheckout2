class CategoriesController < AdminController
  skip_before_action :require_administrator, only: [:index, :show]

  def index
    @categories = Category.all
  end

  def new
  end

  def create
    @category = Category.new(category_parameters)
    render plain: params[:category].inspect + category_parameters.inspect
    @category.save
  end

  private
    def category_parameters
      params.require(:category).permit(:name, :description)
    end
end
