class CreateRescats < ActiveRecord::Migration
  def self.up
    create_table :rescats do |t|
      t.string :category
      t.text :blurb

      t.timestamps
    end
  end

  def self.down
    drop_table :rescats
  end
end
