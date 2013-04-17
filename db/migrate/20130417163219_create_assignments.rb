class CreateAssignments < ActiveRecord::Migration
  def change
  	create_table :assignments do |t|
  		t.integer :user_id
  		t.integer :event_id
  	end
  	add_index :assignments, :user_id
  	add_index :assignments, :event_id
  end
end
