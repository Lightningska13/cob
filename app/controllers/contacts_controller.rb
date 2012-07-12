class ContactsController < ApplicationController
  # GET /contacts
  # GET /contacts.xml
  
  def sort
  	params[:contact].each_with_index do |id, index|
  		Contact.update_all(['position=?', index+1], ['id=?', id])
   	end
 	render :nothing=>true
  end
  
  def index
    @department = Department.find(params[:department_id])
    @contacts = @department.contacts(:order=>:position)
  end

  # GET /contacts/1
  # GET /contacts/1.xml
  def show
    @department = Department.find(params[:department_id])
    @contact = @department.contacts.find(params[:id])
    @showpic = @contact.photo_file_name

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contact }
    end
  end

  # GET /contacts/new
  # GET /contacts/new.xml
  def new
    @department = Department.find(params[:department_id])
    @contact = @department.contacts.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contact }
    end
  end

  # GET /contacts/1/edit
  def edit
    @department = Department.find(params[:department_id])
    @contact = @department.contacts.find(params[:id])
    @showpic = @contact.photo_file_name
  end

  # POST /contacts
  # POST /contacts.xml
  def create
    @department = Department.find(params[:department_id])
    @contact = @department.contacts.build(params[:contact])

    if @contact.save
      redirect_to edit_department_url(@department)
    else
      render :action => "new"
    end
  end

  # PUT /contacts/1
  # PUT /contacts/1.xml
  def update
    @department = Department.find(params[:department_id])
    @contact = @department.contacts.find(params[:id])
    if params[:delete_image]
    	@contact.photo=nil
    end

    if @contact.update_attributes(params[:contact])
      redirect_to edit_department_url(@department)
    else
      render :action => "edit"
    end
   end

  # DELETE /contacts/1
  # DELETE /contacts/1.xml
  def destroy
    @department = Department.find(params[:department_id])
    @contact = @department.contacts.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to edit_department_path(@department) }
      format.xml  { head :ok }
    end
  end
end
