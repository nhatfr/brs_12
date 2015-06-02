class CategoriesController < ApplicationController
  load_and_authorize_resource
  
  def index
    @categories = @categories.paginate page: params[:page], per_page: Settings.per_page
  end

  def show
  end
end
