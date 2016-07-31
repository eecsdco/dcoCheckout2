class TitlesController < ApplicationController
  before_action :load_title, only: [:edit, :update, :show, :destroy]
  before_action :require_administrator,
    only: [:new, :create, :update, :edit, :destroy]

  def new
    @title = Title.new
  end
  
  def create
    @title = Title.new(title_parameters)
    if @title.save
      redirect_to @title
    else
      render :new
    end
  end

  def index
    @titles = Title.all
  end

  def show
  end

  def update
    if @title.update(title_parameters)
      redirect_to @title
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @title.destroy
    redirect_to titles_path
  end

  private
    def title_parameters
      params.require(:title).permit(:name, :category_id, :description, :notice_id, :n_available, :form_required, :max_loan)
    end

    def load_title
      @title = Title.find(params[:id])
    end
end
