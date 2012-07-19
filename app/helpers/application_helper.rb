module ApplicationHelper

	# to highligh current link
	def section_link(name,options)
			#if options[:action] == @current_action and options[:controller] == @current_controller
			#changed this to just the controller - may change it back
			if options[:controller] == @current_controller
				 link_to(name, options, :class => 'active')
			else
				link_to(name,options)
			end
	end

  def format_url(this_url)
  	if this_url =~  /^http:\/\//i
   		this_url
   	else
 			this_url="http://#{this_url}"
 		end
  
  end

	def alpha_links(action)
	 return_text = '[ '
		('A'..'Z').to_a.each do |letter|
		 return_text = return_text + link_to(
			"#{letter} ", 
			:action => action, 
			:id => letter)
		 end    
	 return return_text + ' ]'
	end
	
	def get_icon(mime)
		if mime == "application/msword"
			thisClass = "word"
		elsif  mime == "application/ms-excel" or mime == "application/vnd.ms-excel"
			thisClass = "excel"
		elsif mime == "application/vnd.ms-powerpoint"
		  thisClass = "ppt"
		elsif  mime == "application/pdf"
			thisClass = "pdf"
		elsif  mime == "application/octet"
			thisClass = "pdf"
		else
			thisClass = "doc"
		end
		return thisClass
	end
	
	
	def strip_html(phrase)
		phrase.gsub(/<\/?[^>]*>/,  "")
	end
end
