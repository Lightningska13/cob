class CreateDepartmentUsersJoins < ActiveRecord::Migration
  def change
    create_table :department_users_joins do |t|
      t.integer :dept_id
      t.integer :user_id

      t.timestamps
    end
  end
end
