class RegistrationsController < Devise::RegistrationsController 
  before_filter :check_permissions, :only => [ :new, :create, :cancel ] 
  skip_before_filter :require_no_authentication 
  
  def check_permissions
    authorize! :create, resource
  end

  def new
    super
  end

   def create
    build_resource(sign_up_params)
    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        respond_with resource, :location => after_sign_in_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  protected
    def sign_up_params
      #devise_parameter_sanitizer.sanitize(:sign_up)
      params.require(:user).permit(:user_name, :first_name, :last_name, :role, :email, :password, :password_confirmation, :creators_id)
    end
end
