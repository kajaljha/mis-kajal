class ChangeDataTypeForHolidayFieldname < ActiveRecord::Migration
 def up
 	remove_column :holidays, :status  
  end
  def down
  	add_column :holidays, :status
  end
end

