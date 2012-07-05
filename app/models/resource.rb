class Resource < ActiveRecord::Base
  has_attached_file :res 
	has_and_belongs_to_many :rescats
	has_and_belongs_to_many :departments, :order=>"name asc"
	
  validates_presence_of :res_file_name, :message => "( Document/URL ) cannot be empty"
  validates_presence_of :title
	acts_as_list
  
 # this before filter and associated function is supposed to allow the upload of a non-image file
	before_post_process :image?
 
	def image?
		!(res_content_type =~ /^image.*/).nil?
	end
	
	def self.search(search)
		if search
			search = search.to_s.downcase
			find(:all, :conditions => ['lower(title) LIKE ? OR lower(description) LIKE ?', "%#{search}%", "%#{search}%"], :order=>'resource_type ASC, title ASC')
		#else
		#	find(:all)
	  end
	end

	def self.find_for_home
		find(:all, :conditions=>['featured = ?', true], :order=>'position asc')
	end
	

end
