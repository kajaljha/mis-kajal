class AddcolumnToClientProject < ActiveRecord::Migration
   def change
  	add_column :feedbacks, :client_project_detail_id, :integer	
  end
end
