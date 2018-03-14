class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_action :notification_list
  rescue_from CanCan::AccessDenied do | exception | 
    flash[:error] = exception.message 
    redirect_to root_url
  end

  def autocomplete_invoice
    @autocomplete = Invoice.all.map(&:invoice_number)
    render json: @autocomplete
  end

  def notification_list
    @unread_notifications = Notification.unread_by(current_user) if user_signed_in?
    @pending_leaves = Holiday.where(:status => nil)
    @employee_pending_leaves =current_user.holidays.where(:status => nil)  if user_signed_in?
    
  end

  def after_sign_out_path_for(resource)
    '/users/sign_in'
  end

  def autocomplete
    @autocomplete = User.where(:role => "Sales-consultant" ).map(&:email)
    render json: @autocomplete
  end
  

  def after_sign_in_path_for(resource)
    users_path
  end
end
