class RequestsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @requests = @requests.paginate page: params[:page], per_page: Settings.per_page
  end

  def new
  end

  def create
    if @request.save
      flash[:success] = t :success
    else
      flash[:danger] = t :fail
    end
    redirect_to requests_path
  end

  def edit  
  end

  def update
    if @request.update_attributes request_params
      flash[:success] = t :success
      redirect_to requests_path
    else
      flash[:danger] = t :danger
      render :edit
    end
  end

  def destroy
    if @request.destroy
      flash[:success] = t :success
    else
      flash[:danger] = t :danger
    end
    redirect_to requests_path
  end

  private
  def request_params
    params.require(:request).permit :book_name, :description, :author, :ISBN
  end
end
