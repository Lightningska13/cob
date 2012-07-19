# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  helper_method :current_user_session, :current_user
  helper_method :current_appicant_session, :current_applicant
  
  before_filter :dept_list
  before_filter :instantiate_controller_and_action_names
  before_filter :require_user, :except => [:index, :sort, :show]
  
 	
	def instantiate_controller_and_action_names
	      @current_action = action_name
	      @current_controller = controller_name
	end 

	# for new, edit, create and update page titles
	def set_page_title(title)
		@page_title = @current_action.titleize + title
	end
	
	def dept_list
		@dept_list= Department.order(:dept_name)
	end
	  
  def help
    Helper.instance
  end

  class Helper
    include Singleton
    include ActionView::Helpers::TextHelper
  end
  
  helper_method :admin?, :auth?, :applicant?    

#Simple authorization for accessing departmental information. Allow admins access to all departments
#check users to see if they are members of the passed department
#use auth? instead of admin? to check for ability to edit. admin? merely checks to see if logged in.
#
#Added optional res parameter to check the many-to-many relationship of resources with departments
    def auth?(dept=0,*res)
			if admin?
				if current_user.admin_level==10
					true 
				else
					unless res[0].nil?
						@authdept = Department.find(:all, :include=>[:users, :resources], :conditions=>"users.id=#{current_user.id} and resources.id=#{res}")
					else
						@authdept = Department.find(:all, :include=>:users, :conditions=>"users.id=#{current_user.id} and departments.id=#{dept}")
					end
					if @authdept.empty?
						false
					else
						true
					end
				end
		 end
   end    
   
  
  protected  
   def admin?  
     current_user ? true : false
   end    

   def applicant?  
     current_applicant ? true : false
   end    

	
	private
		def current_user_session
			return @current_user_session if defined?(@current_user_session)
			@current_user_session = UserSession.find
		end

		def current_user
			return @current_user if defined?(@current_user)
			@current_user = current_user_session && current_user_session.user
		end
		
    def require_user
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to root_url
        return false
      end
    end

		def current_applicant_session
			return @current_applicant_session if defined?(@current_applicant_session)
			@current_applicant_session = ApplicantSession.find
		end

		def current_applicant
			return @current_applicant if defined?(@current_applicant)
			@current_applicant = current_applicant_session && current_applicant_session.applicant
		end
		
    def require_applicant
      unless current_applicant or current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to jobs_url
        return false
      end
    end
 
    def require_no_applicant
      if current_applicant
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to root_url
        return false
      end
    end

    def require_no_user
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to account_url
        return false
      end
    end
    
    def store_location
      session[:return_to] = request.url
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
	
#Added to prevent editing of departmental/faq pages by direct URL entry
#Uses before filter on Department/Faq page

    def check_auth
    	if @current_controller == "faqs"
    		thisFaq = Faq.find(params[:id])
    		dept=thisFaq.department_id
    	elsif @current_controller == "departments"
    		dept=params[:id]
    	elsif @current_controller == "animals"
    	  thisdept=Department.find_by_dept_name('Animal Control')
    	  dept=thisdept.id
    	else
    		dept=0
    	end
    	
      unless auth?(dept)
        store_location
        flash[:notice] = "You do not have access this page " + @current_controller 
        redirect_to root_url
        return false
      end
    end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
