class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

  protected
  def verify_admin
    if current_user.nil? || current_user.normal?
      flash[:danger] = t :permission_required
      redirect_to root_url
    end
  end
end
