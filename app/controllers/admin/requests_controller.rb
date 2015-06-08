class Admin::RequestsController < ApplicationController
  load_and_authorize_resource

  def index
    @requests = @requests.paginate page: params[:page], per_page: Settings.per_page
  end

  def update
    @request.update_attributes status: params[:new_status]
    respond_to do |format|
      format.js
    end
  end

  def destroy
    if @request.destroy
      flash[:success] = t :success
    else
      flash[:danger] = t :danger
    end
    redirect_to admin_requests_path
  end
end
