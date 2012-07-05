class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.integer :id
      t.string :ac_id
      t.string :species
      t.string :sex
      t.string :age
      t.string :breed
      t.date :arrival_date
      t.date :release_date
      t.date :final_date
      t.string :adoptable
      t.string :location
      t.text :description
      t.string :pic_file_name
      t.integer :pic_file_size
      t.string :pic_content_type

      t.timestamps
    end
  end
end
