class ClientProjectDetail < ActiveRecord::Base
	 belongs_to :user
	 # belongs_to :feedback
	 has_many :feedbacks

	 #validations
	 validates :project_name,:description,:technologies,:project_start_date,:estimated_end_date,:project_type,:currency_type,presence:true
   validates :technologies,format: {with: /\A[^`!@#\$%\^&*+_=]+\z/}
     
end

