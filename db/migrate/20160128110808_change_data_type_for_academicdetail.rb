class ChangeDataTypeForAcademicdetail < ActiveRecord::Migration
   def self.up
    rename_column :academic_skill_details, :type, :skill_type
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end





