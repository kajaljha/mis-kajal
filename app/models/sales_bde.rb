class SalesBde < ActiveRecord::Base
	belongs_to :user
	validates :sales_id ,:skype_id, presence: true
end
