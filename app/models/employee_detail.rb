class EmployeeDetail < ActiveRecord::Base
  belongs_to :user
  has_many :feedbacks
   #validations
   validates :mobile ,presence: true, length: {minimum:10 ,maximum: 10}
   validates :oficial_email_id,:personal_email_id, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
   validates :first_name,:last_name,:dob,:doj,:oficial_email_id,:mobile,:current_address,:permanent_address,:skype_id,:personal_email_id,
             :guardian_full_name,:guardian_address, presence: true 
   validates :guardian_full_name,format: {with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ , message: "must be formatted correctly"}
   validates :first_name,:last_name,format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
   validates :landline,:guardian_landline,:guardian_mobile, :numericality => true,:allow_nil => true
   #validates :skype_id,uniqueness: true 
   
end
