class AddColCreaterToUser < ActiveRecord::Migration
  def change
  	add_column :users, :creators_id, :integer
  end
end
