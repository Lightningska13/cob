class DepartmentsController < ApplicationController
	before_filter :check_auth, :only=>[:edit]
 
  def sort
  	params[:sortable_thumbs].each_with_index do |id, index|
  		Contact.update_all(['position=?', index+1], ['id=?', id])
   	end
  	render :nothing=>true
  end
  
  # GET /departments
  # GET /departments.xml
  def index
    @departments = Department.all(:order=> "dept_name")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @departments }
    end
  end

  # GET /departments/1
  # GET /departments/1.xml
  def show
    @department = Department.find(params[:id])
    @showpic = @department.pic_file_name
    @faqs= @department.faqs.find(:all,:limit=>10, :order=>:position)
    @resources=@department.resources.find(:all,:limit=>10, :order=>:position)
    @contacts = Department.get_contacts(@department)
    if admin?
    	@cursor_style = 'cursor:move;' # show drag cursor on sortable list
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @department }
    end
  end

  # GET /departments/new
  # GET /departments/new.xml
  def new
    @department = Department.new
    @button_text = 'Create'

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @department }
    end
  end

  # GET /departments/1/edit
  def edit
    @department = Department.find(params[:id])
    @button_text = 'Update'
    @showpic = @department.pic_file_name
    @contacts = Department.get_contacts(@department)
  end

  # POST /departments
  # POST /departments.xml
  def create
    @department = Department.new(params[:department])

    respond_to do |format|
      if @department.save
        flash[:notice] = 'Department was successfully created.'
        format.html { redirect_to(@department) }
        format.xml  { render :xml => @department, :status => :created, :location => @department }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @department.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /departments/1
  # PUT /departments/1.xml
  def update
    @department = Department.find(params[:id])
    if params[:delete_image]
    	@department.pic=nil
    end

    respond_to do |format|
      if @department.update_attributes(params[:department])
        flash[:notice] = 'Department was successfully updated.'
        format.html { redirect_to(@department) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @department.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.xml
  def destroy
    @department = Department.find(params[:id])
    @department.destroy

    respond_to do |format|
      format.html { redirect_to(departments_url) }
      format.xml  { head :ok }
    end
  end
end
