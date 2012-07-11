class Faq < ActiveRecord::Base
	validates_presence_of :answer, :question 
	has_and_belongs_to_many :faq_categories
	belongs_to :department
	attr_accessible :featured, :url, :question, :answer, :department_id
	acts_as_list
	
	def self.find_for_home
		find(:all, :conditions=>['featured = ?', true], :order=>'position asc')
	end

end
