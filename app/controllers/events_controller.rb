class EventsController < ApplicationController
	# collection_select bombs if validations run unless we define 
	# @departments here. Doesn't work in New and Edit when validations run
	# put it here instead of in the view (where it works also with validations)
	# This is the same as including the @departments in each of the listed actions
  before_filter :instantiate_departments, :only => [:new, :edit, :create, :update]
  
  def instantiate_departments
  	@departments = Department.find(:all, :order => 'id asc')
  	@page_title = "#{@current_action.titleize} Events"
  end
  # GET /events
  # GET /events.xml
  def index
  	unless admin?
  		@mycondition = " AND end_date >= '#{30.days.ago}'"
  	else
  		@mycondition = ''
  	end
  	
  	#set news/event defaults
  	if params[:t]=='News'
  		mytype="event_type='News'"
  		myorder='start_date desc'
	    @page_title = "Announcements for Marshall, Mi"
	    @eventHeader="Announcements / News"
	    unless admin?
	      @mycondition = @mycondition + " AND start_date<='#{Date.today}'"
	    end
  	else
   		mytype="event_type='Event'"
  		myorder='start_date asc'
	    @page_title = "Events for Marshall, Mi"
	    @eventHeader="Events and Happenings"
 		end
 		
	  @events = Event.find(:all, :order=>myorder, :conditions=>mytype + @mycondition)
    @event_months = @events.group_by { |e| e.start_date.beginning_of_month }

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])
    @page_title = @event.title

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new
    @button_text = 'Create'

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @button_text = 'Update'
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        flash[:notice] = 'Event was successfully created.'
        format.html { redirect_to(@event) }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        flash[:notice] = 'Event was successfully updated.'
        format.html { redirect_to(@event) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end
end
