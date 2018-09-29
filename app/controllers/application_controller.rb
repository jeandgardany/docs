class ApplicationController < ActionController::Base
 	protect_from_forgery with: :exception
  	before_action :authenticate_user!
  	before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def user_not_authorized
    flash[:alert] = "Você não está autorizado para essa ação!"
    redirect_to(request.referrer || root_path)
  end

  def correct_user?
    @user = User.find(params[:id])
        unless current_user == @user
              redirect_to root_path
          end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nome, :age, :avatar])
  end

end
