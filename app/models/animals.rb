class Animals < ActiveRecord::Base
  attr_accessible :ac_id, :adoptable, :age, :arrival_date, :breed, :description, :final_date, :id, :location, :pic_content_type, :pic_file_name, :pic_file_size, :release_date, :sex, :species
end
