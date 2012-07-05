class DepartmentResourceJoin < ActiveRecord::Migration
  def self.up
		create_table :departments_resources, :id => false do |t|
			t.integer :department_id
			t.integer :resource_id
		end
  end

  def self.down
	  drop_table :departments_resources
  end
end
