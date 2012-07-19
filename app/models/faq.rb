class Faq < ActiveRecord::Base
	validates_presence_of :answer, :question 
	has_and_belongs_to_many :faq_categories
	belongs_to :department
	attr_accessible :featured, :url, :question, :answer, :department_id, :faq_category_ids
	acts_as_list
	
  include PgSearch
  pg_search_scope :search, :against => [:question, :answer], 
    :using  => {:tsearch  => {:dictionary => "english"}}
	
   	def self.text_search(query)
   	  if query.present?
        search(query)
      else
        scoped
      end
   	end
  
    # def self.search(search)
    #  if search
    #     search = search.to_s.downcase
    #     where(['lower(question) LIKE ? OR lower(answer) LIKE ?', "%#{search}%", "%#{search}%"]).order('position ASC')
    #   end
    # end

	def self.find_for_home
		where('featured = ?',true).order(:position)
	end

end
