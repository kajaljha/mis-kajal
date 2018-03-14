
class Holiday < ActiveRecord::Base
  belongs_to :user
  validates :currently_working_on,:sales_email_id,:leave_type,:leave_from_date,:leave_to_date,:reason ,presence: true
  after_create do
   SendMail.leave_email(self,self.user_id).deliver_now  
                   
  end
end
   
