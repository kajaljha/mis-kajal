class PreviousCompDetail < ActiveRecord::Base
  belongs_to :user
  #validations
  validates :company_name,:location,:from_month_year,:to_month_year,:last_ctc, presence:true
  validates :last_ctc,:numericality => { :greater_than => 0.01 }
end
