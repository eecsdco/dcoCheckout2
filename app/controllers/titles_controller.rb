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
    elsif !params[:all]
      @category = Category.find(params[:category_id])

      if params[:show_all] == "true"
        @titles = @category.titles
      else
        @titles = @category.titles.where(enabled: true)
      end

      # .nil? has to go first, because if current_office_id is nil, .empty?
      # will raise an exception b/c nil doesn't have an empty? method
      unless current_office_id.nil?
        @titles = @titles.where(office_id: current_office_id)
      end
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

  def enable_multiple
    # extra [] around params to force find_by_id to return a list of Titles,
    # even if only one title is passed into the contoller
    # check if the param is nil, because find will raise an exception if it is
    unless params[:title_ids].nil?
      @titles = Title.find params[:title_ids]
    end

    unless params[:titles_enabled].nil?
      @titles_enabled = Title.find params[:titles_enabled]
    end

    if @titles.nil?
      @titles = []
    end
    if @titles_enabled.nil?
      @titles_enabled = []
    end

    @titles.each do |title|
      # don't bother trying to update it if nothing has changed
      if title.enabled and !title.in?(@titles_enabled)
        title.update!(enabled: false)
      elsif !title.enabled and title.in?(@titles_enabled)
        title.update!(enabled: true)
      end
    end

    redirect_to :back
  end

  def search
    query = params.require(:q)
    regexp = /#{Regexp.quote(query)}/i
    @titles = Title.where("name LIKE :q OR description LIKE :q",
      {q: "%#{query}%",})
    unless params.permit(:show_all).empty? and administrator?
      @titles = Titles.where(enabled: true)
    end
    @titles = @titles.sort_by { |title| ((title.name.index(regexp) or 999)) }
    #render inline: "<% console %>", layout: true
    render json: @titles, status: :created
  end

  #############################################################################
  private #####################################################################
  #############################################################################

  # private
  def title_parameters
    permit_attribute_list = [:name, :category_id, :description, :notice_id, :n_available, :loan_length, :office_id, :enabled]
    if params[:title]
      params.require(:title).permit(*permit_attribute_list)
    else
      params.permit(*permit_attribute_list)
    end
  end

  # private
  def load_title
    @title = Title.find(params[:id])
  end
end
