class DashController < ApplicationController
	def index
    if admin?
    	@cursor_style = 'cursor:move;' # show drag cursor on sortable list
    end
    @page_title = "City Government Information for Marshall, Michigan"
		@faqs= Faq.find_for_home
  	@events = Event.find_for_home('Event','ASC')
  	@news = Event.find_for_home('News','DESC')
  	@resources = Resource.find_for_home
		
	end
end
