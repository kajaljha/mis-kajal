class SalesConsultant < ActiveRecord::Base
	#association to user
	belongs_to :user
	#validations
	validates :name,:contact,:email_id,:bank_account_no,:ifsc_code,presence:true
	validates :commission,:allow_nil => true,:numericality => { :greater_than => 0.00 }
	validates :skype_id,:allow_nil => true, uniqueness: true
	validates :contact,length: {minimum:10 ,maximum: 10}
	validates :email_id,format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
	validates :bank_account_no,uniqueness: true , :numericality => true ,length: {minimum:6 ,maximum: 17}
	#validates :bank_name,:branch_name,:allow_nil => true
	validates :ifsc_code,format: { with: /\A[a-zA-Z0-9]+\z/, message: "only allows 11 digits"},length: {minimum:11 ,maximum: 11}
end
