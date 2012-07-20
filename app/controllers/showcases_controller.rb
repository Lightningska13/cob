class ShowcasesController < ApplicationController
  before_filter :only => [:new, :edit, :create, :update] do |c|
  	mytitle=" Showcase"
  	c.set_page_title(mytitle)
  end
 
  def sort
  	params[:showcase_image].each_with_index do |id, index|
  		ShowcaseImage.update_all(['position=?', index+1], ['id=?', id])
   	end
 	render :nothing=>true
  end
  
  
  # GET /showcases
  # GET /showcases.xml
  def index
    @published = Showcase.published
    @showcases = Showcase.find(:all, :order=>'publish_date desc')
		@page_title = "Showcases"
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @showcases }
    end
  end

  # GET /showcases/1
  # GET /showcases/1.xml
  def show
    @showcase = Showcase.find(params[:id])
    @showpic = @showcase.photo_file_name
		@page_title = "Showcase - " + @showcase.title

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @showcase }
    end
  end

  # GET /showcases/new
  # GET /showcases/new.xml
  def new
    @showcase = Showcase.new
    @button_text = 'Create'
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @showcase }
    end
  end

  # GET /showcases/1/edit
  def edit
    @showcase = Showcase.find(params[:id])
    @button_text = 'Update'
    @showpic = @showcase.photo_file_name
  end

  # POST /showcases
  # POST /showcases.xml
  def create
    @showcase = Showcase.new(params[:showcase])

    respond_to do |format|
      if @showcase.save
        flash[:notice] = 'Showcase was successfully created.'
        format.html { redirect_to(@showcase) }
        format.xml  { render :xml => @showcase, :status => :created, :location => @showcase }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @showcase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /showcases/1
  # PUT /showcases/1.xml
  def update
    @showcase = Showcase.find(params[:id])
    if params[:delete_image]
    	@showcase.photo=nil
    end

    respond_to do |format|
      if @showcase.update_attributes(params[:showcase])
        flash[:notice] = 'Showcase was successfully updated.'
        format.html { redirect_to(@showcase) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @showcase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /showcases/1
  # DELETE /showcases/1.xml
  def destroy
    @showcase = Showcase.find(params[:id])
    @showcase.destroy

    respond_to do |format|
      format.html { redirect_to(showcases_url) }
      format.xml  { head :ok }
    end
  end
  
end
