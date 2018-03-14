class ChangeDataTypeForHolidayName < ActiveRecord::Migration
  def change
    add_column :holidays, :status, :boolean 
   
  end
end
	