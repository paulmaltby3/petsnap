  
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def access_denied(exception)
      redirect_to root_path, alert: exception.message
  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name])
  end
end




#class ApplicationController < ActionController::Base
#  protect_from_forgery with: :exception
#  before_action :configure_permitted_parameters, if: :devise_controller?
  
#  def access_denied(exception)
#      redirect_to root_path, alert: exception.message
#  end
  
 
  
#  protected
  
#  def configure_permitted_parameters
#    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name])
    #Added line below because I couldn't access edit_user_registration_path, via https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-edit-their-password
    #devise_parameter_sanitizer.permit(:account_update, Devise: [:RegistrationsController])
    #from https://github.com/plataformatec/devise#getting-started below
    #account_update (Devise::RegistrationsController#update)
#  end
  
   #I put this in myself to try and enable the edit_user_registrations path which was returning a nil for @user.username on the edit link
 
  #def edit
    #@user = User.find(params[:id])
  #end
 
  #def edit  
    #@user = Edit.find_by(username: params[:username])
    #redirect_to edit_user_registration_path(@user.username)
  #end
#end
