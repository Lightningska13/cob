class DropColumnsFromDepartmentUsers < ActiveRecord::Migration
  def up
      remove_column :departments_users, :created_at
      remove_column :departments_users, :updated_at
    end

    def down
      add_column :departments_users, :created_at, :datetime
      add_column :departments_users, :updated_at, :datetime
    end
end
