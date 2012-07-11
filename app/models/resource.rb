class Resource < ActiveRecord::Base
  has_attached_file :res 
	has_and_belongs_to_many :rescats
	has_and_belongs_to_many :departments, :order=>"name asc"
	
  validates_presence_of :res_file_name, :message => "( Document/URL ) cannot be empty"
  validates_presence_of :title
	acts_as_list
  
 	scope :featured, where(:featured => true)

  attr_accessible :title, :description, :featured, :department_ids, :rescat_ids, :res, :resource_type, :res_file_name
 # this before filter and associated function is supposed to allow the upload of a non-image file
	before_post_process :image?
 
	def image?
		!(res_content_type =~ /^image.*/).nil?
	end
	
  include PgSearch
  pg_search_scope :search, :against => [:title, :description], 
    :using  => {:tsearch  => {:dictionary => "english"}}
	
    # def self.search(search)
    #   if search
    #     search = search.to_s.downcase
    #     where(['lower(title) LIKE ? OR lower(description) LIKE ?', "%#{search}%", "%#{search}%"]).order('position asc')
    #   #else
    #   # find(:all)
    #   end
    # end

   	def self.find_for_home
   		where('featured = ?',true).order(:position)
   	end

   	def self.text_search(query)
   	  if query.present?
        search(query)
      else
        scoped
      end
   	end	
end
