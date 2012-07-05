class FaqCategory < ActiveRecord::Base
	has_and_belongs_to_many :faqs, :order=>"position ASC"
end
