class AddEmpIdToClientProjectDetail < ActiveRecord::Migration
  def change
  	add_column :client_project_details, :employee_id, :integer
  end
end
