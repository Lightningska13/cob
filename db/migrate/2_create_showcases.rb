class CreateShowcases < ActiveRecord::Migration
  def self.up
    create_table :showcases do |t|
      t.string :title
      t.boolean :published
      t.datetime :publish_date
      t.text :blurb
      t.text :article
      t.text :sidebar
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size

      t.timestamps
    end
    
    create_table :showcase_images do |t|
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.integer :position
      t.text :caption
      t.integer :showcase_id

      t.timestamps
    end
    
    create_table :showcase_medias do |t|
      t.string :media_file_name
      t.string :media_content_type
      t.integer :media_file_size
      t.text :caption
      t.integer :showcase_id

      t.timestamps
    end
  end

  def self.down
    drop_table :showcase_medias
    drop_table :showcase_images
    drop_table :showcases
  end
end
