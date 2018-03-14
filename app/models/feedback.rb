class Feedback < ActiveRecord::Base
 belongs_to :user


 belongs_to :client_project_detail
 belongs_to :employee_detail
 # has_many :client_project_details


 after_create do
   SendMail.feedback_email(self).deliver_now
   SendMail.admin_email(self).deliver_now 
   SendMail.employee_email(self).deliver_now 
   SendMail.sales_email(self).deliver_now 
 end
end
