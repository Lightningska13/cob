class Event < ActiveRecord::Base
 	belongs_to :department
 	
  def	self.find_for_home(event_type,order)
   	if event_type
   		this_condition = " AND event_type='#{event_type}'"
   		if event_type == 'News'
   			this_condition= "AND start_date<='#{Date.today}' " + this_condition
   		end
   	end
   	find(:all, :limit=>6, :order=>'start_date '+ order, :conditions=>"end_date >= '#{Date.today}' #{this_condition}" )
   end

   def	self.find_for_council(event_type)
    	if event_type
    		this_condition = " AND event_type='#{event_type}'"
    	end
    	find(:all, :limit=>6, :order=>'start_date ASC', :conditions=>"end_date >= '#{Date.today}' AND department_id=2 #{this_condition}" )
    end

end
