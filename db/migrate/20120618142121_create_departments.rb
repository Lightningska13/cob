class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :dept_name
      t.string :dept_hours
      t.string :dept_phone
      t.string :dept_fax
      t.string :dept_email
      t.string :dept_location
      t.string :dept_mailing
      t.string :pic_file_name
      t.integer :pic_file_size
      t.string :pic_content_type

      t.timestamps
    end
  end
end
