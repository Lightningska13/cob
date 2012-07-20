class ShowcaseMedia < ActiveRecord::Base
  has_attached_file :media
  belongs_to :showcase
  validates_presence_of :media_file_name
  
  attr_accessible :media, :caption
 # this before filter and associated function is supposed to allow the upload of a non-image file
	before_post_process :image?
 
	def image?
		!(media_content_type =~ /^image.*/).nil?
	end

end
