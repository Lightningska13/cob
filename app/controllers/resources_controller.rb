class ResourcesController < ApplicationController
	# collection_select bombs if validations run unless we define 
	# @departments here. Doesn't work in New and Edit when validations run
	# put it here instead of in the view (where it works also with validations)
	# This is the same as including the @departments in each of the listed actions
  before_filter :instantiate_departments, :only => [:new, :edit, :create, :update]
  
  def instantiate_departments
  	@departments = Department.find(:all, :order => 'dept_name asc')
  	@page_title = "#{@current_action.titleize} Resources"
  end

  def sort
  	params[:sortable].each_with_index do |id, index|
  		Resource.update_all(['position=?', index+1], ['id=?', id])
  	end
  	render :nothing=>true
  end
  
  # GET /resources
  # GET /resources.xml
  def index
  	@page_title = ""
  	if params[:cat]
  		@cat = Rescat.find(params[:cat])
	    @resources = @cat.resources
	    @title_text= @cat.category
 	    @blurb= @cat.blurb
 	    @page_title= @page_title + @title_text 
  	elsif params[:dept]
  		@dept = Department.find(params[:dept])
	    @resources = @dept.resources.find(:all,:order=>"title")
	    @title_text= @dept.name
  	  @blurb= (@resources.size == 1 ? "There is 1 result." : "There are #{@resources.size} results.")
 	    @page_title= @page_title + @title_text 
  	elsif params[:showmin] #show minutes for the council
  		@dept = Department.find(params[:showmin])
	    @resources = @dept.resources.find(:all, :include=>:rescats, :conditions=>'rescats.id=2', :order=>'resources.position desc')
	    @title_text= @dept.name + ' Minutes'
  	  @blurb= (@resources.size == 1 ? "There is 1 result." : "There are #{@resources.size} results.")
 	    @page_title= @page_title + @title_text 
 		elsif params[:search] and (params[:search] != "")
	  	@resources = Resource.search(params[:search])
	    @title_text='Search Results'
  	  @blurb= (@resources.size == 1 ? "There is 1 result." : "There are #{@resources.size} results.")
 		elsif params[:all]
	  	@resources = Resource.find(:all, :include =>[:rescats], :conditions=>'rescats.category is null', :order=>'resource_type ASC, title ASC') 
	    @title_text='Uncategorized'
  	  @blurb= "These are NOT visible to the public by browsing, but will show up in a keyword search. They must be assigned to a category in order to be browsed."
 	  else
	    @resources = Resource.find(:all, :conditions => ['featured = ?',true], :order=>'position ASC')
	    @title_text='Featured Resources'
 	    @blurb=''
    end
    

    @rescats = Rescat.find(:all, :order=>"category")
    if admin?
    	@cursor_style = 'cursor:move;' # show drag cursor on sortable list
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @resources }
    end
  end

  # GET /resources/1
  # GET /resources/1.xml
  def show
    @resource = Resource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @resource }
    end
  end

  # GET /resources/new
  # GET /resources/new.xml
  def new
    @resource = Resource.new
    @button_text = 'Create'

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @resource }
    end
  end

  # GET /resources/1/edit
  def edit
    @resource = Resource.find(params[:id])
    @button_text = 'Update'
  end

  # POST /resources
  # POST /resources.xml
  def create
    @resource = Resource.new(params[:resource])

    respond_to do |format|
      if @resource.save
        flash[:notice] = 'Resource was successfully created.'
        format.html { redirect_to(@resource) }
        format.xml  { render :xml => @resource, :status => :created, :location => @resource }
      else
		    @button_text = 'Create'
        format.html { render :action => "new" }
        format.xml  { render :xml => @resource.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /resources/1
  # PUT /resources/1.xml
  def update
    params[:resource][:department_ids] ||= []
    params[:resource][:rescat_ids] ||= []
    @resource = Resource.find(params[:id])

    respond_to do |format|
      if @resource.update_attributes(params[:resource])
        flash[:notice] = 'Resource was successfully updated.'
        format.html { redirect_to(@resource) }
        format.xml  { head :ok }
      else
		    @button_text = 'Update'
        format.html { render :action => "edit" }
        format.xml  { render :xml => @resource.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.xml
  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy

    respond_to do |format|
      format.html { redirect_to(resources_url) }
      format.xml  { head :ok }
    end
  end
end
