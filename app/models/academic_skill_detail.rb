class AcademicSkillDetail < ActiveRecord::Base
   belongs_to :user
   validates :course_name,:university_name,:year_of_passing,:percentage,:board, presence: true
   validates :percentage,:numericality => { :greater_than => 0.01 }
   validates :course_name,:university_name, :board,format: {with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ , message: "must be formatted correctly"}

end
