class TitlesController < ApplicationController
  before_action :require_administrator,
    only: [:new, :create, :update, :edit, :destroy]

  def new
  end
  
  def create
    @title = Title.new(title_parameters)
    @title.save
    redirect_to @title
  end

  def index
    @titles = Title.all
  end

  def show
    render inline: "Not implemented"
  end

  def update
    render inline: "Not implemented"
  end

  def edit
    render inline: "Not implemented"
  end

  def destroy
    render inline: "Not implemented"
  end

  private
    def title_parameters
      params.require(:title).permit(:name, :category_id, :description, :notice, :n_available, :form_required, :max_loan)
    end
end
