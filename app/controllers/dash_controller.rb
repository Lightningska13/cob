class DashController < ApplicationController
	def index
    if admin?
    	@cursor_style = 'cursor:move;' # show drag cursor on sortable list
    end
    @page_title = "County Government Information for Branch County, Michigan"
		@faqs= Faq.find_for_home
  	@events = Event.upcoming.event_type.home
  	@news = Event.upcoming.news_type.home
  	@resources = Resource.find_for_home
    @showcase = Showcase.find_for_home.first
		
	end
end
