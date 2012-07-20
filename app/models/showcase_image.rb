class ShowcaseImage < ActiveRecord::Base
  has_attached_file :photo, :styles => { :tiny => "25x25#", :small => "72x72#", :medium => "150x150>"}
  belongs_to :showcase
  validates_presence_of :photo_file_name
  
  acts_as_list :scope => :showcase
  
  attr_accessible :photo, :caption
end
