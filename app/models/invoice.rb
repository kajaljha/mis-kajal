class Invoice < ActiveRecord::Base
	belongs_to :user
	validates :invoice_date, :currency, :tax, :due_date,:invoice_items, presence:true
	has_many :invoice_items, :dependent => :destroy
	accepts_nested_attributes_for :invoice_items

	def self.search(search)
	 where("invoice_number like ?", "%#{search}%") 
	end

	# after_create do
    #SendMail.client_invoice_email(self).deliver_now  
                   
 #  end

def self.client_mail(id,invoice)
  ab = User.find(id)
  @invoice=invoice
  SendMail.client_invoice_email(ab, @invoice).deliver_now
end

end
