class CreateResources < ActiveRecord::Migration
  def self.up
    create_table :resources do |t|
      t.string :resource_type
      t.string :title
      t.text :description
      t.string :res_file_name
      t.integer :res_file_size
      t.string :res_content_type
      t.boolean :featured
      t.integer :position
      t.integer :department_id

      t.timestamps
    end
  end

  def self.down
    drop_table :resources
  end
end
