class Department < ActiveRecord::Base
	has_many :events
	has_many :faqs
	has_and_belongs_to_many :resources
	has_many :contacts
	has_and_belongs_to_many :users
  has_attached_file :pic, :styles => { :tiny => "25x25#", :small => "72x72#", :medium => "150x150>"}
	attr_accessible :dept_fax, :description, :dept_name, :dept_email, :dept_location, :dept_mailing, :dept_phone, :dept_hours, :pic
	validates_presence_of :dept_name
	
	def self.get_contacts(dept)
		dept.contacts.find(:all, :order=>:position)
	end

end
