class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :employee_detail
  has_many :academic_skill_details
  has_many :bank_and_identity_details
  has_many :previous_comp_details
  has_many :project_details
  has_one :salary_detail
  has_many :sales_bdes
  has_many :sales_consultants
  has_many :client_project_details
  has_one :client_contact_detail
  has_many :client_assigned_resources
  has_one :client_basic_detail
  has_one :client_payment_detail
  has_many :notifications
  has_many :holidays
  has_many :invoices
  has_many :feedbacks
  
  validates :first_name,:last_name ,presence:true
  validates :first_name,:last_name,format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  scope :sales, -> { where(:role => "Sales-BDE" || "Sales-Consultant") }
  
  #validates_presence_of :first_name, :last_name, :unique => true 
  after_validation :createUsername
  after_validation :createPassword

  acts_as_reader

  after_create do
    SendMail.welcome_email(self).deliver_now
    SendMail.new_user_account(self).deliver_now                    
  end

  def password_required?
    false
  end

  def createUsername
    #create username from first_name+last_name
    firstnamePart=self.first_name.downcase
    lastnamePart=self.last_name.downcase
    username= firstnamePart+"."+lastnamePart
    self.user_name=username
  end

  def createPassword
    #create password from first_name+last_name[0]+@123
    firstnamePart=self.first_name.downcase
    lastnamePart=self.last_name[0].downcase
    password= firstnamePart+lastnamePart+"@123"
    password_salt = BCrypt::Engine.generate_salt
    bcrypt_password = BCrypt::Engine.hash_secret(password, password_salt)
    self.encrypted_password = bcrypt_password
  end
 
  def self.search(search)
    where('first_name || last_name || email LIKE ?', "%#{search}%")
  end
end
