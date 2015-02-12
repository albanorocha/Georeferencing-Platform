class Maps::MapsController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Pundit
  
  layout 'maps'
  
  before_action :authenticate_user!
  after_action :verify_authorized
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "Você não está autorizado a realizar esta ação."
    redirect_to(request.referrer || dashboard_outdoors_path)
  end



end
