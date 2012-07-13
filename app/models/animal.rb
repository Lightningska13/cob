class Animal < ActiveRecord::Base
 has_attached_file :pic, :styles => { :tiny => "36x36#", :small => "72x72#", :medium => "190"}
   attr_accessible :ac_id, :adoptable, :age, :arrival_date, :breed, :description, :final_date, :location, :pic, :release_date, :sex, :species
end
