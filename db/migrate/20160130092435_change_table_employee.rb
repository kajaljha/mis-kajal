class ChangeTableEmployee < ActiveRecord::Migration
  def self.up
  remove_column :employee_details, :prevoius_company
  remove_column :academic_skill_details,:category,:name,:type
end
end
