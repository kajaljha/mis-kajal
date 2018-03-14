class HolidaysController < ApplicationController

  def index
    if current_user.role == "Employee" || current_user.role == "Sales-consultant" || current_user.role == "Sales-BDE"
     @holiday = current_user.holidays
    elsif current_user.role == "admin" || current_user.role == "Hr"
     @holiday = Holiday.all
    end
  end

  def show	
   @holiday = Holiday.find(params[:id]) 
  end


  # GET /holidays/new
  def new
  	@holiday = current_user.holidays.new
  end
  
  # POST /holidays
  def create
    @holiday = current_user.holidays.new(hoilday)
    @holiday.availability = params[:availability]
    @holiday.currently_working_on = params[:currently_working_on]
    if params[:leave_type] == "Special Leave(SL)"
      @holiday.leave_to_date = params[:leave_to_sl]
    elsif  params[:leave_type] == "Earned Leaves(EL)"
      @holiday.leave_to_date = params[:leave_to_er]
      @holiday.leave_from_date = params[:leave_from]
    else
      @holiday.leave_to_date = params[:leave_to_pr]
    end
    @holiday.leave_type = params[:leave_type]
    if @holiday.save
      redirect_to action: "index"
     else
      render action: "new"
    end 
  end

  
  def edit
  	@holiday = Holiday.find(params[:id])
  end

  def update
    @holiday = Holiday.find(params[:id])
    if @holiday.update_attributes(holiday_params)
      	redirect_to user_holidays_path(current_user)
      else
      	render 'edit'
      end
  end


  # DELETE /users/1
  def destroy
    @holiday = Holiday.find(params[:id])
    @holiday.destroy
    redirect_to user_holidays_path, notice: "User deleted."
  end

  def destroy_multiple

    Holiday.destroy(params[:holidays])

    respond_to do |format|
      format.html { redirect_to user_holidays_path }
      format.json { head :no_content }
    end

  end

  def leave_accept
    @holiday = Holiday.find(params[:id])
    @holiday.update_attribute(:status,1)
    SendMail.accept_email(@holiday).deliver_now
    redirect_to user_holidays_path(current_user)
  end

  def leave_reject
  	@holiday = Holiday.find(params[:id])
    @holiday.update_attribute(:status,0) 
    SendMail.reject_email(@holiday).deliver_now   
    redirect_to user_holidays_path(current_user)
  end
  
  private
    
    def holiday_params
      params.require(:holiday).permit(:user_id,:availability,:currently_working_on,:sales_email_id,:leave_type,:leave_from_date,:leave_to_date,:reason, :comment, :status)
    end

    def hoilday
      params[:values].require(:holiday).permit(:user_id,:availability,:currently_working_on,:sales_email_id,:leave_type,:reason)
    end
end

