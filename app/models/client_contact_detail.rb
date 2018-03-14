class ClientContactDetail < ActiveRecord::Base
	belongs_to :user
	 validates :phone_no, presence: true, length: {minimum:10 ,maximum: 10}
	 #validates :phone_no,:numericality => true,:length => { :minimum => 10, :maximum => 15 }
    validates :official_email_id,:personal_email_id, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :personal_email_id,:official_email_id,:phone_no, presence:true
end
