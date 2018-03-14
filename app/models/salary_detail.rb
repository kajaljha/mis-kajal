class SalaryDetail < ActiveRecord::Base
  belongs_to :user
  validates :user_type,:ctc,:training_salary,:probation_salary,:confirmed_salary, presence:true

  validates :ctc,:training_salary,:probation_salary,:confirmed_salary, presence: true, :numericality => { :greater_than => 0.01 }
 end

                      