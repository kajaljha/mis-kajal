class ClientAssignedResource < ActiveRecord::Base
 belongs_to :user
 validates :company_name,:location,:designation, presence: true
end
