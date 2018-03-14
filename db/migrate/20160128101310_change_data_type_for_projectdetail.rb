class ChangeDataTypeForProjectdetail < ActiveRecord::Migration
  def self.up
    change_table :project_details do |t|
    t.change :project_duration , :date
    end
  end
  def self.down
    change_table :project_details do |t|
    t.change :project_duration, :datetime
    end
  end
end
