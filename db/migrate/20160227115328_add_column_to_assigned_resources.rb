class AddColumnToAssignedResources < ActiveRecord::Migration
  def change
  	add_column :client_assigned_resources, :sales_id, :integer
  end
end
