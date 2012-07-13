class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :ac_id
      t.string :species
      t.string :sex
      t.string :age
      t.string :breed
      t.date :arrival_date
      t.date :release_date
      t.date :final_date
      t.boolean :adoptable
      t.string :location
      t.text :description
      t.string :pic_file_name
      t.string :pic_content_type
      t.integer :pic_file_size

      t.timestamps
    end
  end
end
