class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :user_id
	    t.text :feedback
	    t.integer :punctuality
	    t.integer :communication
	    t.integer :behavior
	    t.integer :meet_to_deadline
      t.integer :daily_reporting
      t.integer :problem_solving
      t.integer :research_capabilities
      t.integer :self_motivated
      t.integer :understanding_of_tasks
      t.integer :working_in_a_team
      t.integer :overall_rating
      t.string :remark

      t.timestamps null: false
    end
  end
end
