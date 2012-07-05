class Contact < ActiveRecord::Base
  has_attached_file :photo, :styles => { :tiny => "25x25#", :small => "72x72#", :medium => "98x116>", :large => "300x300>"}
	belongs_to :department
	
	acts_as_list :scope => :department

end
