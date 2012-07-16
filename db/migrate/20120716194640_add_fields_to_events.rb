class AddFieldsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :placement, :string
  end
end
