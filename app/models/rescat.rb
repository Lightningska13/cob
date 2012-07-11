class Rescat < ActiveRecord::Base
	has_and_belongs_to_many :resources, :order=>"resource_type ASC, title asc"
	validates_presence_of :category
	attr_accessible :category, :blurb

end
