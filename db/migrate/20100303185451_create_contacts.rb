class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.integer :department_id
      t.string :firstname
      t.string :lastname
      t.string :title
      t.string :email
      t.string :photo_file_name
      t.integer :photo_file_size
      t.string :photo_content_type
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
