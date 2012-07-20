class ShowcaseImagesController < ApplicationController
  # GET /showcase_images
  # GET /showcase_images.xml
  def index
    @showcase = Showcase.find(params[:showcase_id])
    @showcase_images = @showcase.showcase_images
  end

  # GET /showcase_images/1
  # GET /showcase_images/1.xml
  def show

    @showcase = Showcase.find(params[:showcase_id])
    @showcase_image = @showcase.showcase_images.find(params[:id])
 
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @showcase_image }
    end
  end

  # GET /showcase_images/new
  # GET /showcase_images/new.xml
  def new
    @showcase = Showcase.find(params[:showcase_id])
    @showcase_image = @showcase.showcase_images.build
     
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @showcase_image }
    end
  end

  # GET /showcase_images/1/edit
  def edit
    @showcase = Showcase.find(params[:showcase_id])
    @showcase_image = @showcase.showcase_images.find(params[:id])
  end

  # POST /showcase_images
  # POST /showcase_images.xml
  def create

    @showcase = Showcase.find(params[:showcase_id])
    @showcase_image = @showcase.showcase_images.build(params[:showcase_image])

    if @showcase_image.save
      redirect_to edit_showcase_url(@showcase)
    else
      render :action => "new"
    end

  end

  # PUT /showcase_images/1
  # PUT /showcase_images/1.xml
  def update
    @showcase = Showcase.find(params[:showcase_id])
    @showcase_image = ShowcaseImage.find(params[:id])

    if @showcase_image.update_attributes(params[:showcase_image])
      redirect_to edit_showcase_url(@showcase)
    else
      render :action => "edit"
    end
  end

  # DELETE /showcase_images/1
  # DELETE /showcase_images/1.xml
  def destroy
    @showcase = Showcase.find(params[:showcase_id])
    @showcase_image = ShowcaseImage.find(params[:id])
    @showcase_image.destroy

    respond_to do |format|
      format.html { redirect_to edit_showcase_path(@showcase) }
      format.xml  { head :ok }
    end
  end
end
