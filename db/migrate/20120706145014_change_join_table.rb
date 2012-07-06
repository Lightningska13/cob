class ChangeJoinTable < ActiveRecord::Migration
  def change
    rename_table (:department_users_joins, :departments_users)
  end
end
