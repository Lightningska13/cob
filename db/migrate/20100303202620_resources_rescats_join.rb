class ResourcesRescatsJoin < ActiveRecord::Migration
  def self.up
    create_table :rescats_resources, :id => false do |t|
      t.integer :rescat_id
      t.integer :resource_id
    end
  end

  def self.down
    drop_table :rescats_resources
  end
end
