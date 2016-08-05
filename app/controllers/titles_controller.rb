class TitlesController < ApplicationController
  before_action :load_title, only: [:edit, :update, :show, :destroy]
  before_action :require_login
  before_action :require_administrator,
    only: [:new, :create, :update, :edit, :destroy]

  def new
    @title = Title.new(title_parameters)
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
    if params[:category_id].nil? and params[:all].nil?
      render "category_chooser", layout: true, :locals => {:path => :titles_path}
    elsif params[:all].nil?
      @category = Category.find(params[:category_id])
    else
      # TODO: this will throw an error right now because the index view references @category.name
      @category = nil
      @titles = Title.all
    end
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

  def search
    query = params.require(:q)
    @titles = Title.where("name LIKE :q OR description LIKE :q", {q: "%#{query}%"})
    #render inline: "<% console %>", layout: true
    render json: @titles, status: :created
  end

  def title_parameters
    permit_attribute_list = [:name, :category_id, :description, :notice_id, :n_available, :loan_length, :office_id]
    if params[:title]
      params.require(:title).permit(*permit_attribute_list)
    else
      params.permit(*permit_attribute_list)
    end
  end

  def load_title
    @title = Title.find(params[:id])
  end
end
