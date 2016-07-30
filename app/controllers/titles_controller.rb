class TitlesController < ApplicationController
  before_action :is_administrator?,
    only: [:new, :create, :update, :edit, :destroy]

  def new
  end
  
  def create
  end

  def index
  end

  def show
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
