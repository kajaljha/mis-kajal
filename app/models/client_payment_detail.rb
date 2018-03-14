class ClientPaymentDetail < ActiveRecord::Base
	 belongs_to :user
	 validates :payment_mode,:payment_amount,:payment_date,presence:true
	 validates :payment_amount,:numericality => { :greater_than => 0.01 }
end
