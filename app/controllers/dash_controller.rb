class DashController < ApplicationController
	def index
    if admin?
    	@cursor_style = 'cursor:move;' # show drag cursor on sortable list
    end
    @page_title = "City Government Information for Marshall, Michigan"
		@faqs= Faq.find_for_home
  	@events = Event.upcoming.event_type.home
  	@news = Event.upcoming.news_type.home
  	@resources = Resource.find_for_home
		
	end
end
