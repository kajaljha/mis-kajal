class NotificationsController < ApplicationController
	before_filter :get_hr_user

	def index
		@notifications = Notification.all
	end

	def new
		@notification = @hr_user.notifications.build 
	end

	def create
		@notification = @hr_user.notifications.build(notifications_params)
		if @notification.save
			redirect_to user_notifications_path(current_user), :notice => "Notification has been created successfully!"
		else
			render 'new'
		end
	end

	def show
		@notification = Notification.find(params[:id])
		@notification.mark_as_read! :for => current_user
	end

	def edit
		@notification = @hr_user.notifications.find(params[:id])
	end

	def update
		@notification = @hr_user.notifications.find(params[:id])
		if @notification.update_attributes(notifications_params)
			redirect_to user_notifications_path,:notice => "Notification has been updated successfully!"
		else
			render "edit"
		end
	end

	def destroy
	  @notification = current_user.notifications.find(params[:id])
	  @notification.destroy
	  redirect_to user_notifications_path
  end

  def destroy_multiple

    Notification.destroy(params[:notifications])

    respond_to do |format|
      format.html { redirect_to  user_notifications_path }
      format.json { head :no_content }
    end

  end

  def mark_notification_as_read
  	@notification = Notification.find(params[:notification_id])
		@notification.mark_as_read! :for => current_user
		respond_to do |format|
			format.js
		end
  end

	private

	def get_hr_user
		@hr_user = current_user
	end

	def notifications_params
    params.require(:notification).permit(:user_id, :title, :description, :remark)
  end

end
