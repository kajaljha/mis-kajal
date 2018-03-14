class AddColumnsToNotification < ActiveRecord::Migration
  def change
  	add_column :notifications, :remark, :string
  	add_column :notifications, :published_at, :date
  	add_column :notifications, :published_by, :string
  end
end
