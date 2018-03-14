class EmployeesController < ApplicationController
  
  def index
    @employee = EmployeeDetail.all
  end
  
  def new
    @employee = current_user.build_employee_detail
  end

  def edit
    @employee = current_user.employee_detail
  end

  def show
    if current_user.employee_detail.blank?
      redirect_to new_user_employee_path(current_user)
    else
      @employee = current_user.employee_detail
    end
  end
 
  def create
    @employee = current_user.build_employee_detail(employee_params)
    if @employee.save
      redirect_to user_employee_path(current_user, @employee), :notice => "Details saved."
    else
      render 'new'
    end
  end

 def update
    @employee = current_user.employee_detail
      if @employee.update_attributes(employee_params)
       redirect_to user_employee_path,:notice => "Your employee has been updated"
      else
      render "edit"
    end
  end

 def academic_skill_detail_new
   @academic = current_user.academic_skill_details.new
 end

 def academic_skill_detail_display
    if current_user.academic_skill_details.blank?
      redirect_to academic_skill_detail_new_user_employees_path(current_user)
    else
      @academices = current_user.academic_skill_details
    end 
 end

 def academic_skill_detail_edit
  @academic = current_user.academic_skill_details.find(params[:academic])
 end

 def academic_skill_detail_create
   @academic = current_user.academic_skill_details.create(academic_params)
    if @academic.save
      redirect_to academic_skill_detail_display_user_employees_path(current_user), :notice => "Details saved."
    else
      render "academic_skill_detail_new"
    end
 end

 def academic_skill_detail_update
   @academic = current_user.academic_skill_details.find(params[:academic])
     if @academic.update_attributes(academic_params)
       redirect_to academic_skill_detail_display_user_employees_path(current_user)
     else
      render 'academic_skill_detail_edit'
    end
 end

 def bank_identity_detail_new
  @bank = current_user.bank_and_identity_details.new 
 end

 def bank_identity_detail_display
    if current_user.bank_and_identity_details.blank?
      redirect_to bank_identity_detail_new_user_employees_path(current_user)
    else
      @banks = current_user.bank_and_identity_details
    end
 end

 def bank_identity_detail_edit
  @bank = current_user.bank_and_identity_details.find(params[:bankidentity])
 end
  
 def bank_identity_detail_create
   @bank = current_user.bank_and_identity_details.create(bank_and_identity_params)
    if @bank.save
      redirect_to bank_identity_detail_display_user_employees_path(current_user), :notice => "Details saved."
    else
      render "bank_identity_detail_new"
    end
 end

 def bank_identity_detail_update
   @bank = current_user.bank_and_identity_details.find(params[:bankidentity])
     if @bank.update_attributes(bank_and_identity_params)
       redirect_to bank_identity_detail_display_user_employees_path(current_user)
     else
        render 'bank_identity_detail_edit'
      end
  end
 
  def project_detail_new
    @project =  current_user.project_details.new 
  end

  def project_detail_edit
    @project =  current_user.project_details.find(params[:projectdetail])
  end

  def project_record
    @project =  current_user.project_details.create(project_params)
    if @project.save
      redirect_to project_display_user_employees_path, :notice => "Details saved."
    else
      render 'project_detail_new'
    end
  end
 
  def project_detail_update
    @project =  current_user.project_details.find(params[:projectdetail])
      if @project.update_attributes(project_params)
       redirect_to project_display_user_employees_path(current_user)
     else
        render 'project_detail_edit'
      end
  end
 
  def project_display
    if current_user.project_details.blank?
      redirect_to project_detail_new_user_employees_path(current_user)
    else
      @projects = current_user.project_details
    end
  end
  
  def previous_organization_detail_new
    @previous = current_user.previous_comp_details.new
  end
  
  def previous_organization_display
    if current_user.previous_comp_details.blank?
      redirect_to previous_organization_detail_new_user_employees_path(current_user), :notice => "Details saved."
    else
      @previous = current_user.previous_comp_details
    end
  end

  def previous_organization_edit
    @previous = current_user.previous_comp_details.find(params[:prevorg])

  end

  def previous_organization_record
    @previous =  current_user.previous_comp_details.create(previous_params)
    if @previous.save
      redirect_to previous_organization_display_user_employees_path, :notice => "Details saved."
    else
      render 'previous_organization_detail_new'
    end
  end

  def previous_organization_update
    @previous = current_user.previous_comp_details.find(params[:prevorg])
       if @previous.update_attributes(previous_params)
         redirect_to previous_organization_display_user_employees_path(current_user)
       else
        render 'previous_organization_edit'
      end
  end

  def salary_display
    if current_user.salary_detail.blank?
      redirect_to salary_details_user_employees_path(current_user)
    else
      @salary = current_user.salary_detail
    end
  end

  def salary_details_edit
    @salary =  current_user.salary_detail
  end

  def salary_details_update
    @salary =  current_user.salary_detail
      if @salary.update_attributes(salary_params)
        redirect_to salary_display_user_employees_path(current_user)
      else
        render 'salary_details_edit'
      end
  end
  
  def salary_details
    @salary = current_user.build_salary_detail
  end
  
  def salary_record
    @salary =  current_user.build_salary_detail(salary_params)
    if @salary.save
      redirect_to salary_display_user_employees_path(current_user), :notice => "Details saved."
    else
      render 'salary_details'
    end
  end

  def employee_dashboard
     # @employee = current_user.find(params[:id])   
  end

  def send_email
    user = User.find(params[:user_id])
    SendMail.welcome_email(user).deliver_now
    SendMail.new_user_account(user).deliver_now
    respond_to do |format|
      format.js
    end
  end

  def send_email_multiple
   # binding.pry
    user = User.find(params[:user_id])
    SendMail.welcome_email(user).deliver_now
    SendMail.new_user_account(user).deliver_now
    respond_to do |format|
      format.js
    end
  end

  private
    
    def academic_params
      params.require(:academic_skill_detail).permit(:user_id, :course_name, :university_name, :year_of_passing, :percentage, :board)
    end

    def bank_and_identity_params
      params.require(:bank_and_identity_detail).permit(:user_id, :bank_account_no,:bank_name,:branch_name,:city,:ifsc_code,:pancard_no,:passport_no,:uid_no)
    end

    def employee_params
      params.require(:employee_detail).permit(:user_id, :user_name,:first_name,:last_name,:dob,:doj,:blood_group,:designation,:oficial_email_id,:mobile,:landline,:current_address,:permanent_address,:skype_id,:personal_email_id,:guardian_full_name,:guardian_mobile,:guardian_landline,:guardian_address)
    end

    def project_params
      params.require(:project_detail).permit(:user_id, :project_name,:your_role,:project_url, :project_desc, :technical_stack, :client_name,:comp_name,:project_duration)
    end

    def salary_params
      params.require(:salary_detail).permit(:user_id, :user_type, :ctc, :training_salary, :probation_salary, :confirmed_salary)     
    end

    def previous_params
      params.require(:previous_comp_detail).permit(:user_id, :company_name, :location, :designation, :from_month_year, :to_month_year, :last_ctc, :leave_reason )
    end
end
