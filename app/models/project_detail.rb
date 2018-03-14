class ProjectDetail < ActiveRecord::Base
  belongs_to :user
  #validation
  validates :project_name,:your_role,:project_duration,:project_desc,:comp_name, presence:true
  #validates :project_url,:technical_stack,:client_name,:allow_blank => true,

end

