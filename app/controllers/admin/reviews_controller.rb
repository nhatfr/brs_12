class Admin::ReviewsController < ApplicationController
  load_and_authorize_resource
  before_action :verify_admin

  def destroy
    if @review.destroy
      flash[:success] = t :success
    else
      flash[:fail] = t :fail
    end
    redirect_to @review.book
  end
end
