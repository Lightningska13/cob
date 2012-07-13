class RedoDeptUserJoin < ActiveRecord::Migration
  def self.up
	  drop_table :departments_users
  end

  def self.down
		create_table :departments_users, :id => false do |t|
			t.integer :department_id
			t.integer :user_id
		end
  end
end
