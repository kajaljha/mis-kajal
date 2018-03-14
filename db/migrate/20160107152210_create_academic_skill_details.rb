class CreateAcademicSkillDetails < ActiveRecord::Migration
  def change
    create_table :academic_skill_details do |t|
      t.integer :user_id 
      t.string :course_name
      t.string :university_name
      t.date  :year_of_passing
      t.float :percentage
      t.string :board
      t.string :category
      t.string :name
      t.string :type

      t.timestamps null: false
    end
  end
end
