class Showcase < ActiveRecord::Base
  has_attached_file :photo, :styles => { :tiny => "25x25#", :small => "72x72#", :medium => "150x150>", :large => "300x300>"}
  has_many :showcase_images, :order => :position
  has_many :showcase_medias
  validates_presence_of :title
  
  def	self.find_for_home
  	#find(:all, :limit=>1, :order=>'publish_date desc', :conditions=>"published = 'true'" )
  	where("published='true'").limit(1).order('publish_date desc')
  end
end
