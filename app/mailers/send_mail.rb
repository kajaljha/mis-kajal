class SendMail < ApplicationMailer
  default from: Rails.application.secrets.admin_email
  ADMIN_EMAILS = ["gourav.agrawal@affimintus.in", "sumit.munot@affimintus.in", "rakesh.jha@affimintus.in", Rails.application.secrets.admin_email]
  DEVELOPER_EMAILS = ["priyanka.bakshi@affimintus.in", "kajal.jha@affimintus.in", "shweta.gupta@affimintus.in", "shweta.affimintus@gmail.com"]
  HR_EMAILS =["kajal5792@gmail.com"]

  def welcome_email(user)
    @user = user
    mail(to: @user.email, :bcc => DEVELOPER_EMAILS, subject: "Welcome #{user.first_name.capitalize}!")
  end

  # sends the new user details to admin
  # Template => app/views/send_mail/new_user_account
  # parameter => user object
  def new_user_account(user)
    @user = user
    mail(:to => ADMIN_EMAILS, :bcc => DEVELOPER_EMAILS, :subject => "New Account created : #{user.first_name}")
  end

  # sends leave mail to admin and HR
  # Template => app/views/send_mail/leave_email
  # parameter => holiday,user object
  def leave_email(holiday,user)
    @user = User.find(user)
    @holiday =holiday
    mail(:to => HR_EMAILS, :bcc => DEVELOPER_EMAILS, subject: "Request for leave !")
  end 

  # sends approved leave mail to employee and HR
  # Template => app/views/send_mail/accept_email
  # parameter => holiday object
  def accept_email(holiday)
    @holiday = Holiday.find(holiday)
    @user=holiday.user
    mail(to: @user.email, :bcc => HR_EMAILS, subject: "Leave Approved !")
  end

  # sends reject leave mail to employee and HR
  # Template => app/views/send_mail/rejectt_email
  # parameter => holiday object
  def reject_email(holiday)
    @holiday = Holiday.find(holiday)
    @user=holiday.user
    mail(to: @user.email, :bcc => HR_EMAILS, subject: "Leave Rejected !")
  end
  
  # sends mail to client
  # Template => app/views/send_mail/feedback_email
  # parameter => feedback object
  def feedback_email(feedback)
    @user = feedback.user
    mail(to: @user.email, subject: "Feedback")
  end

  # sends feedback mail to admin
  # Template => app/views/send_mail/admin_email
  # parameter => feedback object
  def admin_email(feedback)
    #@project = ClientProjectDetail.find params[:client_project_detail_id]
    @feedback =Feedback.find(feedback)
    @project_id = @feedback.client_project_detail_id
    @emp_id = ClientProjectDetail.find(@project_id).employee_id
    @user  = User.find(@emp_id).first_name
    @user_name = feedback.user
    mail(to: ADMIN_EMAILS, subject: "Feedback")
  end

  # sends feedback mail to Employee
  # Template => app/views/send_mail/employee_email
  # parameter => feedback object
  def employee_email(feedback)
    #@project = ClientProjectDetail.find params[:client_project_detail_id]
    @feedback =Feedback.find(feedback)
    @project_id = @feedback.client_project_detail_id
    @emp_id = ClientProjectDetail.find(@project_id).employee_id
    @user  = User.find(@emp_id).first_name
    @user_email  = User.find(@emp_id).email
    @user_name = feedback.user
    mail(to: @user_email, subject: "Feedback")
  end

  def client_reminder_email(feedback)
   @user = feedback.user
    mail(to: @user.email, subject: "Feedback")
  end

  # sends feedback mail to sales
  # Template => app/views/send_mail/sales_email
  # parameter => feedback object
  def sales_email(feedback)
    #@project = ClientProjectDetail.find params[:client_project_detail_id]
    @feedback =Feedback.find(feedback)
    @project_id = @feedback.client_project_detail_id
    @emp_id = ClientProjectDetail.find(@project_id).sales_id
    @user  = User.find(@emp_id).first_name
    @user_email  = User.find(@emp_id).email
    @user_name = feedback.user
    mail(to: @user_email, subject: "Feedback")
  end

  def client_invoice_email(client, invoice)
    #@client = Invoice.find(client)
    @client =client
    @invoice=invoice
  
    mail(to: client.email, subject: "Invoice mail!")
  end
end
