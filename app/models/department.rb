class Department < ActiveRecord::Base
	has_many :events
	has_many :faqs
	has_and_belongs_to_many :resources
	has_many :contacts
	has_and_belongs_to_many :users
  has_attached_file :logo, :styles => { :tiny => "25x25#", :small => "72x72#", :medium => "150x150>"}
	
	validates_presence_of :name
	
	def self.get_contacts(dept)
		dept.contacts.find(:all, :order=>:position)
	end

end
