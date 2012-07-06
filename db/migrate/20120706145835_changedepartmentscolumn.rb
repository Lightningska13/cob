class Changedepartmentscolumn < ActiveRecord::Migration
  def change
    rename_column (:departments_users, :dept_id, :department_id)
  end
end
