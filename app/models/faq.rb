class Faq < ActiveRecord::Base
	validates_presence_of :answer, :question 
	has_and_belongs_to_many :faq_categories
	belongs_to :department
	attr_accessible :featured, :url, :question, :answer, :department_id, :faq_category_ids
	acts_as_list
	
	def self.find_for_home
		where('featured = ?',true).order(:position)
	end

end
