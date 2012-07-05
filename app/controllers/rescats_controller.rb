class RescatsController < ApplicationController
	
	# Skip the require_user filter set up in the application controller
	# as it allows access to index and show. Then reapply to protect everything
	skip_filter :require_user
	before_filter :require_user
	
  # GET /rescats
  # GET /rescats.xml
  def index
    @rescats = Rescat.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rescats }
    end
  end

  # GET /rescats/1
  # GET /rescats/1.xml
  def show
    @rescat = Rescat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rescat }
    end
  end

  # GET /rescats/new
  # GET /rescats/new.xml
  def new
    @rescat = Rescat.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rescat }
    end
  end

  # GET /rescats/1/edit
  def edit
    @rescat = Rescat.find(params[:id])
  end

  # POST /rescats
  # POST /rescats.xml
  def create
    @rescat = Rescat.new(params[:rescat])

    respond_to do |format|
      if @rescat.save
        flash[:notice] = 'Category successfully created.'
        format.html { redirect_to(rescats_path) }
        format.xml  { render :xml => @rescat, :status => :created, :location => @rescat }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rescat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rescats/1
  # PUT /rescats/1.xml
  def update
    @rescat = Rescat.find(params[:id])

    respond_to do |format|
      if @rescat.update_attributes(params[:rescat])
        flash[:notice] = 'Category successfully updated.'
        format.html { redirect_to(rescats_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rescat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rescats/1
  # DELETE /rescats/1.xml
  def destroy
    @rescat = Rescat.find(params[:id])
    @rescat.destroy

    respond_to do |format|
      format.html { redirect_to(rescats_url) }
      format.xml  { head :ok }
    end
  end
end
