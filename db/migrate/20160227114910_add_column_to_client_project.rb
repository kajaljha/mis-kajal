class AddColumnToClientProject < ActiveRecord::Migration
   def change
  	add_column :client_project_details, :sales_id, :integer
  end
end

